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
        code --install-extension asvetliakov.snapshot-tools
        code --install-extension bibhasdn.unique-lines
        code --install-extension bierner.lit-html
        code --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting
        code --install-extension bradgashler.htmltagwrap
        code --install-extension bradlc.vscode-tailwindcss
        code --install-extension bungcip.better-toml
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension christian-kohler.path-intellisense
        code --install-extension daohong-emilio.yash
        code --install-extension DavidAnson.vscode-markdownlint
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension ecmel.vscode-html-css
        code --install-extension EditorConfig.EditorConfig
        code --install-extension esbenp.prettier-vscode
        code --install-extension florianloch.text-transform
        code --install-extension GitHub.copilot-chat
        code --install-extension GitHub.copilot-labs
        code --install-extension GitHub.copilot-nightly
        code --install-extension GraphQL.vscode-graphql
        code --install-extension GraphQL.vscode-graphql-syntax
        code --install-extension jkjustjoshing.vscode-text-pastry
        code --install-extension mechatroner.rainbow-csv
        code --install-extension monokai.theme-monokai-pro-vscode
        code --install-extension mrmlnc.vscode-json5
        code --install-extension mrmlnc.vscode-scss
        code --install-extension mrorz.language-gettext
        code --install-extension ms-azuretools.vscode-docker
        code --install-extension ms-python.python
        code --install-extension ms-python.vscode-pylance
        code --install-extension ms-vscode-remote.remote-containers
        code --install-extension ms-vscode.makefile-tools
        code --install-extension ms-vscode.Theme-MarkdownKit
        code --install-extension ms-vsliveshare.vsliveshare
        code --install-extension octref.vetur
        code --install-extension prograhammer.tslint-vue
        code --install-extension qinjia.seti-icons
        code --install-extension streetsidesoftware.code-spell-checker
        code --install-extension stylelint.vscode-stylelint
        code --install-extension syler.sass-indented
        code --install-extension sysoev.vscode-open-in-github
        code --install-extension unifiedjs.vscode-mdx
        code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
        code --install-extension VisualStudioExptTeam.vscodeintellicode
        code --install-extension Vue.volar
        code --install-extension whatwedo.twig


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
