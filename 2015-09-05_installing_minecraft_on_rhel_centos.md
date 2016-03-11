Title: Installing Minecraft Server on RHEL/CentOS 6
Date: 2015-09-05 10:42
Category: Self-Hosted
Tags: gaming, self-hosted
Slug: installing-minecraft-on-rhel
Authors: Jose R. Gonzalez
Summary: Setting up a Minecraft Server using OpenJDK on CentOS/Red Hat Enterprise Linux 6

Installing Minecraft Server on a YUM based distribution is as simple as obtaining the Minecraft package, matching up the Java version with the minecraft version (not required), and starting the minecraft.jar application.

First — checking to see what Java options we have installed. OpenJDK should be fine for this purpose.

```
(root@server)# yum provides java
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
1:java-1.7.0-openjdk-1.7.0.55-2.4.7.1.el6_5.x86_64 : OpenJDK Runtime Environment
Repo : updates
Matched from:
Other : java

1:java-1.7.0-openjdk-1.7.0.45-2.4.3.3.el6.x86_64 : OpenJDK Runtime Environment
Repo : base
Matched from:
Other : java

1:java-1.6.0-openjdk-1.6.0.0-5.1.13.3.el6_5.x86_64 : OpenJDK Runtime Environment
Repo : updates
Matched from:
Other : java

1:java-1.7.0-openjdk-1.7.0.45-2.4.3.4.el6_5.x86_64 : OpenJDK Runtime Environment
Repo : updates
Matched from:
Other : java

1:java-1.6.0-openjdk-1.6.0.0-3.1.13.1.el6_5.x86_64 : OpenJDK Runtime Environment
Repo : updates
Matched from:
Other : java

java-1.5.0-gcj-1.5.0.0-29.1.el6.x86_64 : JPackage runtime compatibility layer
: for GCJ
Repo : base
Matched from:
Other : java

1:java-1.7.0-openjdk-1.7.0.51-2.4.4.1.el6_5.x86_64 : OpenJDK Runtime Environment
Repo : updates
Matched from:
Other : java

1:java-1.6.0-openjdk-1.6.0.0-1.66.1.13.0.el6.x86_64 : OpenJDK Runtime
: Environment
Repo : base
Matched from:
Other : java

java-1.5.0-gcj-1.5.0.0-29.1.el6.x86_64 : JPackage runtime compatibility layer
: for GCJ
Repo : installed
Matched from:
Other : Provides-match: java

```

Once we’ve verified that this is available, install Java on the system and verify version and that it can be called using ‘java’ at the command line.

```
(root@server)# yum install java
///truncated///
(root@server)# which java
/usr/bin/java
(root@server)# java -version
java version "1.5.0"
gij (GNU libgcj) version 4.4.7 20120313 (Red Hat 4.4.7-4)

Copyright (C) 2007 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

We’ll need to have Screen installed as well in order for our java instances not to freeze our shell.

```
(root@server)# yum install screen -y
///truncated///
Running Transaction
  Installing : screen-4.0.3-16.el6.x86_64                                   1/1
  Verifying  : screen-4.0.3-16.el6.x86_64                                   1/1

Installed:
  screen.x86_64 0:4.0.3-16.el6

Complete!
```

Create a directory that will maintain your Minecraft Server files. If you have multiple Minecraft Servers that are on the same device, you will need an individual directory for each.

```
(root@server)# mkdir /minecraft
(root@server)# cd /minecraft
```

Once you’re in this directory, go ahead and download the .jar file. Use the -O flag of wget to rename the file on input. Modify the versions below to meet your standards. If the link is incorrect, just find the needed link for the version you need.

```
(root@server)# wget -O mc_1.7.2.jar \
> https://s3.amazonaws.com/Minecraft.Download/versions/1.7.4/minecraft_server.1.7.4.jar
```

At this point, you’ll need to start a screen session in order to be able to run the server .jar file without locking down the shell for that user. Start the Java instance once you’ve entered the screen session. Modify the resources being used here as needed.

```
(root@server)# screen -S 'minecraft_one'
(root@server)# java -Xmx512M -Xms512M -jar mc_1.7.2.jar nogui
```

Drop out of screen without killing the session with ‘CTRL-A+D’

If you have iptables actively handling traffic, you’ll need to modify your configuration to allow traffic via the port that you set in server.properties.

That’s all that should be necessary to install Minecraft on an existing YUM-based server distribution. For dpkg/APT based distributions, the process should be similar, substituting standard install procedures using those package managers.
