#!/bin/bash
# =============================================================================
# sync-to-sharepoint.sh
# Pulls latest outputs from GitHub and syncs them to your OneDrive-synced
# SharePoint Documents/Clients folder.
#
# SETUP (one-time):
# 1. Open OneDrive on your Mac → Sign in with casey@up-scale.ai
# 2. Go to SharePoint > Communication site > Documents
# 3. Click "Sync" to sync the Documents library to your Mac
# 4. Find the sync path (usually ~/Library/CloudStorage/OneDrive-SharedLibraries-UpScale/Documents)
# 5. Update SHAREPOINT_DOCS below with that path
# 6. Clone the repo: git clone https://github.com/upscale-casey/7-initial-skill-routine.git
# 7. Update REPO_DIR below with the clone path
# 8. Make executable: chmod +x sync-to-sharepoint.sh
# 9. Optional: set up as a cron job (see bottom of this file)
# =============================================================================

# ── CONFIGURATION ────────────────────────────────────────────────────────────
# Path to your local clone of the GitHub repo
REPO_DIR="$HOME/7-initial-skill-routine"

# Path to your OneDrive-synced SharePoint Documents folder
# Common locations:
#   ~/Library/CloudStorage/OneDrive-SharedLibraries-UpScale/Documents
#   ~/Library/CloudStorage/OneDrive-SharedLibraries-Upscale/Documents
# Check Finder sidebar or: ls ~/Library/CloudStorage/
SHAREPOINT_DOCS="$HOME/Library/CloudStorage/OneDrive-SharedLibraries-UpScale/Documents"
# ─────────────────────────────────────────────────────────────────────────────

set -e

echo "$(date '+%Y-%m-%d %H:%M:%S') — Starting sync..."

# Validate paths
if [ ! -d "$REPO_DIR" ]; then
    echo "ERROR: Repo not found at $REPO_DIR"
    echo "Clone it first: git clone https://github.com/upscale-casey/7-initial-skill-routine.git $REPO_DIR"
    exit 1
fi

if [ ! -d "$SHAREPOINT_DOCS" ]; then
    echo "ERROR: SharePoint Documents folder not found at $SHAREPOINT_DOCS"
    echo "Make sure OneDrive is syncing your SharePoint Documents library."
    echo "Available CloudStorage folders:"
    ls ~/Library/CloudStorage/ 2>/dev/null || echo "  (none found)"
    exit 1
fi

# Pull latest from GitHub
cd "$REPO_DIR"
echo "Pulling latest from GitHub..."
git pull origin main --quiet

# Create Clients folder in SharePoint if it doesn't exist
CLIENTS_DIR="$SHAREPOINT_DOCS/Clients"
mkdir -p "$CLIENTS_DIR"

# Sync each client folder from repo to SharePoint
if [ -d "$REPO_DIR/clients" ]; then
    for client_dir in "$REPO_DIR/clients"/*/; do
        if [ -d "$client_dir" ]; then
            client_name=$(basename "$client_dir")
            dest="$CLIENTS_DIR/$client_name"

            echo "Syncing $client_name..."
            mkdir -p "$dest"

            # Use rsync to copy only new/changed files
            rsync -av --update "$client_dir" "$dest/" --quiet

            echo "  ✓ $client_name synced to SharePoint"
        fi
    done
    echo "$(date '+%Y-%m-%d %H:%M:%S') — Sync complete."
else
    echo "No clients/ folder in repo yet. Nothing to sync."
fi

# =============================================================================
# CRON SETUP (optional — runs every 10 minutes):
# Run: crontab -e
# Add: */10 * * * * /path/to/sync-to-sharepoint.sh >> /tmp/sharepoint-sync.log 2>&1
#
# OR for launchd (recommended on Mac), create ~/Library/LaunchAgents/com.upscale.sharepoint-sync.plist
# =============================================================================
