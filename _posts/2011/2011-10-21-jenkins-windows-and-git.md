---
tags:  photo software
title: Jenkins, Windows and Git
---
![jenkins logo](/assets/jenkins_logo.png "jenkins logo")

**Update**: managed to clone Git repository via Git/SSH.

Recently I have successfully set up [Jenkins CI](http://jenkins-ci.org/) (called [Hudson CI](http://hudson-ci.org/) until recently) in Windows 2008 virtual machine. It was not hard once I figured all the stuff that needs to be done, but it was far from trivial. At one point I almost gave up on Jenkins because I could not get it to clone Git repository. But with help from [Adam Goucher](https://twitter.com/#!/adamgoucher) I was able to get it working. More about that later in the post.

Since then I have been reading [Jenkins: The Definitive Guide](http://www.wakaleo.com/download-jenkins-the-definitive-guide) book and playing with Jenkins in the virtual machine. (By the way, there is free pdf version of the book, and $34.99-$49.49 print and ebook versions.) I am almost done with the book and I plan to write a short review after I read it.

[Continuous integration](http://en.wikipedia.org/wiki/Continuous_integration) server is not really useful when it is in a virtual machine on my laptop. Neither my laptop nor virtual machine work 24/7, and the point of continuous integration server is exactly that. Running 24/7.

So, today the time was right to get Jenkins working on a server. I am writing this to have a reminder how to set up Jenkins and Git on Windows, so I do not have to repeat setup nightmare ever again.

**Jenkins**

Jenkins installation is pretty simple and it is covered pretty well, both on the Jenkins web site and in the book. I have installed it as Windows native package, and I made my first mistake there. By default, Jenkins installs in `C:\Program Files\Jenkins\` (on 32-bit Windows) or `C:\Program Files (x86)\Jenkins\` (on 64-bit). I am really surprised that they do that. I had so many problems with Jenkins because it was installed in a folder with spaces in name. Install Jenkins in `C:\Jenkins`. (Ruby installed is smarter. It installs by default in `C:\Ruby`. But that is another story.)

After the installation, Jenkins will open your default web browser and go to it's home page, `http://localhost:8080/`. Another surprise. Since the server is in Switzerland, Internet Explorer language was set to French, and Jenkins was in French. Since I do not know any French, I had to change it to English. Go to *Internet Explorer &gt; Tools &gt; Internet Options &gt; General &gt; Languages* to change the default language.

**Jenkins Build Job**

With everything back to a language I know, it is the time to create a new job. Click link *New Job*. Another warning. Do not use spaces in job names. Jenkins creates folders for each job in `C:\Jenkins\jobs`, and if you name the job *build job*, it will create `C:\Jenkins\jobs\build job` folder. You already know spaces in folder names are a bad idea. Call your job something like *build*. After entering job name, select *Build a free-style software project* and click *OK*. *Configure job* page opens. Just click *Save* for now. That is it. You have created a job. It does not do anything for now, but we will get there. By the way, take a look at `C:\Jenkins\jobs\build`. There is just a `config.xml` file there for the moment. Do not change it.

**Jenkins Git Plugin**

The next thing we have to do is to get some source code on the machine. If you did not navigate away from the job page (`http://localhost:8080/job/build/`), click *Configure* link. You will notice that Git is not listed under *Source Code Management* at job configuration page. You have to install a plugin.

Go to Jenkins home page (it is `http://localhost:8080/`, to get there click *Jenkins* link in the top-left part of the page) and then click *Manage Jenkins &gt; Manage Plugins &gt; Available*. Check *Git Plugin* checkbox and click *Install*. Check *Restart Jenkins when installation is complete and no jobs are running* checkbox and wait for Jenkins to restart. This restarting Jenkins step is the strangest part. I am never sure when it has restarted. When I get bored waiting, I just go to Jenkins home page and it usually just works.

Go back to job configuration page, and you will see *Git* listed under *Source Code Management*. Click it and enter *URL of repository*. I will use Git read only URL from [watirbook](https://github.com/zeljkofilipin/watirbook) project. So, I will use `git://github.com/zeljkofilipin/watirbook.git`. Click button *Save*.

If you have Git installed, you are ready for the first build. It will actually just clone the repository, but it is a start. Click *Build Now* link. In *Build History* you will notice the first build. It failed for me. To debug the problem, click the build link (something like *Oct 20, 2011 7:57:19 PM*) and then *Console Output*. For me it said `Cannot run program "git.exe": CreateProcess error=2, The system cannot find the file specified`.

**Git**

Time to install Git. Download it from [Git home page](http://git-scm.com/). On download page select *Full installer for official Git for Windows*. I did not want to install it in `Program Files` folder, so I have installed it in `C:\Git`.

Try building the job again. It failed for me again, with the same error message. To fix the problem, you have to let Jenkins know where to find Git. Go to Jenkins configuration (*Jenkins &gt; Manage Jenkins*) and click *Configure System* (Do not confuse it with job configuration at *job &gt; Configure*.)

Under *Path to Git executable* you will see something like this: `There's no such executable git.exe in PATH...`. Replace `git.exe` with `C:\Git\cmd\git.cmd` and click button *Save*.

Do not replace `git.exe` with `C:\Git\bin\git.exe`. [Cloning repositories via Git/SSH will not work](http://stackoverflow.com/questions/7850395/jenkins-can-not-clone-git-repository-over-git-ssh-on-windows-2008-64-bit). Do not ask. I have spent an entire day on that.

Go back to *Configure System* page, and if you did everything right, there should not be any error message under *Path to Git executable*. Leave the page open for 5-10 seconds. I have noticed that sometimes the error message does not appear immediately.

Go back to the job and build it again. It should work now. Finally. You will notice blue ball next to the newest build (instead of red ball for failing builds). I am not sure why they use blue for passing builds when green is a convention. But, there is a fix for that. Install *Green Balls* plugin (*Jenkins &gt; Manage Jenkins &gt; Manage Plugins &gt; Available &gt; Green Balls&gt; Install &gt; Restart Jenkins.*) If you do not see the green balls, click ctrl+f5 to refresh the page.

**The Fun Starts Here**

The fun starts if you want to clone Git repository that is not public. Change repository URL to `git@github.com:zeljkofilipin/watirbook.git`. Build again. *Console Output* page was stuck for me at `Cloning repository origin` for a long time. You can cancel the build by clicking red *x* button in the top-right corner of the *Console Output* page. You will get the whole error message then. It said `ERROR: Could not clone repository`. I am not surprised since I did not even set up this machine for Git/SSH authentication.

Go to *Start &gt; Git GUI &gt; Help &gt; Show SSH key &gt; Generate Key*. When it asks for passphrase, leave it empty. Copy the key to clipboard and close Git GUI.

At GitHub go to *Account Settings &gt; SSH Public Keys &gt; Add another public key*. Enter something in *Title*, paste the key in *Key* and click *Add key*.

(If you are using Unfuddle go to *Personal Settings &gt; Public Keys &gt; New Public Key...*. Enter something in *Title*, paste the key in *Value* and click *Add*.)

Sometimes it takes a couple of minutes for the key to become valid.

Test the Git setup by opening Command Prompt and cloning the repository there. So, go to your *Desktop* folder in Command Prompt and clone the repository. Example for my watirbook repository would be:

`git clone git@github.com:zeljkofilipin/watirbook.git`

If Git complains that `The authenticity of host can't be established`, type *yes* when it asks `Are you sure you want to continue connecting (yes/no)`.

Everything worked just fine from the command line. Now I have Git repository at my desktop. But I want it in Jenkins. Try to build the job from Jenkins again. It still does not work. The same error message as the last time. This is the part where I almost gave up. The problem is that you have set Git/SSH authentication to work for your user (*zfilipin* in my case). But Jenkins is using Git as *Local System Account* instead of using it as *zfilipin*.

To fix this go to *Start &gt; Services &gt; Jenkins &gt; right click &gt; Properties &gt; Log On &gt; This account*, enter username and password and click *OK*. Restart Jenkins service (*right click &gt; Restart*). When I was trying this in virtual machine, my user did not have any password, so this did not work. The workaround is to create a password for the user.

Try building the job again. Everything should work just fine.
