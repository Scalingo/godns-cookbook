godns CHANGELOG
=================

This file is used to list changes made in each version of the godns cookbook.

Changes up to 1.6.3 2021-10-15
------------------------------
- [Soulou] Fix systemd unit file to correctly start godns on boot

Changes up to 1.6.2 2021-09-29
------------------------------
- [Soulou] Missing quotes in configuration file when using `zone` parameter

Changes up to 1.6.1 2021-09-29
------------------------------
- [Soulou] Update godns to 1.6

Changes up to 1.6.0 2021-09-28
------------------------------
- [Soulou] Add 'zone-*' parameters for new features of godns

Changes up to 1.5.2
-------------------

- [Soulou] Fix order of operations when extracting godns binary, do it before creating Systemd unit file

Changes up to 1.5.0
-------------------

- [Soulou] Update godns to 1.5

Changes up to 1.4.2
-------------------

- [Soulou] Do not replace default DNS, should be handled by other cookbook if required

Changes up to 1.4.1
-------------------

- [Soulou] Add `interval` in the config file

Changes up to 1.4.0
-------------------

- [Soulou] Update default version to 1.4

Changes up to 1.3.4
-------------------

- [Soulou] Fix systemd service configuration
- [Soulou] Update default version to 1.3

Changes up to 1.2.2
------------------

- [Soulou] Correctly copy godns resolv.conf file
- [Soulou] Typo in attribute name
- [Soulou] Compatibility with godns 1.2
- [Soulou] Compatibility with Systemd

0.1.0
-----
- [Soulou] - First version of cookbook

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
