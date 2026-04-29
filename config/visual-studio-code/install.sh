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
          anthropic.claude-code
          anysphere.cursorpyright
          anysphere.remote-containers
          batisteo.vscode-django
          biomejs.biome
          blueglassblock.better-json5
          bpruitt-goddard.mermaid-markdown-syntax-highlighting
          bradlc.vscode-tailwindcss
          charliermarsh.ruff
          christian-kohler.npm-intellisense
          christian-kohler.path-intellisense
          coderabbit.coderabbit-vscode
          csstools.postcss
          davidanson.vscode-markdownlint
          dbaeumer.vscode-eslint
          docker.docker
          earshinov.permute-lines
          ecmel.vscode-html-css
          editorconfig.editorconfig
          esbenp.prettier-vscode
          github.vscode-github-actions
          graphql.vscode-graphql
          graphql.vscode-graphql-syntax
          mechatroner.rainbow-csv
          monokai.theme-monokai-pro-vscode
          mrmlnc.vscode-scss
          mrorz.language-gettext
          ms-azuretools.vscode-containers
          ms-azuretools.vscode-docker
          ms-python.debugpy
          ms-python.isort
          ms-python.python
          nefrob.vscode-just-syntax
          openai.chatgpt
          pucelle.vscode-css-navigation
          qcz.text-power-tools
          reduckted.vscode-gitweblinks
          rust-lang.rust-analyzer
          streetsidesoftware.code-spell-checker
          stylelint.vscode-stylelint
          svelte.svelte-vscode
          tamasfe.even-better-toml
          unifiedjs.vscode-mdx
          vue.volar
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
