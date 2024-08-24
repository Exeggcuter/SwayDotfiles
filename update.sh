#!/bin/bash
mkdir -p $HOME/backup
dirConfig=$HOME/.config
newBackup=backup_$(date '+%Y-%m-%d_%H:%M:%S')
newBackupPath=$HOME/backup/${newBackup}

echo "Backing up old .config in ${newBackupPath}"

cp -r ${dirConfig}  ${newBackupPath}

diffTmp=$(diff -q .config $HOME/.config | grep -v "Common subdirectories")
diff=${diffTmp//"Only in $HOME/.config: "}

readarray -t lines <<<"$diff"

echo "Deleting .config..."
rm -fr $HOME/.config
mkdir -p $HOME/.config

echo "Adding back what isn't on the github repository..."
for i in "${!lines[@]}"
do
    echo ">${lines[i]}"
    cp "$HOME/backup/${newBackup}/${lines[i]}" $HOME/.config -r
done

echo "Copy github local repository of .config into $HOME/.config"
cp .config $HOME -r
echo "Done!"