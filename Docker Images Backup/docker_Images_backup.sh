#!/bin/bash
# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "🐳 Docker Images Manager - Very Cool Edition! 🚀"
echo "Choose an option:"
echo "1) 💾 Save all Docker images to tar files"
echo "2) 📦 Load all tar files as Docker images"
read -p "🎯 Your choice: " choice
case $choice in
    1)
        echo "🔍 Scanning for Docker images..."
        images=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}")
        if [ -z "$images" ]; then
            echo "⚠️ No Docker images found. Nothing to save! 😕"
            exit 1
        fi
        echo "🎉 Found images! Starting backup process..."
        while read -r line; do
            repo_tag=$(echo "$line" | awk '{print $1}')
            img_id=$(echo "$line" | awk '{print $2}')
            # Skip <none>:<none>
            if [[ "$repo_tag" == "<none>:<none>" ]]; then
                echo "⏭️ Skipping dangling image ($img_id) 🗑️"
                continue
            fi
            safe_name=$(echo "$repo_tag" | tr '/:' '_')
            filename="${SCRIPT_DIR}/${safe_name}.tar"
            echo "💾 Saving $repo_tag --> $filename ✨"
            docker save -o "$filename" "$repo_tag"
        done <<< "$images"
        echo "🎊 All valid Docker images have been saved in: $SCRIPT_DIR 🔥"
        ;;
    2)
        echo "🔍 Looking for tar files to restore..."
        shopt -s nullglob
        tar_files=("$SCRIPT_DIR"/*.tar)
        if [ ${#tar_files[@]} -eq 0 ]; then
            echo "⚠️ No tar files found in $SCRIPT_DIR 📂"
            exit 1
        fi
        echo "🎉 Found ${#tar_files[@]} tar file(s)! Starting restore process..."
        for file in "${tar_files[@]}"; do
            echo "📦 Loading $file 🚀"
            docker load -i "$file"
        done
        echo "🎊 All tar files have been loaded as Docker images! 🔥"
        ;;
    *)
        echo "❌ Invalid choice! Try again next time 😎"
        exit 1
        ;;
esac
