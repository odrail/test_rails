FROM gitpod/workspace-postgres
USER gitpod

RUN _ruby_version=ruby-2.7.8 \
    && printf "rvm_gems_path=/home/gitpod/.rvm\n" > ~/.rvmrc \
    && bash -lc "rvm pkg install openssl && rvm reinstall ruby-${_ruby_version} --with-openssl-dir=$HOME/.rvm/usr && rvm use ruby-${_ruby_version} --default && gem install rails -v 5.2.8.1" \
    && printf "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc \
    && printf '{ rvm use $(rvm current); } >/dev/null 2>&1\n' >> "$HOME/.bashrc.d/70-ruby"
