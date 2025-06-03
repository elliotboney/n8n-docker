#!/bin/bash

volumes=("caddy_data" "n8n_data" "redis_storage" "db_storage")

for volume in "${volumes[@]}"; do
    if sudo docker volume ls --format '{{.Name}}' | grep -q "^${volume}$"; then
        echo "Docker volume '${volume}' already exists."
    else
        sudo docker volume create "${volume}"
    fi
done

# Check if the .env file exists
if [ -f .env ]; then
    # If it exists, export all variables from .env,
    # ignoring lines that start with # (comments).
    # xargs is used to properly handle spaces in variable values.
    export $(grep -v '^#' .env | xargs)
else
    # If .env is not found, print an error and exit.
    echo "Error: .env file not found"
    exit 1
fi

# Check if DOMAIN_NAME or SUBDOMAIN variables are empty (not set in .env)
if [ -z "$DOMAIN_NAME" ] || [ -z "$SUBDOMAIN" ]; then
    # If either is empty, print an error and exit.
    echo "Error: DOMAIN_NAME and SUBDOMAIN variables must be defined in .env"
    exit 1
fi

# Define input and output file paths for Caddyfile configuration
input_file="caddy_config/Caddyfile.example"
output_file="caddy_config/Caddyfile"

# Use sed to find and replace a placeholder in the input file
# with the actual subdomain and domain name, then save to the output file.
# It replaces "n8n.<domain>.<suffix>" with "$SUBDOMAIN.$DOMAIN_NAME".
sed "s/n8n\.<domain>\.<suffix>/$SUBDOMAIN.$DOMAIN_NAME/" "$input_file" > "$output_file"

# 4. Replace the original file with the new one (optional, uncomment if you want this)
# mv "$output_file" "$input_file"

# Print success messages
echo "File processed successfully!"
echo "New file created at: $output_file"
echo "Resulting content:"
echo "---------------------"
# Display the content of the newly created/modified Caddyfile
cat "$output_file"
