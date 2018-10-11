---
tags:  code filipin
title: Embed Facebook Album
---
I usually take a few photos when I go to an [event](/event). 📸 I've tried several options of hosting photos and Facebook proved to be the best. A few years ago, Facebook had an option to embed the entire album, but they have removed it. Albums no longer have `embed` option. `Get Link` is the closest.

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fzeljko.filipin%2Fposts%2F10156741026372290%3A0&width=500" width="500" height="206" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

Link looks like this:

    https://www.facebook.com/media/set/?set=a.10156741019502290&type=1&l=3ac6e2c52b

I've noticed that there is `embed` option for a photo. 🖼

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10156741019592290%26set%3Da.10156741019502290%26type%3D3&width=500" width="500" height="503" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>


That's not what I want to do! I want to embed the entire album!

Googling for `embed facebook album` did not help. It's full of old advice while there still was an `embed` option for albums. Newer posts are full of third party tools. It's enough that I'm hosting photos at Facebook, I don't need another link in the chain that could break.

I did not give up. In `Options`, a photo has `Get Link` and `Embed`.

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10156741019577290%26set%3Da.10156741019502290%26type%3D3&width=500" width="500" height="155" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

Link:

    https://www.facebook.com/photo.php?fbid=10156668378402290&l=49e7b99a67

Embed:

    <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10156741019592290%26set%3Da.10156741019502290%26type%3D3&width=500" width="500" height="503" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

I've thought it would be as easy as finding and replacing `10156668378402290` and `49e7b99a67` from the link, but no luck. I've found `10156668378402290` in the `iframe`, but not `49e7b99a67`.

The solution is to click `Advanced Settings` at the `Embed this Post`. It opens [Embedded Posts](https://developers.facebook.com/docs/plugins/embedded-posts) page with photo URL already entered.

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10156741408292290%26set%3Da.10156741019502290%26type%3D3&width=500" width="500" height="299" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

Paste album link into `URL of post` field, click `Get Code` button, click `IFrame` option and you'll get the code.

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10156741413492290%26set%3Da.10156741019502290%26type%3D3&width=500" width="500" height="190" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

It will look like this:

    <iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fmedia%2Fset%2F%3Fset%3Da.10156741019502290%26type%3D1%26l%3D3ac6e2c52b&width=500&show_text=true&height=655&appId" width="500" height="655" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

This is how it looks like at a web page:

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fmedia%2Fset%2F%3Fset%3Da.10156741019502290%26type%3D1%26l%3D3ac6e2c52b&width=500&show_text=true&height=655&appId" width="500" height="655" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>
