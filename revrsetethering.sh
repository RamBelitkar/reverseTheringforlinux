#!/bin/bash

# Gnirehtet Reverse Tethering Script

# Set variables for paths
ADB=$(which adb)
GNIREHTET_PATH="./gnirehtet"
GNIREHTET_APK="./gnirehtet.apk"

# Check if adb is installed
if [ -z "$ADB" ]; then
    echo "adb is not installed. Please install it first."
    exit 1
fi

# Check if gnirehtet files exist
if [ ! -f "$GNIREHTET_PATH" ] || [ ! -f "$GNIREHTET_APK" ]; then
    echo "Gnirehtet binary or APK not found in the current directory."
    exit 1
fi

# Install APK on the connected device
echo "Installing gnirehtet APK..."
$ADB install -r "$GNIREHTET_APK"

# Run the relay server
echo "Starting Gnirehtet relay server..."
$GNIREHTET_PATH relay &
RELAY_PID=$!

# Start the reverse tethering
echo "Activating reverse tethering..."
$GNIREHTET_PATH run

# Wait for user to stop
echo "Press Ctrl+C to stop reverse tethering."

# Handle cleanup
trap "echo 'Stopping relay server...'; kill $RELAY_PID; exit" SIGINT SIGTERM
wait
