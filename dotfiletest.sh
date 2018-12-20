if [ ! -d ".ffffdotfiles" ]   
then
    echo "Directory .dotfiles DOES NOT exists."   

 #   echo "Copying dotfiles from Github"
  #  cd ~
   # git clone git@github.com:AlexanderKvamme/dotfiles.git .dotfiles
    #cd .dotfiles
    #sh symdotfiles
   # ln -s ".dotfiles/runcom/.bash_profile"
else
    echo "Directory .dotfiles DOES exists."
fi
