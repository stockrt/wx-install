#!/bin/bash

# Test (fail)
echo
echo "Trying to load wx (should fail)..."
cd /tmp
python -c "import wx" && echo "PASS" || echo "FAIL"
echo "Done."
echo
sleep 3

# System-wide (apt-get)
sudo apt-get -y update
sudo apt-get -y install dpkg-dev
sudo apt-get -y install python-gtk2-dev
sudo apt-get -y install libwxgtk2.8-dev
sudo apt-get -y install libglu1-mesa-dev

# Virtualenv (if active, or use sudo for system-wide installation)
cd /tmp
apt-get source -d wxwidgets2.8
dpkg-source -x wxwidgets2.8*dsc
cd wxwidgets2.8-2.8.12.1
cd wxPython
python setup.py install

# Test (pass)
echo
echo "Trying to load wx again (should pass)..."
cd /tmp
python -c "import wx" && echo "PASS" || echo "FAIL"
echo "Done."
echo
