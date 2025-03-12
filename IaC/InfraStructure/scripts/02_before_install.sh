#!/bin/bash
set -e

echo "Installing dependencies..."
apt-get update && apt-get install -y unzip wget curl  # Ensure package list is update

echo "dependencies installation complete."
