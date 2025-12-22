# LinuxWorkspace

Automated Linux workspace setup using Ansible for Debian, Ubuntu, and Arch-based distributions.

## Features

This Ansible playbook automatically installs and configures:

- **Git** - Version control system
- **zsh** - Enhanced shell with oh-my-zsh framework
- **oh-my-zsh** - Community-driven framework for managing zsh configuration
- **powerlevel10k** - Feature-rich theme for zsh
- **zsh plugins** - Pre-configured plugins including:
  - git (built-in oh-my-zsh plugin for git aliases and info)
  - docker & docker-compose (completion and aliases)
  - sudo (press ESC twice to prefix command with sudo)
  - command-not-found (suggests package to install for unknown commands)
  - colored-man-pages (adds colors to man pages)
  - extract (universal archive extractor with 'x' command)
  - web-search (search the web from terminal, e.g., 'google query')
  - zsh-autosuggestions (command suggestions based on history)
  - zsh-syntax-highlighting (real-time syntax highlighting)
  - you-should-use (alias reminders)
  - zsh-bat (better cat with syntax highlighting)
- **zsh options** - Configured settings:
  - History timestamps in ISO format
  - Completion waiting dots
  - Auto-update disabled (manual updates)
  - Hyphen-insensitive completion
  - Command auto-correction enabled
  - Custom plugin options (YSU message position, autosuggestion colors)
- **JetBrains Toolbox** - Manage JetBrains IDEs (IntelliJ IDEA, PyCharm, etc.)
- **GitKraken** - Git GUI client
- **Vicinae/Neovim** - Modern text editor (placeholder implementation)

## Supported Distributions

- Debian-based: Debian, Ubuntu, Linux Mint, Pop!_OS, etc.
- Arch-based: Arch Linux, Manjaro, EndeavourOS, etc.

## Prerequisites

1. **Ansible** must be installed on your system:

   **For Debian/Ubuntu:**
   ```bash
   sudo apt update
   sudo apt install ansible
   ```

   **For Arch Linux:**
   ```bash
   sudo pacman -Sy ansible
   ```

2. **Git** (to clone this repository):
   ```bash
   # Debian/Ubuntu
   sudo apt install git
   
   # Arch Linux
   sudo pacman -S git
   ```

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/EckPhi/LinuxWorkspace.git
   cd LinuxWorkspace
   ```

2. Run the setup script (recommended):
   ```bash
   ./setup.sh
   ```

   Or run the Ansible playbook directly:
   ```bash
   ansible-playbook playbook.yml --ask-become-pass
   ```

   The `--ask-become-pass` flag will prompt for your sudo password.

## Usage

### Running the Complete Setup

To install everything:
```bash
ansible-playbook playbook.yml --ask-become-pass
```

### Running Specific Roles

To install only specific components, use tags or limit to specific roles:

```bash
# Install only zsh and oh-my-zsh
ansible-playbook playbook.yml --ask-become-pass --tags zsh

# Install only JetBrains Toolbox
ansible-playbook playbook.yml --ask-become-pass --tags jetbrains
```

### Customization

You can customize the installation by editing:
- `playbook.yml` - Main playbook file (comment out roles you don't need)
- `roles/*/tasks/main.yml` - Individual role tasks
- `group_vars/` - Group variables (if needed)

## Post-Installation

### Configure Powerlevel10k

After installation, when you first open zsh, you'll be prompted to configure powerlevel10k. Alternatively, you can run:
```bash
p10k configure
```

### Launch JetBrains Toolbox

1. Launch from application menu or run: `/opt/jetbrains-toolbox/jetbrains-toolbox`
2. Log in with your JetBrains account
3. Install your preferred IDEs (IntelliJ IDEA, PyCharm, WebStorm, etc.)

### Launch GitKraken

1. Launch from application menu or run: `gitkraken`
2. Sign in with your GitKraken/Axosoft account or use the free version

## Structure

```
LinuxWorkspace/
├── ansible.cfg           # Ansible configuration
├── inventory.ini         # Inventory file (localhost)
├── playbook.yml          # Main playbook
├── roles/                # Ansible roles
│   ├── common/           # Common packages (Git, wget, curl, etc.)
│   ├── zsh/              # zsh with oh-my-zsh and powerlevel10k
│   ├── jetbrains/        # JetBrains Toolbox App
│   ├── gitkraken/        # GitKraken Git client
│   └── vicinae/          # Vicinae/Neovim (placeholder)
└── README.md             # This file
```

## Troubleshooting

### Permission Errors
Make sure you run the playbook with `--ask-become-pass` to provide sudo privileges.

### Package Not Found
Some packages may have different names or may not be available in certain repositories. Check the role tasks and adjust package names if needed.

### JetBrains Toolbox Installation Issues
If the automatic download fails, you can manually download JetBrains Toolbox from:
https://www.jetbrains.com/toolbox-app/

### GitKraken Installation Issues
If the installation fails, you can manually download GitKraken from:
https://www.gitkraken.com/download

### oh-my-zsh Already Installed
If oh-my-zsh is already installed, the playbook will skip the installation and only update the powerlevel10k theme.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

This project is open source and available under the MIT License.

## Notes

- The default shell will be changed to zsh for the user running the playbook
- All installations are idempotent - you can run the playbook multiple times safely
- Some applications (JetBrains Toolbox, GitKraken) may require manual first-time setup after installation
