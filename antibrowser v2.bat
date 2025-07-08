@echo off
setlocal EnableDelayedExpansion

echo =======================================
echo        ANTI-BROWSER - DETECTOR
echo         (Chrome, Firefox, Edge)
echo =======================================
echo.
echo Listando Usuarios com Algum dos 3 Navegadores
echo --------------------------------
echo.

set "chromePath=\AppData\Local\Google\Chrome"
set "firefoxPath=\AppData\Roaming\Mozilla\Firefox"
set "edgePath=\AppData\Local\Microsoft\Edge"

set "userRoot=C:\Users"

for /D %%U in ("%userRoot%\*") do (
    set "userDir=%%U"
    set "userName=%%~nxU"
    set "found="

    echo [!userName!]

    if exist "%%U%chromePath%" (
        echo     --> Chrome encontrado
        set "found=1"
    )

    if exist "%%U%firefoxPath%" (
        echo     --> Firefox encontrado
        set "found=1"
    )

    if exist "%%U%edgePath%" (
        echo     --> Edge encontrado
        set "found=1"
    )

    if not defined found (
        echo     --> Nenhum navegador detectado
    )

    echo.
)

echo.
echo Deseja bloquear o login automático do Edge com a conta Microsoft logada para todos os usuarios atuais e novos? (s/n)
set /p resposta=

if /I "%resposta%"=="s" (
    echo.
    echo [!] BLOQUEANDO login automático do Edge...

    REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BrowserSignin" /t REG_DWORD /d 0 /f >nul 2>&1
    REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ForceSignin" /t REG_DWORD /d 0 /f >nul 2>&1

    echo [+] Login automático do Edge foi bloqueado com sucesso!
) else (
    echo [-] Nenhuma alteração feita.
)

echo.
echo Deseja excluir todos os perfis do Edge de todos os usuários? (s/n)
set /p excluirEdge=

if /I "%excluirEdge%"=="s" (
    echo.
    echo [!] Excluindo perfis do Edge...

    for /D %%U in ("%userRoot%\*") do (
        set "edgeUserPath=%%U\AppData\Local\Microsoft\Edge"
        if exist "!edgeUserPath!" (
            echo     --> Excluindo: !edgeUserPath!
            rmdir /s /q "!edgeUserPath!"
        )
    )

    echo [+] Perfis do Edge excluídos com sucesso!
) else (
    echo [-] Perfis do Edge foram mantidos.
)

echo.
echo Deseja limpar todos os cookies, cache e senhas salvas do Firefox e Chrome? (s/n)
set /p limparDados=

if /I "%limparDados%"=="s" (
    echo.
    echo [!] Limpando dados salvos dos navegadores...

    for /D %%U in ("%userRoot%\*") do (
        set "chromeUserPath=%%U\AppData\Local\Google\Chrome\User Data\Default"
        if exist "!chromeUserPath!" (
            echo     --> Limpando Chrome de %%~nxU
            del /f /q "!chromeUserPath!\Cookies" >nul 2>&1
            del /f /q "!chromeUserPath!\Login Data" >nul 2>&1
            del /f /q "!chromeUserPath!\Web Data" >nul 2>&1
            rmdir /s /q "!chromeUserPath!\Cache" >nul 2>&1
        )

        set "ffProfilesPath=%%U\AppData\Roaming\Mozilla\Firefox\Profiles"
        if exist "!ffProfilesPath!" (
            for /D %%P in ("!ffProfilesPath!\*") do (
                echo     --> Limpando Firefox de %%~nxU
                del /f /q "%%P\cookies.sqlite" >nul 2>&1
                del /f /q "%%P\logins.json" >nul 2>&1
                rmdir /s /q "%%P\cache2" >nul 2>&1
            )
        )
    )

    echo [+] Dados do Chrome e Firefox limpos com sucesso!
) else (
    echo [-] Dados dos navegadores foram mantidos.
)

echo.
echo Deseja excluir todos os perfis do Chrome de todos os usuários? (s/n)
set /p excluirChrome=

if /I "%excluirChrome%"=="s" (
    echo.
    echo [!] Finalizando processos do Chrome...
    taskkill /F /IM chrome.exe >nul 2>&1

    echo [!] Excluindo perfis do Chrome...

    for /D %%U in ("%userRoot%\*") do (
        set "chromeUserPath=%%U\AppData\Local\Google\Chrome"
        if exist "!chromeUserPath!" (
            echo     --> Excluindo: !chromeUserPath!
            rmdir /s /q "!chromeUserPath!"
        )
    )

    echo [+] Perfis do Chrome excluídos com sucesso!
) else (
    echo [-] Perfis do Chrome foram mantidos.
)

echo.
pause
