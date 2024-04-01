# Mac 초기 설정

### 기본 참고
- [본격 macOS에 개발 환경 구축하기](https://subicura.com/2017/11/22/mac-os-development-environment-setup.html)
    - Finder Preferences ⇒ 태그 및 사이드바에 workspace 폴더 추가

### System Preferences
- General
    - set `Ask to keep changes when closing documents` to `true`
- Dock
    - `Prefer tabs when opening documents`: Always
    - `Automatically hide and show Dock`: True
    - `Show recent applications in Dock`: False
- Bluetooth
    - `Show Bluetooth in menu bar`: True
- Keyboard => Keyboard shorcuts => Screenshots => `Copy picture of selected ared to the clipboard` => command + shift + s

### PC 이름 변경

```
sudo scutil --set ComputerName "newname"
sudo scutil --set LocalHostName "newname"
sudo scutil --set HostName "newname"
dscacheutil -flushcache # Flush the DNS cache by typing 
# Restart your Mac.
```

### Programs
- [VSCode](https://code.visualstudio.com): 코드 편집기
- [Whale](https://whale.naver.com/ko/): 네이버 웨일 브라우저
  - set `Default browser`
  - Appearance ⇒ check `Use slim mode`
  - Appearance ⇒ Skin ⇒ Type ⇒ check `Basic`
- [Chrome](https://www.google.com/intl/ko/chrome/): 크롬 브라우저
- [Spectacle](https://www.spectacleapp.com): 키보드로 윈도우 크기 조절
  - check `Launch Spectacle at login`
  - FullScreen 매핑: `command + option + enter`
- [Alfred](https://www.alfredapp.com): 맥용 런처 프로그램
- [Xcode](https://developer.apple.com/kr/xcode/): 앱스토어에서 설치
- [카카오톡](https://www.kakaocorp.com/service/KakaoTalk): 앱스토어에서 설치
- [Pock](https://pock.dev): display macOS Dock in Touch Bar(터치바 모델만)

### CLI
- [Homebrew](https://brew.sh/index_ko): macOS용 패키지 관리자
  ```shell
  $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
- Cocoapods
```shell
$ brew install cocoapods
```
- [git](https://git-scm.com), [git-lfs](https://git-lfs.github.com), [git-flow](https://danielkummer.github.io/git-flow-cheatsheet/index.ko_KR.html)
  ```shell
  $ brew install git git-lfs
  $ brew install git-flow-avh
  $ git config --global user.name "tak"
  $ git config --global user.email "env.tak@gmail.com"
  $ git config --global core.precomposeunicode true
  $ git config --global core.quotepath false
  ```
- [iTerm2](https://iterm2.com): macOS Terminal Replacement
  ```shell
  $ brew cask install iterm2
  ```
  - Preference ⇒ Profiles ⇒ Session ⇒ check `Status bar enabled`
    - Background Color: `272935` => 이건 변경해야할듯
  - Appearance ⇒ General ⇒ Status bar location ⇒ `Bottom`
  - Preference ⇒ Keys ⇒ Hoykey ⇒ check `Show/hide all windows...`
    - Hotkey 키 바인딩: `F12`
  - 아래 이미지 처럼 키바인딩 추가: Profile ⇒ Keys ⇒ click + ⇒ `Send Escape Sequence`
    - `option + <-`: Esc+ **b**(word 단위 이동)
    - `option + ->`: Esc+ **f**(word 단위 이동)  
  ![backword](https://user-images.githubusercontent.com/7614353/71778843-3cfe9900-2ff6-11ea-9935-4339cb473d21.png)
- [wget](https://www.gnu.org/software/wget/): 웹 파일을 다운로드 받을 때 사용
  ```shell
  $ brew install wget
  ```
- [httpie](https://httpie.org): command line HTTP client
  ```shell
  $ brew install httpie
  ```
- zsh, [oh-my-zsh](https://ohmyz.sh)
  - plugins
    - zsh
    - [zsh-completions](https://github.com/zsh-users/zsh-completions): Additional completion definitions for Zsh.
    - [fasd](https://github.com/clvv/fasd): quick access to files and directories
  ```shell
  $ brew install zsh zsh-completions fasd
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # zsh-syntax-highlighting
  $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # zsh-autosuggestions
  $ git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  # add plugins
  $ vi ~/.zshrc
  ...
  plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    fasd
  )
  ...
  ```
- [fzf](https://github.com/junegunn/fzf) brew install fzf

- zsh 테마
```shell
$ brew install nodejs
$ npm install --global pure-prompt
$ echo 'autoload -U promptinit; promptinit
  prompt pure' >> ~/.zshrc
$ source ~/.zshrc
```
- [tmux](https://github.com/tmux/tmux): TTY 멀티플렉서, [tmuxinator](https://github.com/tmuxinator/tmuxinator): Manage complex tmux sessions easily
```
$ brew install tmux tmuxinator
```
- tmux 테마
```
$ cd ~/
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .

# 맨 아래 주석 부분 해제
$ vi .tmux/.tmux.conf.local
# increase history size
set -g history-limit 10000
        
# start with mouse mode enabled
set -g mouse on
        
# force Vi mode
# really you should export VISUAL or EDITOR environment variable, see manual
set -g status-keys vi
set -g mode-keys vi
```
- tmuxinator 스크립트 추가 => 이거 안됨...
```
$ mkdir ~/bin
$ vi ~/bin/tmux-worker
```

```
#!/bin/bash

display_usage() {
  echo "This script is used to start tmuxinator project sessions."
  echo -e "\nAvailable sessions:\n"

  for session in `ls ~/.tmuxinator | sed -e 's/\..*$//'`; do
    echo -e "\t${session%.*}"
  done

  echo -e "\nExample usage:\n"
  echo -e "\twork on project"
  echo -e "\twork off project\n"
}

if [ $# -ne 2 ]; then
  display_usage
  exit 1
fi

operation=$1
tmuxinator_config=$2

if [ $operation == "on" ]
  then
  tmux has-session -t $tmuxinator_config 2> /dev/null

  if [ $? != 0 ]
  then
    tmuxinator start $tmuxinator_config
  else
    echo "tmux: $tmuxinator_config session is already running."
  fi
fi

if [ $operation == "off" ]
  then
  tmux has-session -t $tmuxinator_config 2> /dev/null

  if [ $? == 0 ]
  then
    for i in `seq 1 10`;
    do
      tmux send-keys -t $tmuxinator_config:$i.1 C-c C-m
      tmux send-keys -t $tmuxinator_config:$i.2 C-c C-m
      tmux send-keys -t $tmuxinator_config:$i.3 C-c C-m
    done

    tmux kill-session -t $tmuxinator_config
  else
    echo "tmux: no $tmuxinator_config session found."
  fi
fi
```

```
$ wget https://raw.githubusercontent.com/colmarius/dot-files/master/files/bin/work -O ~/bin/tmux-worker # 이거 안됨
$ chmod 755 ~/bin/tmux-worker
$ echo 'export PATH=${PATH}:~/bin' >> ~/.zshrc
$ source ~/.zshrc

```
  - `tmux-worker` test
  ```
  $ mkdir ~/.tmuxinator
  $ vi ~/.tmuxinator/test.yml
  name: test
  root: ~/Downloads
  windows:
    - App:
      layout: tiled
      panes:
        - clear && ls
        -  clear && ls -al
        
  $ tmux-worker start test
  $ tmux-worker stop test
  ```

- [Neovim](https://neovim.io): Vim-fork focused on extensibility and usability
```
$ brew install neovim
$ brew tap homebrew/cask-fonts
$ brew --cask install font-hack-nerd-font
$ echo 'alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim' >> ~/.zshrc
```
- [vim-plug](https://github.com/junegunn/vim-plug): vim plugin manager
  - 참고: [https://seulcode.tistory.com/272](https://seulcode.tistory.com/272)
  - onedark theme 추가: 잘안되면 `~/.config/nvim/colors` 폴더에 `onedark.vim` 파일 추가
  ```
  # neovim 설정에 맞게..
  $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  $ mkdir ~/.config/nvim
  # init.vim에 아래 코드 추가(:PlugInstall 해야함)
  $ vi ~/.config/nvim/init.vim
        
  " Plugins will be downloaded under the specified directory.
  call plug#begin('~/.local/share/nvim/site/autoload')
        
  " Declare the list of plugins.
  Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim'
        
  " List ends here. Plugins become visible to Vim after this call.
  call plug#end()
        
  set number
  syntax on
  colorscheme onedark
  ```
- [fzf](https://github.com/junegunn/fzf): A command-line fuzzy finder
```
$ brew install fzf
$ $(brew --prefix)/opt/fzf/install
$ source ~/.zshrc
```
- [tig](https://github.com/jonas/tig): Text-mode interface for git 
```
$ brew install tig
```
- [jq](https://github.com/stedolan/jq): Command-line JSON processor
```
$ brew install jq
```
- [thefuck](https://github.com/nvbn/thefuck): Magnificent app which corrects your previous console command.
```
$ brew install thefuck
```
- [fd](https://github.com/sharkdp/fd): A simple, fast and user-friendly alternative to 'find'
```
$ brew install fd
$ echo 'alias find="fd"' >> ~/.zshrc
$ source ~/.zshrc
```
- [exa](https://github.com/ogham/exa): A modern version of ‘ls’.
```
$ brew install eza
$ echo 'alias ls="eza"' >> ~/.zshrc
$ source ~/.zshrc
```
- [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings.
```
$ brew install bat
$ echo 'alias cat="bat"' >> ~/.zshrc
$ source ~/.zshrc
```
- [tldr](https://github.com/tldr-pages/tldr): Simplified and community-driven man pages
```
$ brew install tldr
$ echo 'alias man="tldr"' >> ~/.zshrc
$ source ~/.zshrc
```
- [wifi-password](https://github.com/rauchg/wifi-password): Get the password of the wifi you're on (bash)
```
$ brew install wifi-password
```
- [fkill](https://github.com/sindresorhus/fkill-cli): Fabulously kill processes.
```
$ npm install --global fkill-cli
$ echo 'alias pkill="fkill"' >> ~/.zshrc
$ source ~/.zshrc
```
- [scc](https://github.com/boyter/scc): accurate code counter with complexity calculations
```
$ brew install scc
```
- lerna
```shell
$ npm install -g lerna
```

- fkill
$ npm install --global fkill-cli

- fx
$ brew install fx

### ETC

- 한글에서 ₩ 대신 \` 사용. 재부팅 필요
```
$ if ! [ -f ~/Library/KeyBindings/DefaultkeyBinding.dict ]; then mkdir -p ~/Library/KeyBindings && echo '{"₩" = ("insertText:", "\`");}' > ~/Library/KeyBindings/DefaultkeyBinding.dict; fi
```
- 로그인시 Other… 삭제
```
$ sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool FALSE
```
- `cmd+ctrl+d Dictionary` 실행 제거
```
$ defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
```

---

# Resource files for tak-bro
- [web](https://github.com/tak-bro/resources/tree/master/web)
- [ios](https://github.com/tak-bro/resources/tree/master/ios)
- [setup](https://github.com/tak-bro/resources/tree/master/setup)
    - [windows](https://github.com/tak-bro/resources/tree/master/setup/windows)
- [javascript](https://github.com/tak-bro/resources/tree/master/javascript)
