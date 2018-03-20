Title: Consuming Ansible Roles for Fun and Profit (but really just for fun with OpenVPN)
Date: 2018-03-20 12:53
Modified: 2018-03-20 12:53
Category: Code
Tags: linux, fedora, openvpn, fluff, ansible
Slug: consuming-ansible-roles-for-fun-and-profit
Authors: Jose R. Gonzalez
Summary: Having the ability to stand up a utility in 5 minutes is just an incredible thing to experience

I started working in technology at the tail end of a time where getting an open source application deployed for personal use in a home lab (or the like) carried with it a bit of a time investment reviewing and executing install docs. At my introduction to this industry, install documentation for applications deemed "stabled" (or otherwise a "stable" branch of an application) was really quite good, which historicaly has not always been the case. At this point, I could generally get things to work 90% of the time (a completely made up figured, as is standard on the internet). At most I would spend maybe half an hour for well-documented project to get a proof of concept stood up. Maybe an hour reviewing what I had done, and an hour after that would net me an application that had some bits tailored to my liking (domain integration, maybe proper private networking elements, or an entry in my *"production"* database of choice).

And then I would reach the pivotal moment where I would have to weigh the benefits of consuming the service as it stood against proper administration, which would likely involve reading through full configuration documentation for the project, reviewing their upgrade timelines, working out my automated upgrade methodology... and the list goes on and on. I imagine I'm not alone in proceeding with the former for simple/home-lab use in the interest of time.

We now live in a time where even this workflow is unnecessary - at least if you need a utility quickly.

I had made plans to get out of my home office to work on a project which meant consuming public Wi-Fi. I kept meaning to set up a simple OpenVPN setup for this momentous occasion. Unfortunately, procrastination took hold leading me to have to consider a last-minute decision to abort the plan and work in the home office. I had remembered finding the [Ansible role for Unbound](https://github.com/jdauphant/ansible-role-unbound) a while back when I was considering working on one myself and thought that I might be able to find the same for [OpenVPN](https://openvpn.net/). Naturally I came across several options, but ultimately decided to check out [this](https://github.com/kyl191/ansible-role-openvpn) project on github by [kyl191](https://github.com/kyl191). I won't lie, the reason I decided to try it is because the README contained an example playbook... and I'm literally ready to walk out the door so the fastest I can set this up, the better for me bottom line.

And... representative to the time we live in - It took approximately 10 minutes to get this configured and I was on my way... There were no issues, no questions to answer, no configurations to change. I stood up a public cloud server in the [Rackspace Cloud](https://www.rackspace.com/en-us/cloud), download the role locally and adjusted the client configuration names to be more relevant to me, set up the basic inventory file with the aformentioned cloud server IP and ran the playbook. From there, it's as simple as pulling down my `.ovpn` configuration file and imorting that into my OVPN [client](https://tunnelblick.net/). 

And this just worked.

Now, this is in no way an implication that this process is enough for any production-level application deployment. That is, administrators should always responsibly review application documentation and deployment procedures - and really should know just about everything that's necessary to deploy an application securely into production. Ignorance is bliss; due diligence is necessary to reduce the "ignorance" attack vector. But given the temporary nature of my needs here, the ease of deployment and overall experience is absolutely worth *celebrating*. As a realist, I understand that this level of out-of-the-box compatibility is not ubiquitous. I find that to be quite acceptable, but software is improving every day and that in itself is a phenomenal thing.
