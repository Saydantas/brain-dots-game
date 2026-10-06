@echo off
chcp 65001 >nul
echo ======================================================================
echo    BRAIN DOTS - ABRINDO GOOGLE PLAY CONSOLE NO NAVEGADOR
echo ======================================================================
echo.
echo Abrindo a página de criação de aplicativos no Google Play Console...
echo.
start https://play.google.com/console/u/0/developers/create-app
echo.
echo Quando a página abrir no seu navegador:
echo 1. Nome do app: Brain Dots: Traço Único
echo 2. Tipo: Jogo
echo 3. Gratuito
echo.
echo Pressione qualquer tecla para abrir a pasta com as imagens e textos...
pause >nul
start "" "%~dp0google-play-package\playstore-listing"
