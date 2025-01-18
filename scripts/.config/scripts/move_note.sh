#!/bin/bash

# Directory containing markdown files
VAULT_DIR="${OBSIDIAN_PATH}"
SOURCE_DIR="09 - Temp/Draft"
DEST_DIR="02 - Zettelkasten"

find "$VAULT_DIR/$SOURCE_DIR" -type f -name "*.md" -print0 | while IFS= read -r -d '' file; do
  echo "Processing $file"

  tag=$(awk '/^tags:/ { print $2; exit }' "$file")

  if [[ -z "$tag" ]]; then
      echo "No tag found for $file. Skipping..."
      continue
  fi

  echo "Found tag $tag"

  if [[ "$file" =~ [0-9]{4}-[0-9]{2}-[0-9]{2}_ ]]; then
    new_name=$(echo "$file" | sed 's/.*\/[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}_//')

    if mv "$file" "$new_name"; then
      echo "Renamed $file to $new_name"

      TARGET_DIR="$VAULT_DIR/$DEST_DIR/$tag"
      mkdir -p "$TARGET_DIR"

      if mv "$new_name" "$TARGET_DIR/"; then
        echo "Moved $new_name to $TARGET_DIR"
      else
        echo "Failed to move $new_name to $TARGET_DIR"
      fi
    else
      echo "Failed to rename $file"
    fi
  else
    echo "Skipping $file: does not match expected filename pattern"
  fi
done

echo "Done!"
