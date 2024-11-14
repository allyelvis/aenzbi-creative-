#!/bin/bash

# Aenzbi Creative Tools Installation Script
# Author: Ally Elvis Nzeyimana

# Variables
PROJECT_DIR="aenzbi-creative-tools"
WEBSITE_DIR="$PROJECT_DIR/website"
FILM_GENERATOR_DIR="$PROJECT_DIR/ai-film-generator"
MOVIE_GENERATOR_DIR="$PROJECT_DIR/movies-generator"
MUSIC_GENERATOR_DIR="$PROJECT_DIR/music-generator"
GAME_GENERATOR_DIR="$PROJECT_DIR/3d-game-generator"
MARKETPLACE_DIR="$PROJECT_DIR/marketplace"

# Step 1: Create Project Directory Structure
echo "Creating project directory structure..."
mkdir -p "$PROJECT_DIR"
mkdir -p "$WEBSITE_DIR" "$FILM_GENERATOR_DIR" "$MOVIE_GENERATOR_DIR" "$MUSIC_GENERATOR_DIR" "$GAME_GENERATOR_DIR" "$MARKETPLACE_DIR"

# Step 2: Install Dependencies

# Update package lists
echo "Updating package lists..."
sudo apt update

# Install common dependencies
echo "Installing common dependencies..."
sudo apt install -y curl git python3-pip nodejs npm ffmpeg

# Step 3: Set up Python virtual environments for AI tools

# AI Film Generator
echo "Setting up Python environment for AI Film Generator..."
python3 -m venv "$FILM_GENERATOR_DIR/venv"
source "$FILM_GENERATOR_DIR/venv/bin/activate"
pip install -U pip
pip install tensorflow transformers moviepy
deactivate

# Movies Generator
echo "Setting up Python environment for Movies Generator..."
python3 -m venv "$MOVIE_GENERATOR_DIR/venv"
source "$MOVIE_GENERATOR_DIR/venv/bin/activate"
pip install -U pip
pip install tensorflow transformers moviepy
deactivate

# Music Generator
echo "Setting up Python environment for Music Generator..."
python3 -m venv "$MUSIC_GENERATOR_DIR/venv"
source "$MUSIC_GENERATOR_DIR/venv/bin/activate"
pip install -U pip
pip install musenet pydub
deactivate

# 3D Game Generator
echo "Setting up Unity (or Unreal Engine) for 3D Game Generator..."
# This step would require more detailed setup based on the specific game engine
# Unity requires manual installation or dedicated CLI tools, so this part is outlined
echo "Please install Unity or Unreal Engine separately for 3D Game Generator."

# Step 4: Set up Node.js environments for Website and Marketplace

# Website
echo "Setting up Node.js environment for Website..."
cd "$WEBSITE_DIR"
npm init -y
npm install react react-dom next

# Marketplace
echo "Setting up Node.js environment for Marketplace..."
cd "$MARKETPLACE_DIR"
npm init -y
npm install express stripe mongoose multer

# Step 5: Set up Git repositories

echo "Initializing Git repositories..."
cd "$PROJECT_DIR"
git init

# Initialize repositories for each tool
for TOOL_DIR in "$WEBSITE_DIR" "$FILM_GENERATOR_DIR" "$MOVIE_GENERATOR_DIR" "$MUSIC_GENERATOR_DIR" "$GAME_GENERATOR_DIR" "$MARKETPLACE_DIR"; do
    cd "$TOOL_DIR"
    git init
    echo "node_modules/" > .gitignore
    echo "venv/" >> .gitignore
    git add .
    git commit -m "Initial commit for $(basename $TOOL_DIR)"
done

# Step 6: Create README files

echo "Creating README files..."
for TOOL_DIR in "$WEBSITE_DIR" "$FILM_GENERATOR_DIR" "$MOVIE_GENERATOR_DIR" "$MUSIC_GENERATOR_DIR" "$GAME_GENERATOR_DIR" "$MARKETPLACE_DIR"; do
    echo "# $(basename $TOOL_DIR)" > "$TOOL_DIR/README.md"
    echo "This directory contains the code for the $(basename $TOOL_DIR)." >> "$TOOL_DIR/README.md"
done

# Step 7: Provide information for additional setup

echo "Setup complete."
echo "Next steps:"
echo "- Configure the AI models and datasets for Film, Movie, and Music Generators."
echo "- Complete the setup of Unity or Unreal Engine for the 3D Game Generator."
echo "- Customize the marketplace with payment processing (e.g., configure Stripe keys in $MARKETPLACE_DIR)."
echo "- Start building out the features as outlined in each tool's README file."
