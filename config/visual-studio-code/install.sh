#!/usr/bin/env bash
set -e

source lib.sh

bot "Installing Visual Studio code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        ok "Installing extensions please wait..."

        # Update this with code --list-extensions
        extensions=(
          asvetliakov.snapshot-tools
          bibhasdn.django-html
          bibhasdn.unique-lines
          bierner.lit-html
          bpruitt-goddard.mermaid-markdown-syntax-highlighting
          bradlc.vscode-tailwindcss
          charliermarsh.ruff
          christian-kohler.npm-intellisense
          christian-kohler.path-intellisense
          csstools.postcss
          daohong-emilio.yash
          davidanson.vscode-markdownlint
          dbaeumer.vscode-eslint
          earshinov.permute-lines
          ecmel.vscode-html-css
          editorconfig.editorconfig
          esbenp.prettier-vscode
          florianloch.text-transform
          github.copilot
          github.copilot-chat
          graphql.vscode-graphql
          graphql.vscode-graphql-syntax
          jkjustjoshing.vscode-text-pastry
          mechatroner.rainbow-csv
          monokai.theme-monokai-pro-vscode
          mrmlnc.vscode-json5
          mrmlnc.vscode-scss
          mrorz.language-gettext
          ms-azuretools.vscode-docker
          ms-python.debugpy
          ms-python.isort
          ms-python.python
          ms-python.vscode-pylance
          ms-vscode-remote.remote-containers
          pucelle.vscode-css-navigation
          qinjia.seti-icons
          rust-lang.rust-analyzer
          streetsidesoftware.code-spell-checker
          stylelint.vscode-stylelint
          sysoev.vscode-open-in-github
          tamasfe.even-better-toml
          unifiedjs.vscode-mdx
          visualstudioexptteam.intellicode-api-usage-examples
          visualstudioexptteam.vscodeintellicode
          vue.volar
          whatwedo.twig
        )

        for extension in "${extensions[@]}"; do
          code --install-extension "$extension"
        done


        ok "Extensions for VSC have been installed. Please restart your VSC."
    else
        ok "Skipping extension install.";
    fi

    read -r -p "Do you want to overwrite user config? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        read -r -p "Do you want to back up your current user config? [Y|n] " backupresponse
        if [[ $backupresponse =~ ^(n|no|N) ]];then
            ok "Skipping user config save."
        else
            cp $HOME/Library/Application\ Support/Code/User/settings.json $HOME/Library/Application\ Support/Code/User/settings.backup.json
            ok "Your previous config has been saved to: $HOME/Library/Application Support/Code/User/settings.backup.json"
        fi
        cp ./config/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

        ok "New user config has been written. Please restart your VSC."
    else
        ok "Skipping user config overwriting.";
    fi
else
    error "It looks like the command 'code' isn't accessible."
    error "Please make sure you have Visual Studio Code installed"
    error "And that you executed this procedure: https://code.visualstudio.com/docs/setup/mac"
fi
