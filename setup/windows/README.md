# 윈도우 개발환경 세팅

### Chocolatey
- [Chocolatey](https://chocolatey.org/): The package manager for Windows
- Install powershell.
  - [https://github.com/PowerShell/PowerShell](https://github.com/PowerShell/PowerShell)
- Run Cmd
  - Proxy 세팅되어 있을 때 다음 커맨드 실행
  ```shell
  $ @powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH="%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
  ```
- 설치가 완료되면 이제 cmd에서 choco 커맨드 사용 가능

-------------------------

### Peco
- Peco: 증분검색을 통한 텍스트 필터링 도구
  - [https://github.com/peco/peco](https://github.com/peco/peco)
- Install on Windows
  - 위의 choco가 설치되어 있어야 한다. 
  - 다음 커맨드로 설치
  ```bash
  $ choco install peco
  ```

#### Pcd 
- pcd: peco + cd 기능
  - [https://github.com/mattn/pcd](https://github.com/mattn/pcd)
- 아래 pcd.bat 파일을 만들어서 system32에 넣자.(gvim으로 실행하도록 세팅함)
- 해당 배치파일 실행하면 .peco-cd 파일이 만들어지는데, 이 파일이 폴더 경로를 저장하는 파일이다.
  ```cmd
  @echo off
  set PCD_CONFIG=%USERPROFILE%\.pcd

  if "%1" equ "add" (
    if "%2" neq "" (
      echo %~dpf2>> "%PCD_CONFIG%"
      goto end
    )
    goto usage
  )
  if "%1" equ "edit" (
    goto edit
  )
  if "%1" neq "" (
    goto usage
  )
  goto query

  :usage
  echo %0 [add PATH ^| edit]
  goto end

  :edit
  if "%EDITOR%" neq "" (
    "%EDITOR%" "%PCD_CONFIG%"
    goto end
  )
  gvim "%PCD_CONFIG%"
  goto end

  :query
  rem NOTE:
  rem
  rem If you have a problem caused by character-set, modify below part like:
  rem   'type ^"%USERPROFILE%\.pcd^" ^| iconv -f char -t utf-8 ^| peco --null'
  rem
  for /f "delims=" %%i in ('type ^"%PCD_CONFIG%^" ^| peco') do (
    cd /D %%i
    break
  )

  :end
  ```
- How to add to pcd
  ```bash
  $ pcd add %FILEPATH%
  or
  $ pcd edit
  ```

-------------------

### grep 설치
- [grep-2.5.4 다운로드](https://sourceforge.net/projects/gnuwin32/files/grep/2.5.4/grep-2.5.4-setup.exe/download?use_mirror=jaist)
- 한글 안됨

----------------------

### Linux 명령어 툴
- UnxTools (http://sourceforge.net/projects/unxutils)
  - 특성 : Windows 환경으로 포팅된 100여가지 GNU 실행파일 모음
  - 장점 : 별도 설치 필요 없이 .exe 파일 복사만으로 즉시 사용
  - 단점 : 제공되는 기능 이외 패키지 추가 없음
  - 위 경로에서 UnxUpdates, UnxUtils 다운로드
  - bin 폴더에 있는 exe 파일들 D:\command 로 이동
- D:\command 환경변수 추가
- Gnu 32 설치함
> Cmder 설치하면 굳이 안해도 될듯

### ConEmu 대신 **Cmder** 설치
- Cmder: a software package created out of pure frustration over the absence of **nice console emulators on Windows**
  - [https://github.com/cmderdev/cmder](https://github.com/cmderdev/cmder)
  - ConEmu를 기반으로 좀더 UI 다듬은 버전임
  - 한글과 관련된 버그가 있음
- Cmder 다운 받고 실행하면 ls 명령어 안먹음. 아래 명령어 실행
   ```bash
   $ alias ls=ls -F --color $*
   ```
- Shortcut 세팅
  - Ctrl + Shift + t: Split-duplicate active 'shell' split to **bottom**
  - Ctrl + t : Split-duplicate active 'shell' split to **right**
  - Ctrl + n : Create new console
  - Ctrl + w : 지워줘야함 

-----------------------------

### Perfoce 
- VS2010에 마켓 플레이스에서 perforce 검색 및 설치
- option->source control 에서 VS2P4 선택
- 기존 perforce 의 workspace에서 아래 명령어 치면 서버 세팅 나옴
- VS2P4 버그 많음. 

#### Perfoce config setting
- vi .p4config
  - 아래 내용 입력
  ```
  P4Client=hyungtak.jin_gCommon
  P4USER=hyungtak.jin
  P4PORT=ssl:helix.engops.health.ge.com:1668
  ```
- 커맨드 창에서 아래 내용 입력 
  ```bash 
  $ p4 set P4CONFIG=.p4config
  $ p4 info # or p4 set
  ```

- Perforce Command  
  - [Perforce - 탱이의 잡동사니](http://wiki.pchero21.com/wiki/Perforce)

---------------------------

### VIM
- gVim 설치

~~- spf13-vim: a distribution of vim plugins and resources for Vim, Gvim and MacVim.~~

   ~~- [https://github.com/spf13/spf13-vim](https://github.com/spf13/spf13-vim)~~

~~- Install spf13-vim (처리하는데 좀 느림. 프록시 때문인지..)~~

~~```bash~~
~~$ choco install spf13-vim~~
~~```~~

~~- 설치되는게 너무 많다. 나중에 지울 필요 있음~~

- [https://github.com/amix/vimrc](https://github.com/amix/vimrc)
```bash
$ git clone https://github.com/amix/vimrc.git ~/.vim_runtime
$ sh ~/.vim_runtime/install_awesome_vimrc.sh
```
- 로딩하는데 오래걸려서 extension은 지움 
  - .vimrc 파일 수정 
  


#### Tips
- 특정 단어가 들어있는 라인만 삭제
```
:g/<word>/d
```

- 특정 단어가 들어있는 라인을 제외한 모든 라인 삭제
```
:g!/<word>/d
:v/<word>/d
```

----------------------------


### VSCode
- Download link for installed extensions
  - [VIM](https://vscodevim.gallery.vsassets.io/_apis/public/gallery/publisher/vscodevim/extension/Vim/0.6.5/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [XML Tools](https://DotJoshJohnson.gallery.vsassets.io/_apis/public/gallery/publisher/DotJoshJohnson/extension/xml/1.7.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [C#](https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/csharp/1.7.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Python](https://donjayamanne.gallery.vsassets.io/_apis/public/gallery/publisher/donjayamanne/extension/python/0.6.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [vscode_icons](https://robertohuertasm.gallery.vsassets.io/_apis/public/gallery/publisher/robertohuertasm/extension/vscode-icons/7.3.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [C/C++](https://ms-vscode.gallery.vsassets.io/_apis/public/gallery/publisher/ms-vscode/extension/cpptools/0.10.3/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Beautify](https://hookyqr.gallery.vsassets.io/_apis/public/gallery/publisher/HookyQR/extension/beautify/1.0.1/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Debegger for Chrome](https://msjsdiag.gallery.vsassets.io/_apis/public/gallery/publisher/msjsdiag/extension/debugger-for-chrome/2.6.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Go](https://lukehoban.gallery.vsassets.io/_apis/public/gallery/publisher/lukehoban/extension/Go/0.6.55/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Git History](https://donjayamanne.gallery.vsassets.io/_apis/public/gallery/publisher/donjayamanne/extension/githistory/0.2.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
  - [Material-Theme](https://zhuangtongfa.gallery.vsassets.io/_apis/public/gallery/publisher/zhuangtongfa/extension/Material-theme/2.2.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)

------------------------------

### 윈도우 단축키
- 윈도우 단축키 
  - 윈도우 키 + E : 윈도우 탐색기 실행 / 내컴퓨터와 동일
  - 윈도우 키 + F : 윈도우 검색창 실행 / 시작-검색과 동일
  - 윈도우 키 + R : 윈도우 실행창 실행 / 시작-실행
  - 윈도우 키 + D : 모든 창 최소화 / 단축키 다시 누르면 원래대로 돌아옴
  - 윈도우 키 + pause Break : 윈도우 시스템 정보 실행

- 실행창 명령어
  - notepad : 메모장
  - calc : 계산기
  - mspaint : 그림판
  - clipbrd : 클립북 뷰어
  - cmd : 도스창
  - dxdiag : 다이렉트 X 진단도구
  - iexplore : 익스플로러
  - mstsc : 원격 데스크탑
  - osk : 화상키보드
  - winword : ms office 워드
  - powerpnt : ms office 파워포인트
  - excel : ms office 엑셀
  - outlook : ms office 아웃룩
  - wordpad : 워드패드
  - winmine : 지뢰찾기
  - sndvol : 볼륨조절

- 관리콘솔 명령어
  - certmgr.msc : 인증서
  - ntmsmgr.msc : 이동식 저장소
  - ntmsoprq.msc : 이동식 저장소 운영자 요청
  - compmgmt.msc : 컴퓨터관리
  - devmgmt.msc : 장치관리자
  - diskmgmt.msc : 디스크 관리
  - dfrg.msc : 디스크 조각모음
  - eventvwr.msc : 이벤트 뷰어
  - fsmgmt.msc : 공유폴더
  - perfmon.msc : 성능모니터뷰
  - services.msc : 서비스

- start . #탐색기 실행