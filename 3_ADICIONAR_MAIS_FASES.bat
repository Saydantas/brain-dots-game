@echo off
chcp 65001 >nul
echo ======================================================================
echo    BRAIN DOTS - GERADOR AUTOMÁTICO DE NOVAS FASES
echo ======================================================================
echo.
set /p QUANTIDADE="Quantas novas fases deseja gerar agora? (Padrão: 10): "
if "%QUANTIDADE%"=="" set QUANTIDADE=10

echo.
echo Gerando %QUANTIDADE% novas fases matematicamente verificadas...
python "%~dp0google-play-package\levels-system\add_new_level.py" --generate %QUANTIDADE%

echo.
echo Atualizando repositório Git local...
set PATH=C:\Program Files\Git\cmd;%PATH%
git add -A
git commit -m "feat: Adicionadas %QUANTIDADE% novas fases ao Brain Dots" >nul 2>&1

echo.
echo Fases integradas com sucesso!
echo.
pause
