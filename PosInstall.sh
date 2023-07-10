sudo apt-get update -y

sudo apt install build-essential -y

echo 'Instalando Flatpak'
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo 'Instalando Snapd'
sudo apt install snapd -y


echo 'instalando curl' 
sudo apt install curl -y

echo 'Instalando npm'
curl http://npmjs.org/install.sh | sudo sh
npm - v

echo 'instalando GitKraken'
flatpak install flathub com.axosoft.GitKraken -y

echo 'instalando spotify' 
flatpak install flathub com.spotify.Client -y

echo 'instalando discord' 
flatpak install flathub com.discordapp.Discord -y

echo 'Instalando Slack' 
flatpak install flathub com.slack.Slack -y

echo 'Instalando Brave' 
flatpak install flathub com.brave.Browser -y

echo 'instalando git' 
sudo apt install git -y

echo "Qual o nome você gostaria de usar no GIT user.name?"
echo "Por exemplo, o meu será \"Fernando Martinho\""
read -r git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "Qual e-mail você gostaria de utilizar no GIT user.email?"
echo "Por exemplo, o meu será \"martinho672@gmail.com\""
read -r git_config_user_email
git config --global user.email "$git_config_user_email"
clear


echo "Gerando uma chave SSH"
ssh-keygen -t rsa -b 4096 -C "$git_config_user_email"
ssh-add ~/.ssh/id_rsa
cmd ~/.ssh/id_rsa.pub | xclip -selection clipboard


sudo snap install flutter --classic
flutter sdk-path
echo "Qual seu usuário do sistema em que foi instalado o Flutter?"
echo "vai ser utilizado para definir o PATH por exemplo  \"bondurant\"  ira gerar um caminho similar a \"/home/bondurant/flutter/bin \""
read -r path_user_flutter
export PATH="$PATH:/home/"$path_user_flutter"/flutter/bin"

echo 'instalando code(vscode)'
flatpak install flathub com.visualstudio.code -y


echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo 'instalando zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'instalando ferramenta para lidar com a area de transferencia via CLI'
sudo apt-get install xclip -y


export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc


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


clear

echo 'Parece que terminamos por aqui, seu computador será reiniciado ! :) até a próxima'
echo "$git_config_user_name"
shutdown -r 0

