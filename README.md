#####Note: this is the repository branch for the first version of the ReadSeq replacement that uses a program called DOSBox to interact with the traditional (DOS, non-Java) version of ReadSeq.  Please check the "master" branch for the current version referred to below.

Code update
====
Latest update 5 June 2012.  Version 2.02.

General information
----
This package replaces the 16 bit Readseq.exe (Don Gilbert) from the bioedit\apps directory with a version functional in 64-bit Windows operating system (XP, Vista, 7) which intrinsically does not support 16 bit applications, even in compatibility mode.

I have upgraded this replacement to utilize the java-based ReadSeq version 2, which should theoretically be a bit more stable than the old version.  Should you want it, I'll leave the old replacement on this website as well, in case you have difficulty installing or using this java-based replacement.

Both versions of the replacement are implemented by compiling a batch file to exe with 7-zip. The batch file calls either (version 2) the java version of readseq or (version 1) DOSBox which emulates a 16-bit DOS environment which in turn runs the original readseq program included in BioEdit.

Specific instructions for installation and dependencies required can be found in the batch file REM comments and/or instructions.txt.

My open source license is simply this: if you use this code in part of your coding work, I'd appreciate citation in the comments and documentation.  If you use this as-intended (for a BioEdit ReadSeq replacement/augmentation) and have a paper/chapter derived from results you obtain, I'd appreciate professional acknowledgement, but I by no means expect/require it.  If you don't agree to these terms and conditions, you can still download it and use it as you see fit, because I'm a nice guy who doesn't want to hire a lawyer;)

Matt Pagel<br>
Pennsylvania State University<br>
e-mail: `<my last name>` at cs.wisc.edu

News update
====
  * <b>October 2013:</b> testimonials and feedback from Tom Hall and others have been added at http://code.google.com/p/readseq/wiki/Feedback

  * <b>December 2013:</b> this patch is included in BioEdit as of version 7.2.5 (11 Dec 2013), but still requires manual installation. The following is from BioEdit's ReadMe.txt:
   Installing ReadSeq for 64-bit machines:<br>
   Don Gilbert's original readSeq sequence converter was a 16-bit application and does not operate on 64-bit Windows machines, even in compatibility mode.  <br>
   Mathew D. Pagel has produced a Java-based port readSeq that worked flawlessly when I tested it.  The original distribution of version 2.02 from https://code.google.com/p/readseq/downloads/detail?name=ReadSeqv202.zip&can=2&q= is included in the BioEdit installation with the author's permission to allow users to install a compatible version of readSeq if they wish.  Follow the instructions in the file "Instructions.txt" found in ReadSeqv202.zip within your BioEdit installation directory after installing BioEdit to install the updated port of readSeq.

  * <b>March 2015:</b> Migrated to Github from Google Code in advance of code.google's impending shutdown

Feedback: testimonials
====
<b>Tom Hall</b> (creator, programmer of BioEdit). October 9, 2013:
----

 ...
 I wanted to say, I just found your program and found it quite impressive.  It worked flawlessly for me with my first test with nexus export/import.

 I got an email this morning from {redacted} from Universidade Estadual de Santa Cruz wondering why BioEdit didn’t work on her new Windows 8 machine.  I wrote back and said that normally it does and asked her to describe the problem she was having.  It turned out she was trying to export nexus format and a message would pop up stating that readSeq is incompatible with 64-bit Windows.  I told her I’d look into whether compatible conversion utilities have been developed because I don’t feel like I have time to try to write more read/write format filters directly into BioEdit.  Your program popped right out on top of a Google search and it worked flawlessly, so I emailed her back pointing to your web link https://code.google.com/p/readseq/

 I also appreciated your explanation for why you don’t care to try to follow up on whether people follow your license agreement.  That’s basically the same reason I don’t bother trying to make money off of BioEdit (too much trouble, involves lawyers, I want people to have access to free tools that work, I’m more interested in my “leave me alone” disclaimer than proactively chasing money, etc).

 I was wondering if it would be OK if I packaged your version of readSeq with a BioEdit installation...

 Either way, thank you for writing a converter that works in 64-bit Windows.  That’s a nice tool to have available.

 
 Best Regards,

 -Tom
 
 Thomas Hall, Ph.D.<br>
 Director, Development<br>
 Ibis Biosciences, Abbott<br>
 2251 Faraday Ave., Suite 150<br>
 Carlsbad, CA 92008<br>

 {phone, fax & cell number and e-mail redacted}


Erik Pollmann. August 15, 2012
----
 Just a thanks for "fixing" BioEdit for 64bit OS for me {readseq.exe}. I can't really state how deeply grateful I am - running BioEdit in a virtual machine on my Win7 system really was a pain. And especially the last version (2.02 - hint, the instructions.txt has not been updated to accommodate the 'junctions no longer required' part) is so easy to use that I can just hand it to others without having to hand-hold the installation.

 Just again - thank you very much!

 With best regards,<br>
 Erik Pollmann<br>
 VH Berlin Versuchsanstalt der Hefeindustrie e.V. (VH Berlin)<br>
 Research Institute for Baker's Yeast<br>
 Seestrasse 13<br>
 D-13353 Berlin

Additional Feedback
----
Do you have any suggestions or comments?  Contact me at `<my last name>` at cs.wisc.edu.  Please note that it may take a week or two (or even a year in the case of one e-mail!) to see your e-mail and respond.

Links
====
<a href=http://www.evga.com/forums/tm.aspx?high=&m=1267978>16 bit applications in 64 bit 7/Vista</a><br />
<a href=http://www.mbio.ncsu.edu/bioedit/bioedit.html>BioEdit homepage</a><br />
<a href=http://iubio.bio.indiana.edu/soft/molbio/readseq/>Don Gilbert's ReadSeq</a><br />
<a href=http://www.oracle.com/technetwork/java/javase/downloads/jre-7u3-download-1501631.html>Java Runtime Environment</a><br />
<a href=http://www.7-zip.org/>7-zip</a><br />
