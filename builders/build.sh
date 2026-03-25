#!/bin/bash
set -e

# ====== GET PROJECT ROOT ======
# This makes paths work no matter where you run the script from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ====== CONFIG ======
WX_DIR="$PROJECT_ROOT/wxWidgets"
WX_BUILD="$WX_DIR/buildgtk"
BUILD_OUTPUT_DIR="$PROJECT_ROOT/build"
SRC_FILE="$PROJECT_ROOT/code/main.cpp"
APP_NAME="myapp"

# ====== STEP 1: Clone wxWidgets if missing ======
if [ ! -d "$WX_DIR" ]; then
    echo "Cloning wxWidgets..."
    git clone https://github.com/wxWidgets/wxWidgets.git "$WX_DIR"
else
    echo "wxWidgets already exists, skipping clone."
fi

# ====== STEP 2: Build wxWidgets if not built ======
if [ ! -f "$WX_BUILD/wx-config" ]; then
    echo "Building wxWidgets..."
    mkdir -p "$WX_BUILD"
    cd "$WX_BUILD"
    ../configure --with-gtk=3
    make -j$(nproc)
    cd -
else
    echo "wxWidgets already built, skipping build."
fi

# ====== STEP 3: Create build output folder ======
mkdir -p "$BUILD_OUTPUT_DIR"

# ====== STEP 4: Compile your app ======
echo "Compiling main.cpp..."
g++ "$SRC_FILE" -o "$BUILD_OUTPUT_DIR/$APP_NAME" `$WX_BUILD/wx-config --cxxflags --libs`

# ====== STEP 5: Run it ======
echo "Running app..."
"$BUILD_OUTPUT_DIR/$APP_NAME"