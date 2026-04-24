---
tags:  TODO image
title: Internet Information Services Installation Nightmare (Resolved)
---
I just do not understand what happened. I tried to install Internet Information Services (IIS) but it kept complaining that it needs Windows XP Professional Service Pack 2 (SP2) CD. The first error message was "The file 'staxmem.dll' on Windows XP Professional Service Pack 2 CD is needed."

![staxmem.png](/assets/staxmem.png "staxmem.png")

I do not have that CD. I only have Windows XP Professional SP1 CD that I got with my machine. The funny thing is that I have installed IIS before at this machine and I do not remember that I had problems with that. I looked around and found out that the problem is that I have SP2 installed, but only SP1 CD.

I found the solution at [webservertalk.com](http://webservertalk.com/message380029.html)

[Download SP2](http://www.microsoft.com/downloads/details.aspx?FamilyId=049C9DBE-3B8E-4F30-8245-9E368D3CDB5A&displaylang=en) from Microsoft. Open Command Prompt and navigate to folder where SP2 is located and type

`WindowsXP-KB835935-SP2-ENU.exe /?`

Window with title Extracting Files will appear.

![extracting.png](/assets/extracting.png)

After it is done, temporary directory will be created in C:\\ with funny name like 94340997294df09a342ed3029c. Also, window with title Service Pack 2 Setup will appear.

![sp2.png](/assets/sp2.thumbnail.png)

Temporary directory is deleted when you click OK, so leave it open until you are done with IIS installation.

Finally, you can start (or continue) with IIS installation. When Windows says that it can not find staxmem.dll point it to C:\\sp2 temp folder\]\i386, and when it asks for adsutil.vbs point it to C:\\sp2 temp folder\]\i386\ip.

You can use this trick with SP2 whenever Windows asks you for Windows XP Professional Service Pack 2 CD. I successfully installed USB drivers in VMware virtual machine that way.
