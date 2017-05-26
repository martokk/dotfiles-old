#!/usr/bin/env bash

echo ' ' | sudo tee -a /etc/hosts
echo '# Computers' | sudo tee -a /etc/hosts

echo '192.168.1.80 desktop' | sudo tee -a /etc/hosts
echo '192.168.1.85 acer-laptop' | sudo tee -a /etc/hosts
echo '192.168.1.3 vserver' | sudo tee -a /etc/hosts
echo '192.168.1.3 vhome' | sudo tee -a /etc/hosts
