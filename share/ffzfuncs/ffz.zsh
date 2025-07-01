ffz() {
  input="$1"

  if [[ -z "$input" || ! -f "$input" ]]; then
    echo "Usage: ffz <inputfile>"
    return 1
  fi

  # Check metadata to skip already encoded files
  if ffprobe -v error -show_entries format_tags=comment -of default=noprint_wrappers=1:nokey=1 "$input" | grep -q "^ffz$"; then
    echo "⏩ '$input' is already marked with comment=ffz. Skipping."
    return 0
  fi

  filename="${input%.*}"
  extension="${input##*.}"

  if [[ "$extension" == "mp4" ]]; then
    output="${filename}_z.mp4"
  else
    output="${filename}.mp4"
  fi

  if [[ -e "$output" ]]; then
    echo "❌ Target file '$output' already exists. Aborting to avoid overwrite."
    return 2
  fi

  echo "🚀 Converting '$input' → '$output'..."
  ffmpeg -i "$input" \
    -c:v libx265 -crf 28 -tag:v hvc1 \
    -c:a aac -b:a 96k \
    -metadata comment="ffz" \
    "$output"

  if [[ $? -eq 0 ]]; then
    echo "✅ Conversion successful. Removing original: '$input'"
    rm -v "$input"
  else
    echo "❌ Conversion failed. Original file preserved."
    [[ -e "$output" ]] && rm -v "$output"
  fi
}

ffzmark() {
  input="$1"

  if [[ -z "$input" || ! -f "$input" ]]; then
    echo "Usage: ffzmark <inputfile>"
    return 1
  fi

  # Check if file already marked
  if ffprobe -v error -show_entries format_tags=comment -of default=noprint_wrappers=1:nokey=1 "$input" | grep -q "^ffz$"; then
    echo "⏩ '$input' is already marked with comment=ffz. Skipping."
    return 0
  fi

  echo "🏷️ Marking '$input' with metadata: comment=ffz..."

  temp_output="$(dirname "$input")/.ffzmark_tmp_$(basename "$input")"

  ffmpeg -i "$input" -c copy -metadata comment="ffz" "$temp_output"
  if [[ $? -eq 0 ]]; then
    mv -v "$temp_output" "$input"
    echo "✅ Metadata added successfully to '$input'."
  else
    echo "❌ Failed to update metadata. File left unchanged."
    [[ -e "$temp_output" ]] && rm -v "$temp_output"
    return 2
  fi
}