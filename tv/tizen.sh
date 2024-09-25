#!/bin/bash

# Setup Tizen Studio Environment Variables
setup_tizen_env() {
    export TIZEN_STUDIO=$PWD/tizen-studio
    export TIZEN_STUDIO_INSTALLER=$PWD/tizen-studio_5.5.bin
}

# Install Tizen Studio
install_tizen_studio() {
    if [ ! -f "$TIZEN_STUDIO_INSTALLER" ]; then
      wget -nc -O "$TIZEN_STUDIO_INSTALLER" http://download.tizen.org/sdk/Installer/tizen-studio_5.5/web-cli_Tizen_Studio_5.5_ubuntu-64.bin
    fi
    chmod a+x "$TIZEN_STUDIO_INSTALLER"
    "$TIZEN_STUDIO_INSTALLER" --accept-license "$TIZEN_STUDIO"
    rm -rf "$TIZEN_STUDIO_INSTALLER"
    echo "Tizen Studio installation completed."
}

# Setup certificates with a given name
setup_certificates() {
    if [ -z "$1" ]; then
        echo "Please provide a name for the security profile."
        return 1
    fi
    
    local profile_name=$1

    echo $TIZEN_CERT_AUTHOR | base64 --decode - > author.p12
    echo $TIZEN_CERT_DISTRIBUTION | base64 --decode - > distributor.p12
    tizen security-profiles add \
        -a author.p12 \
        -d distributor.p12 \
        -n "$profile_name" \
        -p "$TIZEN_CERT_PASSWORD" \
        -dp "$TIZEN_CERT_PASSWORD"
    
    echo "Certificates setup completed for profile: $profile_name."
}

# Setup certificate passwords in profiles.xml
setup_passwords() {
    sed -i "s|password=\".*\"|password=\"$TIZEN_CERT_PASSWORD\"|g" "$PWD/tizen-studio-data/profile/profiles.xml"
    echo "Passwords setup completed in profiles.xml."
}

# Main execution block
setup_tizen_env
install_tizen_studio

# Update PATH
export PATH="$TIZEN_STUDIO/tools/ide/bin:$PATH"
echo "Tizen Studio tools added to PATH."

# Example call to setup_certificates (uncomment and use as needed)
# setup_certificates "your_profile_name"
# setup_passwords
# install_webos_tools
