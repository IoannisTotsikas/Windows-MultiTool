@echo off
:: Αρχικοποιούμε το χρώμα και το καλωσόρισμα μία φορά
color 0A
call :welcome_message

:: Κύριο μενού επιλογών
:title Multi-Tool Utility
:menu
cls
echo ======================================
echo          MULTI-TOOL UTILITY
echo ======================================
echo 1. Check Disk
echo 2. Defragment Disk
echo 3. System Information
echo 4. Domain Lookup
echo 5. Temporary Files Cleanup
echo 6. Exit
echo ======================================
set /p choice=Select an option [1-6]: 

if "%choice%"=="1" goto check_disk
if "%choice%"=="2" goto defragment
if "%choice%"=="3" goto system_info
if "%choice%"=="4" goto domain_lookup
if "%choice%"=="5" goto temp_cleanup
if "%choice%"=="6" exit
echo Invalid option, please try again.
pause
goto menu

:check_disk
cls
set /p drive=Enter the drive letter (e.g., C): 
chkdsk %drive%:
echo.
echo Press any key to return to the main menu...
pause >nul
goto menu

:defragment
cls
set /p drive=Enter the drive letter (e.g., C): 
start /wait defrag %drive%: /U /V
echo.
echo Defragmentation completed.
echo Press any key to return to the main menu...
pause >nul
goto menu

:system_info
cls
systeminfo | more
echo.
echo Press any key to return to the main menu...
pause
goto menu

:domain_lookup
cls
set /p domain=Enter the domain name or IP: 
nslookup %domain%
pause
goto menu

:temp_cleanup
cls
echo Cleaning temporary files...
del /s /q %temp%\*.* 
del /s /q C:\Windows\Temp\*.*
echo Cleanup completed!
pause
goto menu

:: Εδώ το καλωσόρισμα εμφανίζεται μόνο μία φορά
:welcome_message
cls
        echo "__        __  _____   _        ____    ___    __  __   _____  
        echo "\ \      / / | ____| | |      / ___|  / _ \  |  \/  | | ____|
        echo " \ \ /\ / /  |  _|   | |     | |     | | | | | |\/| | |  _|  
        echo "  \ V  V /   | |___  | |___  | |___  | |_| | | |  | | | |___  
        echo "   \_/\_/    |_____| |_____|  \____|  \___/  |_|  |_| |_____|
        echo "                                                                 LOADING...
timeout /t 3 >nul
:: λουπ για αλλαγή χρωμάτων για το καλωσόρισμα
for %%A in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
    color %%A
    timeout /t 1 >nul
)
goto menu




