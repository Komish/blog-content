Title: Modifying your footer information in Pelican themes
Date: 2016-01-14 07:16
Category: Blogging
Tags: pelican, blogging
Slug: modify-footer-information-in-pelican-themes
Authors: Jose
Summary: A quick reference link to an article outlining a useful modification for user of the Pelican platform.

**Jason Verly**, Author of [MyGeekDaddy.net](http://mygeekdaddy.net) wrote a post that solved an interesting problem caused by using default, unmodified themes for the Pelican blogging software. It was brought to my attention that the footer in my current theme [Storm](https://github.com/redVi/storm) contained a hard-coded copyright value of 2014, clearly 2 years behind. 

Jason, in this **[post](http://mygeekdaddy.net/2015/01/09/never-change-your-pelican-footer-again/)** provides a quick javascript workaround to place in the footer files that help keep this information accurate. This helps us less web-developer centric peeps out a ton. It essentially amounts to modifying the hardcoded numerical value with the following javascript code:
```
<script type=text/javascript>document.write(new Date().getFullYear());</script>
```

One additional modification, for those of us who do not simply link the installed python themes to our themes directories where our Pelican site files reside, you have to run an update to your installed theme to push the change.
```
# pelican-theme -U <theme_name>
```
Thanks Jason! Truth be told, this post serves more as a bookmark for me when I forget how I modified the files down the road =D!
