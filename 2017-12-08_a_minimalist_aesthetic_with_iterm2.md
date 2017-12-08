Title: A Minimalist Aesthetic in iTerm2
Date: 2017-12-08 00:17
Category: Workstation
Tags: workstation, development
Slug: a-minimalist-aesthetic-with-iterm2
Authors: Jose R. Gonzalez
Summary: A minimalist, visually-appealing configuration for iTerm2

![iterm2-capture-screenfetch]({filename}/images/iterm2-capture-screenfetch.png)

I spend a decent amount of time paging through workstation setups on [r/unixporn](https://reddit.com/r/unixporn) (don't worry it's completely SFW!) and I find quite a few configurations that feature a minimalist terminal that, combined with a decent typeface, makes few a pretty enticing terminal experience. As I spend a good amount of time at a terminal, I figured it was worth diving into given that most of the work to achieve this minimalist appearance can be done with native iTerm2 (at least with a beta build - Build 3.1.5.beta.2 used in this post).

This setup removes the title bar giving you a "window" proper with no frills - this is the primary piece that gives you the minimalist aesthetic to your setup. Getting this achieved in this iTerm2 configuration is simple - under iTerm2 Preferences subsection labeled "Profile" > "Window". Here you're looking for a style drop down in which one option should be "No Title Bar". Since this is profile-specific, switching between a profile WITH a title and a profile without is simple. This is also how you achieve a drop-down configuration akin to Guake, if that's your thing.

![iterm2-title-preferences]({filename}/images/iterm2-title-preferences.png)

With no title bar, your text now goes from edge to edge in your terminal window - which gives off a clutter to your workspace. At a minimum, you can apply a top and bottom margin to resolve this problem as the left-to-right spacing technically looks the same whether the title bar is present or not. Either way, adding some margin to all sides will give you a cleaner look and can be achieved application-wide as an advanced setting. Playing around with the values here helps you find something comfortable, and while they might take a restart of the application to take effect - mine were updating immediately.

![iterm2-margin-preferences]({filename}/images/iterm2-margin-preferences.png)

The last bit is subjective, but if your scroll bar is visible it distracts about from the minimalist configuration that's put in place currently. That said, if you find yourself in massively long sessions having the scroll bar is a functionality you cannot live with out. I find this to be the case less frequently for myself, so removing the scroll bar is a must. The [Logitech Performance MX](https://www.amazon.com/Logitech-Wireless-Performance-Mouse-Large/dp/B002HWRJBM/ref=sr_1_2?ie=UTF8&qid=1512714965&sr=8-2&keywords=Logitech+MX+Performance) mouses free-scroll solves this problem if I absolutely must need to scroll a large amount. Lastly, Leaving your border lines adds a necessary contrast between your wallpaper and your terminal window.

![iterm2-style-preferences]({filename}/images/iterm2-style-preferences.png)

The finished product is an appealing minimalistic view - especially with other applications closed or minimized and out of the way - allowing me to focus on a single set of things at once when needed.

![iterm2-capture-busy]({filename}/images/iterm2-capture-busy.png)

For a bit of extra minimalism, reducing the clutter in your PS2 prompt can add an extra bit of visual value while still keeping information you need visible as seen in my setup here. In execution, you might initially have difficulty moving this window around. This is easily solved by grabbing an edge on a side that does not move the direction you want to move the window. So as an example, moving the window up and down should prompt you to grab the left or right edges (edges designated for scaling the window horizontally) and then dragging parallel to the edge you've which should allow you to move it.

The font in use here is [Fantasque Sans](https://fontlibrary.org/en/font/fantasque-sans-mono).

All in all, I'm pleased with the result. While aesthetic for these kinds of things is secondary to getting work done using these tools - there's something to be said about having an aesthetic to appeals to you in the tools you work with (an argument commonly brought up in discussions about GUI frameworks consumed by workstation-oriented linux distributions).

Have fun!
