@ECHO OFF
echo Readseq Replacement v2.02. Now with Java power!
REM Requires Java runtime 1.1 or higher
REM Readseq source: http://iubio.bio.indiana.edu/soft/molbio/readseq/java/
setlocal enabledelayedexpansion
SET DRIVE="C:"
IF EXIST %HOMEDRIVE% (SET DRIVE=%HOMEDRIVE%) ELSE (IF EXIST %SystemDrive% (SET DRIVE=%SystemDrive%) ELSE (SET DRIVE="C:"))
!DRIVE!
IF EXIST "!DRIVE!\BioEdit\Apps\readseq.exe" (
  SET READSEQ="c:\BioEdit\Apps"
) ELSE (
  IF EXIST "%ProgramFiles%\BioEdit\Apps\readseq.exe" ( 
    SET READSEQ="%ProgramFiles%\BioEdit\Apps"
  ) ELSE (
    IF EXIST "%ProgramFiles(x86)%\BioEdit\Apps\readseq.exe" SET READSEQ="%ProgramFiles(x86)%\BioEdit\Apps"
  )
)
REM Priority to the C:\bioedit version, then equal-bit Program to WindowsOS, then 32 bit Programs directory in 64 bit Windows
REM unsure if temp files will all work properly if bioedit path has spaces in it - are all needed lines quoted?
REM also unsure if clipboard is unicode or somehow has a different character coding if the import will work
@ECHO ON
CD "%READSEQ%"
@ECHO OFF
endlocal

echo Augmenting ReadSeq executable and batch files written for imports by Matt Pagel
echo Utilizing tools: 
echo 1) flip - not included in exe 
echo.     (https://ccrma.stanford.edu/~craig/utility/flip/flip.exe)
echo 2) ReadSeq v2 from indiana.edu - included as readseq.jar
echo Compiled using 7-Zip's batch-to-executable tool at 
echo http://surfnet.dl.sourceforge.net/project/sevenzip/7-Zip/9.22/7z922_extra.7z
echo Using the guide by Jason Faulkner at SysadminGeek.com
REM on second-try calls, IN is actually ~temp.tmp
SET IN=%3
echo input file: %IN%

IF EXIST "%IN%" ( 
  FOR /F "usebackq" %%A IN ('%IN%') DO (
    set TEMPDIR=%%~dpA
    echo DIRECTORY %%~dpA is the temp directory of BioEdit
  )
)
REM echo temp %TEMPDIR%
SET OUT="%TEMPDIR%~temp.tmp"
SET T1="%TEMPDIR%~t1.tmp"
SET T2="%TEMPDIR%~t2.tmp"
SET T3="%TEMPDIR%~t3.tmp"
SET T4="%TEMPDIR%~t4.tmp"
SET T5="%TEMPDIR%~t5.tmp"
SET T6="%TEMPDIR%~t6.tmp"
SET B="%TEMPDIR%~t7.tmp"
SET TALL="%TEMPDIR%~t?.tmp"
type "%IN%" > "%B%"
REM Make sure there is a copy pre-alteration. TYPE rather than COPY, which would output a line to screen
echo adding blank line to end of clipboard
echo. >> "%IN%"
echo Setting clipboard text to windows-compatible if tool installed
flip.exe -d "%IN%"
echo reparsed input
type "%IN%"
echo Calling the Java version of ReadSeq
echo %*
java -cp readseq.jar run %*
echo check if an output file was created...if not, input is malformed
IF NOT EXIST "%OUT%" (
  set sz=0
)
IF EXIST "%OUT%" ( 
  FOR /F "usebackq" %%A IN ('%OUT%') DO (
    set sz=%%~zA
    echo File %%A exists.
  )
)
echo output file %OUT% filesize: %sz%
REM echo infile:
REM type %IN%
REM echo outfile:
REM type %OUT%
if %sz% GTR 0 GOTO FINISHUP

echo There was a problem with the default read
echo Forcing fasta format. assumes one sequence input
echo ^>clipboard > "%T1%"
type "%IN%" >> "%T1%"
REM echo. >> "%T1%" ; already taken care of
echo about to delete input file
del "%IN%"
echo about to move temp in place
move "%T1%" "%IN%"
echo moved
echo infile:
type "%IN%"
echo outfile:
type "%OUT%"
java -cp readseq.jar run %*
IF EXIST "%OUT%" ( 
  FOR /F "usebackq" %%A IN ('%OUT%') DO (
    set sz=%%~zA
    echo File %%A exists.
  )
) ELSE (
  echo Output File Not Created - Forcing.
  type "%IN%" > "%OUT%"
)
echo output file %OUT% filesize: %sz%
REM entering finishup
:FINISHUP
type "%OUT%" > "%T6%"
SET /a COUNT1=0
SET /a COUNT2=0

for /f %%l in ('findstr /n "ORIGIN" "%T6%"') do for /f "delims=:" %%a in ('echo %%l') do call :chknxt %%a

IF %COUNT1% EQU 0 GOTO FIN
REM c3 will be the count of lines that have "DEFINITION" - count2 has "ORIGIN" lines * "DEFINITION" lines
set /a c3=%COUNT2%/%COUNT1%
echo %COUNT1% %COUNT2% %c3%
IF %COUNT1% NEQ %c3% (call :FAIL) ELSE (call :WHEE)
GOTO FIN

:chknxt
SET FIRST=%1
SET /a COUNT1=%COUNT1%+1
for /f %%i in ('findstr /n "DEFINITION" "%T6%"') do for /f "delims=:" %%b in ('echo %%i') do call :chkdesc %%b %FIRST%
GOTO:EOF

:chkdesc
SET /a COUNT2=%COUNT2%+1
SET SECOND=%1
SET F=%2
echo %FIRST% %F%
GOTO:EOF

:FAIL
echo Re-formatting genbank file to make it compatible with readseq.  Allows for multi-gb file as initial input.
type "%OUT%" > "%T4%"
setlocal enabledelayedexpansion
set /a cnt=0
REM get line numbers of ORIGIN with findstr
for /f %%j in ('findstr /n "ORIGIN" "%T4%"') do for /f "delims=:" %%c in ('echo %%j') do (call :insnxt %%c !cnt!)&(set /a cnt+=1)
type "%T4%" > "%OUT%"
endlocal
GOTO:EOF

:insnxt
IF EXIST "%T3%" (
  DEL "%T3%"
)
SETLOCAL enabledelayedexpansion
SET /a endval=%1-1
SET /a counter=0-%2
echo %1 %2
type "%T4%">"%T5%"
REM not sure what's with the multiline piping thing immediately below, but it seems to work ;)
for /f %%N in ('find /c /v "" ^<"%T5%"') do set cnt2=%%N 
<"%T5%" (
  for /l %%N in (1 1 %cnt2%) do (
    REM make sure that g doesn't have a value from previous iteration just in case there's nothing to set it to.
    set "g="
    REM then set g from T4/T5 input
    set /p "g="
    if !counter! NEQ %endval% (
      echo(!g! >> "%T3%"
      set /a counter+=1
    ) else (
REM this assumes all-or-nothing.  That there are no DEFs for any ORIGINs - not sure what having two def lines for some ORIGINs would do.  possibly blank/duplicated entries in bioedit
      echo(DEFINITION  clipboard value >> "%T3%"
      echo(!g! >> "%T3%"
      set /a counter+=1
      set /a cnt+=1
    )
  )
)
ENDLOCAL
REM type %T3%
type "%T3%" > "%T4%"
GOTO:EOF

:WHEE
echo file already had def lines
GOTO:EOF

:FIN
echo cleaning up...
echo %*
REM echo infile
REM type %IN%
echo outfile
type "%OUT%"
REM echo tempfile
REM type %T1%
REM echo backfile
REM type %B%
echo delete the true temp files and then convert both remaining files to the output file contents (for re-run simplicity)
REM pause
del "%TALL%"
type "%OUT%" > "%IN%"
REM echo Resetting clipboard ; or not
REM del %IN%
REM move %B% %IN%

@echo on
@EXIT /b 0
