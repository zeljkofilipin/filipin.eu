---
tags:  macos photo
title: macOS Lockdown Mode
---
# Security 🧀

I'm one of those people that thinks computer security can be best described as [Swiss cheese](https://en.wikipedia.org/wiki/Swiss_cheese_(North_America)). Nothing is absolutely secure. As with [physical security](https://en.wikipedia.org/wiki/Physical_security), you can only make it harder for people to break in. That will deter enough people to make security good enough.

# Banking 🏦

One thing that I'm particularly sensitive about is online banking. It's really convenient that you can do the vast majority of banking online. It's also very scary that somebody on the other side of the planet could take all of your money.

I feel very uncomfortable doing online banking on the same operating system where I install a lot of applications and development tools. [What’s the worst that could happen?](https://timotijhof.net/posts/2019/protect-yourself-from-npm/) Pretty much the end of the world. Or at least an empty bank account.

# Dual boot 🍎 🐧

For years, I had a [dual boot](dual-boot) setup, macOS and Ubuntu Linux. I mostly do software development. Most of it I would do on a macOS, some of it I would do on Ubuntu. I would set up a third operating system, a clean Ubuntu install. (I guess [multi-boot](https://en.wikipedia.org/wiki/Multi-booting) would be a more correct term than dual boot.) I would install a minimal Ubuntu install, then remove everything I could, except the browser that I need for online banking.

That's far from perfect. But it's good enough. There's a small chance that some malicious software might jump from one operating system to another. I'm willing to take that chance. For now.

# Lockdown Mode 🔐


![System settings](assets/macos-lockdown-mode/system-settings.png "System settings")

I recently got a new Apple machine with an M1 chip. I guess it's still possible to install Ubuntu on it, but I have failed so far. What I did manage to do is two macOS installations on a single machine. I use one macOS for banking. Then one day I stumbled upon [Lockdown Mode](https://support.apple.com/en-us/HT212650). It pretty much makes your machine unusable, but I only needed a browser anyway. Perfect. The only drawback I have noticed so far is that some fonts and/or images are not loaded, so some pages look strange. But, that's a small price to pay. A website (for example your bank) can be excluded from Lockdown Mode in Safari, but I didn't need to do that so far. I learned that today while reading about Lockdown Mode. 😅 It might come handy in the future.

![Safari lockdown enabled](assets/macos-lockdown-mode/safari-lockdown-enabled.png "Safari lockdown enabled")
![Safari lockdown off](assets/macos-lockdown-mode/safari-lockdown-off.png "Safari lockdown off")

# Dedicated Machine 💻

Having a dedicated machine for banking, with a minimal operating system, would be a better solution. I'm thinking about it. I do have a pretty old laptop that I still use when traveling. In a year or two it will probably be unusable for development. At that time it will probably become my dedicated banking machine.

I have used a dedicated banking machine for years with an even older laptop. Nowadays that machine takes forever to boot. It's also really slow when booted, so I gradually used it less and less. Dual boot proved to be secure enough and convenient enough. I'm not so worried about security that I think buying a dedicated banking machine would be a good investment.
