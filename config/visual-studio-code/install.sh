#!/usr/bin/env bash
set -e

source lib.sh

bot "Installing Visual Studio code extensions and config."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        ok "Installing extensions please wait..."

        code --install-extension DavidAnson.vscode-markdownlint
        code --install-extension EditorConfig.EditorConfig
        code --install-extension PeterJausovec.vscode-docker
        code --install-extension Zignd.html-css-class-completion
        code --install-extension abusaidm.html-snippets
        code --install-extension asvetliakov.snapshot-tools
        code --install-extension bogdan-sinitsa.theme-dark-monokai
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension christian-kohler.path-intellisense
        code --install-extension cssho.vscode-svgviewer
        code --install-extension dbaeumer.vscode-eslint
        code --install-extension donjayamanne.githistory
        code --install-extension dt.ghlink
        code --install-extension dzannotti.vscode-babel-coloring
        code --install-extension eg2.vscode-npm-script
        code --install-extension esbenp.prettier-vscode
        code --install-extension florianloch.text-transform
        code --install-extension flowtype.flow-for-vscode
        code --install-extension freebroccolo.reasonml
        code --install-extension glen-84.sass-lint
        code --install-extension hackwaly.ocaml
        code --install-extension jkjustjoshing.vscode-text-pastry
        code --install-extension joelday.docthis
        code --install-extension jpoissonnier.vscode-styled-components
        code --install-extension lextudio.restructuredtext
        code --install-extension mgmcdermott.vscode-language-babel
        code --install-extension mkaufman.HTMLHint
        code --install-extension mohsen1.prettify-json
        code --install-extension monokai.theme-monokai-pro-vscode
        code --install-extension mrmlnc.vscode-scss
        code --install-extension ms-vscode.Theme-MarkdownKit
        code --install-extension patrys.vscode-code-outline
        code --install-extension qinjia.seti-icons
        code --install-extension robinbentley.sass-indented
        code --install-extension ryu1kn.partial-diff
        code --install-extension sbrink.elm
        code --install-extension shinnn.stylelint
        code --install-extension sysoev.vscode-open-in-github
        code --install-extension toasty-technologies.octave
        code --install-extension travisthetechie.write-good-linter
        code --install-extension wix.vscode-import-cost

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
