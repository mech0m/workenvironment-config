#!/bin/bash

echo Try to detect Operating system

INSTALLER_DIR=$PWD

IS_UBUNTU='false'
UBUNTU_PPA_LIST="aguignard/ppa neovim-ppa/unstable phoerious/keepassxc"
UBUNTU_PACKAGE_LIST=("scrot ranger fonts-font-awesome i3status i3lock dmenu libxcb1-dev libxcb-keysyms1-dev "
                    "libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev "
                    "libyajl-dev libstartup-notification0-dev "
                    "libxcb-randr0-dev libev-dev libxcb-cursor-dev "
                    "libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev "
                    "libxkbcommon-x11-dev autoconf libxcb-xrm-dev "
                    "neovim curl python-dev python-pip python3-dev "
                    "python3-pip zip zathura-djvu aspell-de keepassxc")
UBUNTU_PACKAGE_LIST=${UBUNTU_PACKAGE_LIST[*]}

add_ppa() {
    for i in "$@"; do
        grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
        if [ $? -ne 0 ]
        then
            echo "Adding ppa:$i"
            sudo add-apt-repository -y ppa:$i
        else
            echo "ppa:$i already exists"
        fi
    done
}

uname -a | grep 'Ubuntu' > /dev/null

if [ $? -eq 0 ]
then
    echo "System: Ubuntu"
    IS_UBUNTU='true'
#else
    #(>&2 echo "could not identify System" )
    #exit 1
fi

if [ $IS_UBUNTU = 'true' ]
then
    echo Repos ot be added
    echo $UBUNTU_PPA_LIST
    echo Packages to install
    echo $UBUNTU_PACKAGE_LIST

    add_ppa $UBUNTU_PPA_LIST
    sudo apt-get update
    sudo apt-get upgrade
    for pak in $UBUNTU_PACKAGE_LIST
    do
        sudo apt-get install -y $pak

        if [ $? -ne 0 ]
        then
           echo "##### WARNING #####"
           echo "# Package $pak    #"
           echo "# not found       #"
           echo "###################"

           NOT_FOUND_PACKAGES="$NOT_FOUND_PACKAGES $pak"
        fi
    done


    echo "[installing] i3-gaps"
    cd /tmp

    # clone the repository
    git clone https://www.github.com/Airblader/i3 i3-gaps
    cd i3-gaps
    git checkout gaps

    # compile & install
    autoreconf --force --install
    rm -rf build/
    mkdir -p build && cd build/

    # Disabling sanitizers is important for release versions!
    # The prefix and sysconfdir are, obviously, dependent on the distribution.
    ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
    make
    sudo make install

    cd /tmp
    rm -fr i3-gaps

    #echo "[installing] language-tool"
    #wget "https://languagetool.org/download/LanguageTool-4.1.zip"
    #unzip LanguageTool-4.1.zip
    #cd LanguageTool-4.1 

    echo [installing] termite

    $INSTALLER_DIR/termite-install/termite-install.sh

    cd $INSTALLER_DIR

    echo install sLock
    sudo ln -ls $PWD/bin/sLockUbuntu /usr/local/bin/sLock
    sudo chmod a+x /usr/local/bin/sLock


else
    sudo pacman -S ttf-font-awesome

    echo install sLock
    sudo ln $PWD/bin/sLockArch /usr/local/bin/sLock
    sudo chmod a+x /usr/local/bin/sLock

    echo "Not implemented yet Arch linux specific installation"
fi


echo creating symbolic links
ln -is $PWD/termite    $PWD/..
ln -is $PWD/nvim       $PWD/..
ln -is $PWD/i3status   $PWD/..
ln -is $PWD/sway       $PWD/..
ln -is $PWD/i3         $PWD/..
ln     $PWD/zsh/.zshrc ~/

echo get submodules
git submodule update --init --recursive

rm -fr ./nvim/repos
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ./nvim/
rm dein_installer.sh

echo install fonts
fonts/install.sh


echo
echo Packages that could not be installed:
echo $NOT_FOUND_PACKAGES
