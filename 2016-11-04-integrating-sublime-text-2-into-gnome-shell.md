Title: Simple Sublime Text 2 Install in Fedora 24
Date: 2016-11-04 1:12
Category: Linux
Tags: fedora, linux, editors, gnome-shell
Slug: sublime-text-2-on-fedora-24-with-gnome-shell
Authors: Jose R. Gonzalez
Summary: Quick Notes for integrated Sublime Text 2 with an RPM Distribution of Linux using Gnome Shell 3.20

In a world of a milliion plenty-capable text editors, users tend to return to their favorite based on workflow elements that they are used to. With a recent switch to a Fedora Workstation, I wanted to get my workflow close to home. [Sublime Text2](https://sublimetext.com/2) provides simple Linux x86_64 tarballs to easily run the application in any distribution, but a few manual modifications a required to integrate the executable file provided by Sublime Text into Gnome Shell to achieve the same level of workflow I've grown accustomed.

I find the most important workflow element is the ability to launch Sublime Text via a Gnome Launcher. Realistically, I want to be able to add it to my "favorites" (i.e. have it listed in the dock on the left side of my screen) as well as launch the application by simple hitting Super+"Sublime" to utilize Gnome Search.

![sublime-text-tarball-extracted]({filename}/images/sublime-text-tarball-extracted.png)

The tarball provides you with an executable, some icon files, and the necessary libraries and python bits that as an end-user I don't really care too much about. Gnome Shell relies on `.desktop` files for launcher configuration files but Sublime Text does not provide one. I didn't know the syntax off hand so I borrowed from Gedit which can be found in `/usr/share/applications/org.gnome.gedit.desktop`. This file has a lot of localization bits to it, but you can strip those out if they're not important to you. The resultant file for me looked like this:

```
[Desktop Entry]
Encoding=UTF-8
Name=Sublime Text 2
Exec=/home/username/applications/sublimetext2/Sublime\ Text\ 2
Icon=/home/username/applications/sublimetext2/Icon/256x256/sublime_text.png
Type=Application
StartupNotify=true
Categories=TextEditor;Development;Programming;
MimeType=text/plain;
```

I place this file in `~/applications` along with my Sublime Text 2 application for safe keeping - I then symlinked this file to `~/.local/share/applications/` as this is the default per-user launcher location. Keeping everything together in `~/applications` is not required and is simply a habit I'm working on to condense modifications into my home directory, but it does make things a bit easier to track down the line when it's time to pick up your home directory and move to a clean install (as opposed to `/opt/` which I've used frequently before).

You'll note that my Exec line and subsequent executable file for Sublime Text has spaces - typically I avoid spaces like the plague when dealing with files at the commandline but this one served a specific use case.

```
Exec=/home/username/applications/sublimetext2/Sublime\ Text\ 2
```

The Alt+Tab window in Gnome Shell appears to take this executable name into account. From a user experience perspective, I felt it was expected to be properly capitolized and spaced in my UI so I've made this adjustment. This doesn't impact my need to run it via the command line as I never utilize this case, but if you should need to you could easily create a symlink to this executable to provide easier access. I keep a separate `~/bin/` directory in my path for cases like this.

At this point, Gnome Shell documentation suggestions running an update of the desktop database to process your changes:

```update-desktop-database```

From my experience, this didn't work the first time. After several Gnome Shell restart (`alt+F2`, `r`, `<enter>`) I eventually hit a point where I needed to simply restart my computer and on reboot the Icon was searchable and launchable via Gnome's integrated search.

![gnome-search-result-sublime]({filename}/images/gnome-shell-search-sublime.png)
