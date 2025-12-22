# Contributing to LinuxWorkspace

Thank you for your interest in contributing to LinuxWorkspace!

## How to Contribute

### Reporting Issues

If you encounter any issues or have suggestions:

1. Check if the issue already exists in the issue tracker
2. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Your OS and version
   - Ansible version

### Adding New Roles

To add support for new software:

1. Create a new role directory under `roles/`:
   ```bash
   mkdir -p roles/your-role/tasks
   ```

2. Create `roles/your-role/tasks/main.yml` with:
   - Debian/Ubuntu package installation tasks
   - Arch Linux package installation tasks
   - Any additional configuration needed

3. Add the role to `playbook.yml`:
   ```yaml
   roles:
     - common
     - zsh
     - your-role  # Add here
   ```

### Role Structure

Each role should follow this pattern:

```yaml
---
# Description of what this role does

- name: Install package (Debian/Ubuntu)
  apt:
    name: package-name
    state: present
  when: ansible_os_family == "Debian"

- name: Install package (Arch)
  pacman:
    name: package-name
    state: present
  when: ansible_os_family == "Archlinux"

# Additional configuration tasks...
```

### Testing

Before submitting a pull request:

1. Validate YAML syntax:
   ```bash
   ansible-playbook --syntax-check playbook.yml
   ```

2. Test on a clean VM or container if possible
3. Document any new dependencies or requirements

### Pull Request Guidelines

1. Create a descriptive PR title
2. Describe what your changes do
3. Reference any related issues
4. Ensure all YAML files are properly formatted
5. Update README.md if adding new features

## Code Style

- Use 2 spaces for indentation in YAML files
- Add comments explaining complex tasks
- Use descriptive task names
- Group related tasks together

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
