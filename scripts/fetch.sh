#!/bin/sh

## /* Info */
hostname="$(cat /etc/hostname)"
os="$(grep PRETTY /etc/os-release | cut -c 13- | tr -d '"' | tr '[A-Z]' '[a-z]')"
ker=$(uname -r)
kernel="${ker%%-*}"
packages="$(pacman -Qq | wc -l)"
shell="${SHELL##*/}"
if [ -z "${WM}" ]; then
	WM="i3"
fi


## /* Colors */ ## /* Don't change */ ##
bc="$(tput bold)"	# bold
c0="$(tput setaf 0)"	# black
c1="$(tput setaf 1)"	# red
c2="$(tput setaf 2)"	# green
c3="$(tput setaf 3)"	# yellow
c4="$(tput setaf 4)"	# blue
c5="$(tput setaf 5)"	# magenta
c6="$(tput setaf 6)"	# cyan
c7="$(tput setaf 7)"	# white
rc="$(tput sgr0)"	# reset
## /* Aliases */
nc="${rc}${bc}${c1}"	# user and hostname
ic="${rc}"	        # info
fc="${rc}${c7}${bc}"	# first color
sc="${rc}${bc}${c3}"	# secod color
tc="${rc}${bc}${c2}"    # third color
## /* Output */
echo
cat <<EOF
${c1}                   ${nc}${USER}${ic}@${nc}${hostname}
${c1}     \    /\       ${c1}kernel ${fc}  ${ic}${kernel}
${c1}      )  ( ')      ${c1}pkgs ${fc}    ${ic}${packages}
${c1}     (  /  )       ${c1}wm ${fc}      ${ic}${WM} 
${c1}      \(__)|       ${c1}shell ${fc}   ${ic}${shell}
${c1}                   ${c1}os ${fc}      ${ic}${os}  
EOF
echo
for f in 0 1 2 3 4 ; do
    echo -en "  \033[$((f+41))m\033[1;$((f+30))m██▓▒░"
done
echo -e " \033[1;37m██\033[0m"
echo
# ${c1}                            ${nc}${USER}${ic}@${nc}${hostname}
# ${c1}      \    /\               ${c1}kernel ${fc}  ${ic}${kernel}
# ${c1}       )  ( ')              ${c1}pkgs ${fc}    ${ic}${packages}
# ${c1}      (  /  )               ${c1}wm ${fc}      ${ic}${WM}
# ${c1}       \(__)|               ${c1}shell ${fc}   ${ic}${shell}
# ${c1}                            ${c1}os ${fc}      ${ic}${os}
