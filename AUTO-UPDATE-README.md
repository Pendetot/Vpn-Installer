# VPN Installer Auto-Update System

This auto-update system automatically checks for updates from the GitHub repository and updates the VPN installer when new versions are available.

## Features

- **Automatic Updates**: Checks for updates on every login and hourly via systemd timer
- **Manual Control**: Enable/disable auto-updates and force updates when needed
- **Backup System**: Automatically creates backups before updating
- **Rollback Support**: Can restore from backup if update fails
- **Visual Feedback**: Update progress shown with spinner animation
- **Logging**: Comprehensive logging of all update activities
- **Configuration**: Customizable settings via configuration file

## Installation

The auto-update system is automatically installed when you run the main setup script:

```bash
bash setup.sh
```

Or install manually:

```bash
bash install-auto-update.sh
```

## Usage

### Command Line Interface

```bash
# Check for updates
vpn-update

# Force update
vpn-update force

# Enable auto-update
vpn-update enable

# Disable auto-update
vpn-update disable

# Check status
vpn-update status
```

### Menu Interface

Access the auto-update menu from the main VPN installer menu:
1. Run `menu` command
2. Select option `9` for Auto-Update System
3. Use the interactive menu to manage updates

## Configuration

Edit the configuration file at `/etc/vpn-installer/config`:

```bash
nano /etc/vpn-installer/config
```

Available settings:
- `AUTO_UPDATE_ENABLED`: Enable/disable auto-updates (true/false)
- `UPDATE_CHECK_INTERVAL`: Check interval in seconds (default: 3600)
- `BACKUP_ENABLED`: Enable backup before update (true/false)
- `MAX_BACKUPS`: Maximum number of backups to keep
- `SHOW_NOTIFICATIONS`: Show update notifications (true/false)
- `AUTO_RESTART_SERVICES`: Auto-restart services after update (true/false)

## Files and Directories

- **Auto-update script**: `/usr/local/bin/auto-update.sh`
- **Login script**: `/etc/profile.d/vpn-auto-update.sh`
- **Configuration**: `/etc/vpn-installer/config`
- **Log file**: `/var/log/vpn-auto-update.log`
- **Repository**: `/opt/vpn-installer`
- **Backup**: `/opt/vpn-installer-backup`

## How It Works

1. **Login Check**: When you log into the VPS, the system checks if it's time for an update check
2. **Version Comparison**: Compares local repository version with remote GitHub version
3. **Automatic Update**: If updates are available and auto-update is enabled, downloads and applies updates
4. **Backup**: Creates backup before applying updates
5. **Rollback**: If update fails, automatically restores from backup
6. **Notification**: Shows update status and results

## Systemd Integration

The system includes systemd timer for periodic checks:

```bash
# Check timer status
systemctl status vpn-auto-update.timer

# View logs
journalctl -u vpn-auto-update.service
```

## Troubleshooting

### Check Logs
```bash
tail -f /var/log/vpn-auto-update.log
```

### Manual Update
```bash
vpn-update force
```

### Reset Configuration
```bash
rm /etc/vpn-installer/config
vpn-update enable
```

### Disable Auto-Update
```bash
vpn-update disable
```

## Security

- Updates are fetched from the official GitHub repository
- Backup system ensures you can rollback if needed
- All operations are logged for audit purposes
- Root privileges required for system modifications

## Support

For issues or questions:
- Check the log file: `/var/log/vpn-auto-update.log`
- Use the menu system for interactive troubleshooting
- Telegram: @masventot
