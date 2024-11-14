#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting the installation process..."

# Step 1: Install Homebrew if it's not already installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Step 2: Install Git
echo "Installing Git..."
brew install git

# Step 3: Install Google Chrome
echo "Installing Google Chrome..."
brew install --cask google-chrome

# Step 4: Install Slack
echo "Installing Slack..."
brew install --cask slack

# Step 5: Install Visual Studio Code
echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

# Step 6: Install Node Version Manager (NVM)
echo "Installing NVM (Node Version Manager)..."
brew install nvm

# Create directory for NVM if it doesn't exist
mkdir -p "$HOME/.nvm"

# Add NVM configuration to the shell profile (e.g., ~/.bash_profile, ~/.zshrc, etc.)
echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.zshrc"
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> "$HOME/.zshrc"

# Reload the shell profile to apply NVM
source "$HOME/.zshrc"

# Step 7: Install Node.js (NPM is included with Node.js)
echo "Installing Node.js (with NPM)..."
nvm install node

# Step 8: Install Composer (PHP package manager)
echo "Installing Composer..."
brew install composer

# Step 9: Install LocalWP (Local by Flywheel - Local Development Tool)
echo "Installing LocalWP..."
brew install --cask local

# Step 10: Install Docker
echo "Installing Docker..."
brew install --cask docker

# Final message
echo "All applications have been installed successfully!"

# Finish by asking the user to restart the terminal or source their profile
echo "To finish, restart your terminal or run 'source ~/.zshrc'."

# Provide instructions to run Docker
echo "To launch Docker, run 'open /Applications/Docker.app'."

echo "Installation complete. Have a great day!"
