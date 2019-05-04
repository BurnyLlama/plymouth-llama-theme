# plymouth-llama-theme
It's called "llama theme" but there's no llamas... Sounds like false advertising....

# Installation:
## Easy (Automatic - Limited Support):
Run the installer in sudo:
```
sudo bash ./installer.sh
```
And follow given instructions...

(As of now this is not that useful - works on Arch Linux...)

## Advanced (Manual):
```
$ |  sudo su
# |  cp -av /path/to/source/* /path/to/plymouth/theme/folder
# |  plymouth-set-default-theme llama -R
# |  reboot
```
## Customization
Inside the "llama.script" you can find some variables at the top that are toggable (true/false), you can change those to your liking.
