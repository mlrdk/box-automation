box-automation
==============

[Using DevOps @home](http://devopsreactions.tumblr.com/post/85204023519/using-devops-tools-at-home)

Automation of installation and configuration of my boxes based on Debian Jessie.
Command to apply the play:

    ansible-playbook -i provision/inventory/local provision/site.yml --ask-sudo-pass
