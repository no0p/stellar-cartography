#!/bin/sh
sudo gem uninstall stellar_cartography 
gem build stellar_cartography.gemspec
sudo gem install $(ls stellar_cartography*.gem|tail -n 1)
