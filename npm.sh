# Install Yarn globally
if ! command -v yarn &> /dev/null
then
  echo "Installing Yarn..."
  npm install -g yarn
else
  echo "Yarn is already installed."
fi

# Install pnpm globally
if ! command -v pnpm &> /dev/null
then
  echo "Installing pnpm..."
  npm install -g pnpm
else
  echo "pnpm is already installed."
fi

echo "Installation complete."