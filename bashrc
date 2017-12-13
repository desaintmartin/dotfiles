# Lu pour la commande bash
#if [ -z "$PS1" ]; then
#   return
#fi


# Autocompletion git
source /Users/cedricdesaintmartin/Documents/Scripts/bash/git-completion.bash
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gco

export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
LS_COLORS=''
LS_COLORS=$LS_COLORS:'no=0'           # Normal text
LS_COLORS=$LS_COLORS:'fi=0'           # Regular file
LS_COLORS=$LS_COLORS:'di=36'          # Directory
LS_COLORS=$LS_COLORS:'ln=01;36'       # Symbolic link
LS_COLORS=$LS_COLORS:'pi=33'          # Named pipe
LS_COLORS=$LS_COLORS:'so=01;35'       # Socket
LS_COLORS=$LS_COLORS:'do=01;35'       # DO
LS_COLORS=$LS_COLORS:'bd=01;37'       # Block device
LS_COLORS=$LS_COLORS:'cd=01;37'       # Character device
LS_COLORS=$LS_COLORS:'ex=35'          # Executable file
LS_COLORS=$LS_COLORS:'*FAQ=31;7'      # FAQs
LS_COLORS=$LS_COLORS:'*README=31;7'   # READMEs
LS_COLORS=$LS_COLORS:'*INSTALL=31;7'  # INSTALLs
LS_COLORS=$LS_COLORS:'*.sh=47;31'     # Shell-Scripts
LS_COLORS=$LS_COLORS:'*.vim=35'       # Vim-"Scripts"
LS_COLORS=$LS_COLORS:'*.swp=00;44;37' # Swapfiles (Vim)
LS_COLORS=$LS_COLORS:'*.sl=30;33'     # Slang-Scripts
LS_COLORS=$LS_COLORS:'*,v=5;34;93'    # Versioncontrols
LS_COLORS=$LS_COLORS:'or=01;05;31'    # Orphaned link
LS_COLORS=$LS_COLORS:'*.c=33'         # Sources
LS_COLORS=$LS_COLORS:'*.C=33'         # Sources
LS_COLORS=$LS_COLORS:'*.h=33'         # Sources
LS_COLORS=$LS_COLORS:'*.cc=33'        # Sources
LS_COLORS=$LS_COLORS:'*.py=33'        # Sources
LS_COLORS=$LS_COLORS:'*.rb=33'        # Sources
LS_COLORS=$LS_COLORS:'*.awk=33'       # Sources
LS_COLORS=$LS_COLORS:'*.pl=33'        # Sources
LS_COLORS=$LS_COLORS:'*.jpg=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.JPG=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.gif=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.png=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.jpeg=0;32'    # Images
LS_COLORS=$LS_COLORS:'*.ppm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pgm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.pbm=0;32'     # Images
LS_COLORS=$LS_COLORS:'*.tar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.tgz=31'       # Archive
LS_COLORS=$LS_COLORS:'*.gz=31'        # Archive
LS_COLORS=$LS_COLORS:'*.zip=31'       # Archive
LS_COLORS=$LS_COLORS:'*.sit=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lha=31'       # Archive
LS_COLORS=$LS_COLORS:'*.lzh=31'       # Archive
LS_COLORS=$LS_COLORS:'*.rar=31'       # Archive
LS_COLORS=$LS_COLORS:'*.arj=31'       # Archive
LS_COLORS=$LS_COLORS:'*.bz2=31'       # Archive
LS_COLORS=$LS_COLORS:'*.avi=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpg=35'       # Video
LS_COLORS=$LS_COLORS:'*.mpeg=35'      # Video
LS_COLORS=$LS_COLORS:'*.divx=35'      # Video
LS_COLORS=$LS_COLORS:'*.xvid=35'      # Video
LS_COLORS=$LS_COLORS:'*.mov=35'       # Video
LS_COLORS=$LS_COLORS:'*.mp4=35'       # Video
LS_COLORS=$LS_COLORS:'*.m4v=35'       # Video
LS_COLORS=$LS_COLORS:'*.wmv=35'       # VIdeo
LS_COLORS=$LS_COLORS:'*.mp3=37'       # Audio
LS_COLORS=$LS_COLORS:'*.ogg=37'       # Audio
LS_COLORS=$LS_COLORS:'*.wav=37'       # Audio
LS_COLORS=$LS_COLORS:'*.au=37'        # Audio
LS_COLORS=$LS_COLORS:'*.html=36'      # HTML
LS_COLORS=$LS_COLORS:'*.htm=1;34'     # HTML
LS_COLORS=$LS_COLORS:'*.php=1;45'     # PHP
LS_COLORS=$LS_COLORS:'*.doc=1;34'     # MS-Word
LS_COLORS=$LS_COLORS:'*.txt=1;34'     # Plain/Text
LS_COLORS=$LS_COLORS:'*.o=1;36'       # Object-Files
LS_COLORS=$LS_COLORS:'*.a=1;36'       # Shared-libs
export LS_COLORS
shopt -s checkwinsize

# Non-standard paths :
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/Users/cedricdesaintmartin/Documents/Scripts:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/Users/cedricdesaintmartin/.gem/ruby/1.8/bin:$PATH

export NODE_PATH=/usr/local/lib/node

# ls aliases
alias l='ls'
alias ll='ls -l'
alias la='ls -A'

# Message d'accueil : 
echo "Welcome, WaterCooled. It's not a bug, it's a feature."
