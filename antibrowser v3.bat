@echo off
setlocal EnableDelayedExpansion
color 1F
title ANTI BROWSER - Detector de Navegadores

:: Cabeçalho Estilizado
echo.
echo ===========================================================
echo                 ANTI BROWSER - DETECTOR           
echo             Verificador e Limpeza de Perfis        
echo ============================================================
echo [Detectando: Google Chrome, Mozilla Firefox, Microsoft Edge]
echo.

:: Verificação de Navegadores por Usuario
echo ------------------------------------------------------------
echo Listando usuarios com navegadores detectados
echo ------------------------------------------------------------
echo.

set "chromePath=\AppData\Local\Google\Chrome"
set "firefoxPath=\AppData\Roaming\Mozilla\Firefox"
set "edgePath=\AppData\Local\Microsoft\Edge"
set "userRoot=C:\Users"

for /D %%U in ("%userRoot%\*") do (
    set "userDir=%%U"
    set "userName=%%~nxU"
    set "found="

    echo [Usuário: !userName!]

    if exist "%%U%chromePath%" (
        echo     - Chrome encontrado
        set "found=1"
    )

    if exist "%%U%firefoxPath%" (
        echo     - Firefox encontrado
        set "found=1"
    )

    if exist "%%U%edgePath%" (
        echo     - Edge encontrado
        set "found=1"
    )

    if not defined found (
        echo     - Nenhum navegador detectado
    )

    echo.
)

:: Excluir perfis do Microsoft Edge
echo ------------------------------------------------------------
echo Deseja excluir todos os perfis do Microsoft Edge? (s/n)
echo ------------------------------------------------------------
set /p excluirEdge=

if /I "%excluirEdge%"=="s" (
    echo.
    echo Finalizando sessões do Edge...
    taskkill /F /IM msedge.exe >nul 2>&1
    taskkill /F /IM msedgewebview2.exe >nul 2>&1

    echo Excluindo perfis do Edge...
    for /D %%U in ("%userRoot%\*") do (
        set "edgeUserPath=%%U\AppData\Local\Microsoft\Edge"
        if exist "!edgeUserPath!" (
            echo     - Excluindo: !edgeUserPath!
            rmdir /s /q "!edgeUserPath!"
        )
    )

    echo Perfis do Edge excluídos com sucesso!
) else (
    echo Perfis do Edge foram mantidos.
)

:: Bloquear login automático no Edge
echo.
echo ------------------------------------------------------------
echo Deseja bloquear o login automatico do Edge? (s/n)
echo ------------------------------------------------------------
set /p resposta=

if /I "%resposta%"=="s" (
    echo.
    echo Bloqueando login automático do Edge...

    REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BrowserSignin" /t REG_DWORD /d 0 /f >nul 2>&1
    REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ForceSignin" /t REG_DWORD /d 0 /f >nul 2>&1

    echo Login automático bloqueado com sucesso!
) else (
    echo Nenhuma alteração feita.
)

:: Limpar dados do Chrome e Firefox
echo.
echo ------------------------------------------------------------
echo Deseja limpar cookies, cache e senhas do Chrome e Firefox? (s/n)
echo ------------------------------------------------------------
set /p limparDados=

if /I "%limparDados%"=="s" (
    echo.
    echo Limpando dados salvos dos navegadores...

    for /D %%U in ("%userRoot%\*") do (
        set "chromeUserPath=%%U\AppData\Local\Google\Chrome\User Data\Default"
        if exist "!chromeUserPath!" (
            echo     - Limpando Chrome de %%~nxU
            del /f /q "!chromeUserPath!\Cookies" >nul 2>&1
            del /f /q "!chromeUserPath!\Login Data" >nul 2>&1
            del /f /q "!chromeUserPath!\Web Data" >nul 2>&1
            rmdir /s /q "!chromeUserPath!\Cache" >nul 2>&1
        )

        set "ffProfilesPath=%%U\AppData\Roaming\Mozilla\Firefox\Profiles"
        if exist "!ffProfilesPath!" (
            for /D %%P in ("!ffProfilesPath!\*") do (
                echo     - Limpando Firefox de %%~nxU
                del /f /q "%%P\cookies.sqlite" >nul 2>&1
                del /f /q "%%P\logins.json" >nul 2>&1
                rmdir /s /q "%%P\cache2" >nul 2>&1
            )
        )
    )

    echo Dados do Chrome e Firefox limpos com sucesso!
) else (
    echo Dados dos navegadores foram mantidos.
)

:: Excluir perfis do Chrome
echo.
echo ------------------------------------------------------------
echo Deseja excluir todos os perfis do Chrome? (s/n)
echo ------------------------------------------------------------
set /p excluirChrome=

if /I "%excluirChrome%"=="s" (
    echo.
    echo Finalizando processos do Chrome...
    taskkill /F /IM chrome.exe >nul 2>&1

    echo Excluindo perfis do Chrome...
    for /D %%U in ("%userRoot%\*") do (
        set "chromeUserPath=%%U\AppData\Local\Google\Chrome"
        if exist "!chromeUserPath!" (
            echo     - Excluindo: !chromeUserPath!
            rmdir /s /q "!chromeUserPath!"
        )
    )

    echo Perfis do Chrome excluídos com sucesso!
) else (
    echo Perfis do Chrome foram mantidos.
)

:: Excluir perfis do Firefox
echo.
echo ------------------------------------------------------------
echo Deseja excluir todos os perfis do Firefox? (s/n)
echo ------------------------------------------------------------
set /p excluirFirefox=

if /I "%excluirFirefox%"=="s" (
    echo.
    echo Finalizando processos do Firefox...
    taskkill /F /IM firefox.exe >nul 2>&1

    echo Excluindo perfis do Firefox...
    for /D %%U in ("%userRoot%\*") do (
        set "firefoxUserPath=%%U\AppData\Roaming\Mozilla\Firefox"
        if exist "!firefoxUserPath!" (
            echo     - Excluindo: !firefoxUserPath!
            rmdir /s /q "!firefoxUserPath!"
        )
    )

    echo Perfis do Firefox excluídos com sucesso!
) else (
    echo Perfis do Firefox foram mantidos.
)

echo.
echo ============================================================
echo Todas as ações foram concluídas. Pressione qualquer tecla para sair.
echo ============================================================
pause >nul
exit
