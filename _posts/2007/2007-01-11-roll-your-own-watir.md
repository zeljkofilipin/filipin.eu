---
tags:  watir
title: Roll your own Watir
---
[Watir 1.5.1.1136 was released](http://wiki.openqa.org/display/WTR/Development+Builds) yesterday, but FileField#set does not work. They have fixed it, but it is not released yet. But still, you can use all those shiny new Watir methods.

How?!

Roll your own Watir using [TortoiseSVN](http://tortoisesvn.tigris.org/). Just make sure that you are logged in as administrator during installation. I am usually logged in as limited user, and to make it short, it does not work that way. Please, log in as administrator. If you can not, then I can not help you.

From [Installing a Gem from the latest development source](http://wiki.openqa.org/display/WTR/FAQ#FAQ-devgem) (Watir FAQ page).

> Once TortoiseSVN is installed, checkout the source:
>
> 1.  Create a folder to checkout into, this will be the *watir\_install\_dir*
> 2.  Right click on *watir\_install\_dir*, from the context menu select *SVN Checkout...*
> 3.  In the dialog box enter <http://svn.openqa.org/svn/watir/trunk/watir> for the url
> 4.  Hit *Ok*, Watir source should now download into the *watir\_install\_dir*
>
> Now that you have your own local copy of the source, you can create your own gem and install it into your local ruby gems directory. Open a command line, navigate to *watir\_install\_dir* and type the following:
>
> `gem build watir.gemspec`
>
> This will create a file that is named something like watir.1.5.1.1032.gem. The actual version number will be based on the latest revision number of the source in subversion.
>
> You can install your gem simply by typing this in the same directory:
>
> `gem install watir`

Some things are still broken. Like IE#minimize.

Why?! And I was so close...

Do not despair, you can fix that too (are you lucky or what?).

AutoIt is not registered. They say it should be, but it does not work on my machine.

Open a command line, go to folder where AutoItX3.dll is located. If you installed Ruby to C:\ruby\\ and your gem name is watir-1.5.1.1141 it should be C:\ruby\lib\ruby\gems\1.8\gems\watir-1.5.1.1141\watir\\

Type this.

`regsvr32 AutoItX3.dll`

Pop up will appear with message that registration was successful. If message says that registration was not successful, you are not logged in as administrator. Log out (or switch user) and log in as administrator. As I stated earlier, if you can not, then I can not help you.

[Th-th-th-that's all folks!](http://en.wikipedia.org/wiki/Porky_Pig)

P.S.

You can unregister AutoIt with this if, for example, you have trouble with uninstalling Watir.

`regsvr32 /u AutoItX3.dll`
