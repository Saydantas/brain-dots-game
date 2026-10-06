@echo off
chcp 65001 >nul
echo ======================================================================
echo    BRAIN DOTS - COMPILAÇÃO AUTOMÁTICA DO PACOTE .AAB NA NUVEM
echo ======================================================================
echo.
echo Verificando conexão com o GitHub...

set PATH=C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI;%PATH%

gh auth status >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo.
    echo Você ainda não conectou sua conta do GitHub neste computador.
    echo Vamos abrir seu navegador para conectar com 1 clique:
    echo.
    gh auth login --web -h github.com -p https -w
)

echo.
echo Criando repositório e enviando código do Brain Dots...
gh repo create brain-dots-game --public --source=. --remote=origin --push

echo.
echo Repositório enviado com sucesso!
echo O GitHub Actions está compilando o pacote .aab na nuvem neste exato momento.
echo.
echo Abrindo a página de compilação no seu navegador...
start https://github.com/%USERNAME%/brain-dots-game/actions

echo.
echo Quando a compilação terminar (leva cerca de 2 minutos), baixe o arquivo .aab
echo e envie para o Google Play Console!
echo.
pause
