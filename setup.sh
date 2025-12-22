#!/bin/bash
# Quick start script for Linux Workspace setup

set -e

echo "================================================"
echo "  Linux Workspace Setup - Quick Start Script  "
echo "================================================"
echo ""

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "❌ Ansible is not installed!"
    echo ""
    echo "Please install Ansible first:"
    echo ""
    echo "For Debian/Ubuntu:"
    echo "  sudo apt update && sudo apt install -y ansible"
    echo ""
    echo "For Arch Linux:"
    echo "  sudo pacman -Sy ansible"
    echo ""
    exit 1
fi

echo "✓ Ansible is installed (version: $(ansible --version | head -n1))"
echo ""

# Check if running from the correct directory
if [ ! -f "playbook.yml" ]; then
    echo "❌ Error: playbook.yml not found in current directory!"
    echo "Please run this script from the LinuxWorkspace directory."
    exit 1
fi

echo "Starting Ansible playbook..."
echo ""
echo "You will be prompted for your sudo password."
echo ""

# Run the playbook
ansible-playbook playbook.yml --ask-become-pass

echo ""
echo "================================================"
echo "  Setup Complete!                             "
echo "================================================"
echo ""
echo "Next steps:"
echo "1. Open a new terminal to start using zsh"
echo "2. Configure powerlevel10k by running: p10k configure"
echo "3. Launch JetBrains Toolbox: /opt/jetbrains-toolbox/jetbrains-toolbox"
echo "4. Launch GitKraken: gitkraken"
echo ""
