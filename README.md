## SETUP
* Clone the repository in a temporary directory:

  (HTTPS) `git clone --recursive https://github.com/marcocannici/home.git ~/home`
  <br/>
  (GIT) `git clone --recursive git@github.com:marcocannici/home.git ~/home`

* Access the temporary directory: `cd ~/home`

* Move every file to the your home:

  (LINUX) `find . -mindepth 1 -maxdepth 1 -exec mv -t.. -- {} +`
  <br/>
  (Mac) `find . -mindepth 1 -maxdepth 1  -execdir mv '{}' .. \;`
  
* Remove the temporary directory: `cd ; rm -r ~/home`

(Optional)
* Install tmux plugins: open tmux and use `<prefix> + I` to install the plugins.

#### Install useful software via brew
```
brew install coreutils
brew install mosh
```
