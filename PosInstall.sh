sudo apt-get update

echo 'instalando curl' 
sudo apt install curl -y

echo 'instalando git' 
sudo apt install git -y

echo 'Instalando npm'
curl http://npmjs.org/install.sh | sudo sh
npm - v

echo 'instalando GitKraken'
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb

echo "Qual o nome você gostaria de usar no GIT user.name?"
echo "Por exemplo, o meu será \"Fernando Martinho\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "Qual e-mail você gostaria de utilizar no GIT user.email?"
echo "Por exemplo, o meu será \"martinho672@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear


echo "Gerando uma chave SSH"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard



echo 'instalando zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'instalando ferramenta para lidar com a area de transferencia via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"
flutter precache
echo "Qual seu usuário do sistema em que foi instalado o Flutter?"
echo "vai ser utilizado para definir o PATH por exemplo  \"bondurant\"  ira gerar um caminho similar a \"/home/bondurant/flutter/bin \""
read path_user_flutter
export PATH="$PATH:/home/"$path_user_flutter"/flutter/bin"

echo 'instalando code(vscode)'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension pmneo.tsimporter
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one
code --install-extension WakaTime.vscode-wakatime


echo 'installing spotify' 
snap install spotify

echo 'installing discord' 
sudo snap install discord

echo 'instalando o Vivaldi'
wget https://downloads.vivaldi.com/stable/vivaldi-stable_current_amd64.deb -O vivaldi.deb
sudo dpkg -i vivaldi.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo 'instalando para ZSH autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc
echo 'instalando Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'instalando tema Dracula Zsh'
git clone https://github.com/dracula/zsh.git
ln -s $DRACULA_THEME/dracula.zsh-theme $OH_MY_ZSH/themes/dracula.zsh-theme

echo 'installing Spaceship'
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="spaceship"/g' ~/.zshrc

echo 'installing Spaceship plugins'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
echo 'SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "' >> ~/.zshrc

echo 'zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions' >> ~/.zshrc

echo 'Instalando teamviewer'
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb


clear

echo 'Parece que terminamos por aqui :) até a próxima'
echo $git_config_user_name

