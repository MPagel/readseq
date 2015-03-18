Code update
----
Latest update 5 June 2012.  Version 2.02.

General information
====
This package replaces the 16 bit Readseq.exe (Don Gilbert) from the bioedit\apps directory with a version functional in 64-bit Windows operating system (XP, Vista, 7) which intrinsically does not support 16 bit applications, even in compatibility mode.

I have upgraded this replacement to utilize the java-based ReadSeq version 2, which should theoretically be a bit more stable than the old version.  Should you want it, I'll leave the old replacement on this website as well, in case you have difficulty installing or using this java-based replacement.

Both versions of the replacement are implemented by compiling a batch file to exe with 7-zip. The batch file calls either (version 2) the java version of readseq or (version 1) DOSBox which emulates a 16-bit DOS environment which in turn runs the original readseq program included in BioEdit.

Specific instructions for installation and dependencies required can be found in the batch file REM comments and/or instructions.txt.

My open source license is simply this: if you use this code in part of your coding work, I'd appreciate citation in the comments and documentation.  If you use this as-intended (for a BioEdit ReadSeq replacement/augmentation) and have a paper/chapter derived from results you obtain, I'd appreciate professional acknowledgement, but I by no means expect/require it.  If you don't agree to these terms and conditions, you can still download it and use it as you see fit, because I'm a nice guy who doesn't want to hire a lawyer;)

Matt Pagel<br>
Pennsylvania State University<br>
e-mail: `<my last name>` at cs.wisc.edu

News update
----
  * <b>October 2013:</b> testimonials and feedback from Tom Hall and others have been added at http://code.google.com/p/readseq/wiki/Feedback

  * <b>December 2013:</b> this patch is included in BioEdit as of version 7.2.5 (11 Dec 2013), but still requires manual installation. The following is from BioEdit's ReadMe.txt:
   Installing ReadSeq for 64-bit machines:<br>
   Don Gilbert's original readSeq sequence converter was a 16-bit application and does not operate on 64-bit Windows machines, even in compatibility mode.  <br>
   Mathew D. Pagel has produced a Java-based port readSeq that worked flawlessly when I tested it.  The original distribution of version 2.02 from https://code.google.com/p/readseq/downloads/detail?name=ReadSeqv202.zip&can=2&q= is included in the BioEdit installation with the author's permission to allow users to install a compatible version of readSeq if they wish.  Follow the instructions in the file "Instructions.txt" found in ReadSeqv202.zip within your BioEdit installation directory after installing BioEdit to install the updated port of readSeq.

  * <b>March 2015:</b> Migrated to Github from Google Code in advance of code.google's impending shutdown
