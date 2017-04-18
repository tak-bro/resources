@echo off
set currentProject=%VIEWROOT%
echo %VIEWROOT%|findstr "projectA" >nul
if errorlevel 1 (
    set pecoFile=%USERPROFILE%\.peco-cdb
    echo Filtering projectB directory on %pecoFile%
) else (
    set pecoFile=%USERPROFILE%\.peco-cda
    echo Filtering projectA directory on %pecoFile%
)


if "%1" equ "add" (
  if "%2" neq "" (
    echo %2 >> "%pecoFile%"
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
  "%EDITOR%" "%pecoFile%"
  goto end
)
gvim %pecoFile%
goto end

:query
rem NOTE:
rem
rem If you have a problem caused by character-set, modify below part like:
rem   'type ^"%USERPROFILE%\.peco-cd^" ^| iconv -f char -t utf-8 ^| peco'
rem
rem for /f %%i in ('type ^"%USERPROFILE%\.peco-cd^" ^| peco') do (
for /f %%i in ('type ^%pecoFile% ^| peco') do (
  cd /d %%i
  break
)

:end
