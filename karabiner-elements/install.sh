#!/bin/bash

DEST_DIR="$HOME/.config/karabiner/assets/complex_modifications"

# コピー先ディレクトリが存在しない場合は作成
if [ ! -d "$DEST_DIR" ]; then
  echo "Creating directory: $DEST_DIR"
  mkdir -p "$DEST_DIR"
fi

# カレントディレクトリのJSONファイルをコピー
JSON_FILES=(*.json)

if [ ! -e "${JSON_FILES[0]}" ]; then
  echo "No JSON files found in current directory."
  exit 1
fi

for f in "${JSON_FILES[@]}"; do
  cp "$f" "$DEST_DIR/"
  echo "Copied: $f -> $DEST_DIR/$f"
done

echo "Done."