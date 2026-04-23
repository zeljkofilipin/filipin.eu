---
tags:  code macos ruby
title: Git and Github on Mac
---
Once upon a time, there was a tester. He knew his way around [Ruby](http://www.ruby-lang.org/en/), [Watir](http://watir.com/), [SVN](http://subversion.tigris.org/), [Terminal](http://en.wikipedia.org/wiki/Apple_Terminal) and stuff like that. He heard people talk about [Git](http://git-scm.com/), and he decided to try it. But Git was strange. He was playing with it a bit, but did not have much luck with setting it up, so he decided to leave it for later.

One day he decided to run his existing Watir tests on Internet Explorer 8 (IE8). He was already running them on IE6 and IE7, so he thought that it would be a piece of cake. He fired up one of his Windows virtual machines, installed IE8 and started the tests.

One of the first things he noticed is that file uploads were not working. File upload pop up would appear, but Watir was not populating it with path to the file that should be uploaded. He thought:

> I think I know what is the problem. I have already heard that file uploads are not working if user has Windows language set to anything than English. It was something about the title of the pop up window.

And really, IE6 and IE7 had `Choose file` and IE8 had `Choose File to Upload` as pop up title.

IE6  
![ie6](/assets/2009/git-and-github-on-mac/ie6-300x256.jpg "ie6")

IE7  
![ie7](/assets/2009/git-and-github-on-mac/ie7-300x263.jpg "ie7")

IE8  
![ie8](/assets/2009/git-and-github-on-mac/ie8-299x261.jpg "ie8")

He added `C:\ruby\lib\ruby\gems\1.8\gems\watir-1.6.2` folder (that is where Watir lived on his Windows machine) to his Watir project in [NetBeans](http://www.netbeans.org/), and made a search for `Choose file`. The search found 12 matches in 2 files. Both files were in `watir-1.6.2\lib\watir` folder. Files were `input_elements.rb` and `winClicker.rb`. He said (to himself):

> I will try `input_elements.rb` first.

There he found an ugly long line that contained `Choose file` three times:

{% highlight ruby %}
system("rubyw -e \"require 'win32ole'; @autoit=WIN32OLE.new('AutoItX3.Control'); waitresult=@autoit.WinWait 'Choose file', '', 15; sleep 1; if waitresult == 1\" -e \"@autoit.ControlSetText 'Choose file', '', 'Edit1', '#{setPath}'; @autoit.ControlSend 'Choose file', '', 'Button2', '{ENTER}';\" -e \"end\"")
{% endhighlight %}

He replaced all three occurrences of `Choose file` with `Choose File to Upload`.

{% highlight ruby %}
system("rubyw -e \"require 'win32ole'; @autoit=WIN32OLE.new('AutoItX3.Control'); waitresult=@autoit.WinWait 'Choose File to Upload', '', 15; sleep 1; if waitresult == 1\" -e \"@autoit.ControlSetText 'Choose File to Upload', '', 'Edit1', '#{setPath}'; @autoit.ControlSend 'Choose File to Upload', '', 'Button2', '{ENTER}';\" -e \"end\"")
{% endhighlight %}

He tried file upload with Watir, and it worked! He was so proud, that he decided to share it with the world! Since Watir code recently moved from SVN to Git, it was also a perfect chance to try Git again. Watir code is hosted on [Github](http://github.com/), so he opened an account there.

![pricing-github](/assets/2009/git-and-github-on-mac/pricing-github-300x145.jpg "pricing-github")

He thought:

> I will need to download the latest Watir code, make the change there and contribute back.

He found [Watir repository](http://github.com/bret/watir/tree/master) and forked it. (It is polite to fork a repository on Github.)

![fork1](/assets/2009/git-and-github-on-mac/fork1-300x228.jpg "fork1")

He already had Git installed on his Mac. (Recently he became one of those cool people that use Macs.) He probably installed it a while ago when he tried Git for the first time.

He likes to have the newest versions of any software, so he [updated Git](http://code.google.com/p/git-osx-installer/).

Then he decided the time is right to download (or [clone](http://git-scm.com/), as Git calls it) his fork of Watir. Do not make the same mistake he did! He cloned the repository using `public clone URL` (`git://github.com/zeljkofilipin/watir.git`). No, no and NO! You should use `your clone URL` (`git@github.com:zeljkofilipin/watir.git`) (He wants to say thanks to [Bret Pettichord](http://pettichord.com/) for teaching him that valuable lesson.) He found those links at Github after logging in and forking the Watir repository.

![your-dashboard-github](/assets/2009/git-and-github-on-mac/your-dashboard-github-300x169.jpg "your-dashboard-github")

![zeljkofilipin\_s-watir-at-master-github](/assets/2009/git-and-github-on-mac/zeljkofilipin_s-watir-at-master-github-300x85.jpg "zeljkofilipin_s-watir-at-master-github")

But, before cloning he had to create SSH keys. He found the instructions at [Github account](https://github.com/account) page. There was a link with a friendly name: [Need help with public keys?](http://github.com/guides/providing-your-ssh-key). Oh, he needed help!

He followed the instructions. Do not name your files `github` and `github.pub`, like he did. Leave default file names, otherwise it will not work. You do not need a passphrase for now. Leave it blank. (He wants to say thanks to [Mislav Marohnić](http://github.com/mislav) for teaching him all that SSH stuff.)

{% highlight shell %}
$ cd .ssh
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/zeljko/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /Users/zeljko/.ssh/id_rsa.
Your public key has been saved in /Users/zeljko/.ssh/id_rsa.pub.
{% endhighlight %}

Now he had `id_rsa` and `id_rsa.pub` files. He gave contents of `id_rsa.pub` to [Github](https://github.com/account). (You should keep your `id_rsa` as a secret. Never show it to anybody. Not even your best friend. Seriously.)

![your-account-github](/assets/2009/git-and-github-on-mac/your-account-github-300x86.jpg "your-account-github")

Now that chain of trust was made, he got the repository to his machine.

{% highlight shell %}
git clone git@github.com:zeljkofilipin/watir.git
{% endhighlight %}

He saw something like this:

{% highlight shell %}
$ git clone git@github.com:zeljkofilipin/watir.git
Initialized empty Git repository in /Users/zeljko/Documents/github/watir/.git/
The authenticity of host 'github.com (65.74.177.129)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,65.74.177.129' (RSA) to the list of known hosts.
remote: Counting objects: 13296, done.
remote: Compressing objects: 100% (4837/4837), done.
remote: Total 13296 (delta 8584), reused 11936 (delta 8216)
Receiving objects: 100% (13296/13296), 7.50 MiB | 549 KiB/s, done.
Resolving deltas: 100% (8584/8584), done.
{% endhighlight %}

He made the changes to the code with NetBeans. That was not such a good idea. But, I will talk about that later.

Then he committed the change to the local repository.

{% highlight shell %}
$ cd watir/
$ git add watir/lib/watir/input_elements.rb
$ git commit -m 'Fixed file uploads for IE8'
{% endhighlight %}

Finally, he pushed the change back to Github:

{% highlight shell %}
git push
{% endhighlight %}

He saw something like this:

{% highlight shell %}
$ git push
Counting objects: 11, done.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 530 bytes, done.
Total 6 (delta 5), reused 0 (delta 0)
To git@github.com:zeljkofilipin/watir.git
2a244f9..038e96b master -> master
{% endhighlight %}

In a blink of eye, he was already at Github looking proudly at [his commit](http://github.com/zeljkofilipin/watir/commit/038e96b52200a5d86b477654ef166c9a995ab9a7).

![commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin\_s-watir-github](/assets/2009/git-and-github-on-mac/commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github-300x168.jpg "commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github")

But, he made one last mistake. (This is the last mistake. I promise. No more mistakes in this story. Enough is enough.) He did not know how to do a diff with Git, and NetBeans messed the whitespace, so his commit was a whitespace mess. Of course, he did not know how to undo. So, he just deleted his local and Github repositories and started over. (He had to wait a bit until he saw `fork` button again on Bret's Watir repository.)

This time, he did everything right. After he pushed the change, he was so proud, that he decided to ask [Bret Pettichord](http://github.com/bret), the owner of the original Watir repository to merge his change with the original repository. That is called `pull request`.

![commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin\_s-watir-github-2](/assets/2009/git-and-github-on-mac/commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github-2-300x82.jpg "commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github-2")

![commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin\_s-watir-github-1-1](/assets/2009/git-and-github-on-mac/commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github-1-1-273x300.jpg "commit-038e96b52200a5d86b477654ef166c9a995ab9a7-to-zeljkofilipin_s-watir-github-1-1")

Don't just love happy ends?! :)

**Update:** Bret Pettichord [points out](http://groups.google.com/group/watir-general/browse_thread/thread/89dfd45bdca2d305) that instead of deleting local and Github repositories after messing up the whitespace, our hero could undo the change with this:

{% highlight shell %}
git reset HEAD~
git push
{% endhighlight %}
