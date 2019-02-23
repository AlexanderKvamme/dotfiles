mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


# plugins
cd ~/.vim/bundle && \
git clone https://github.com/junegunn/limelight.vim
