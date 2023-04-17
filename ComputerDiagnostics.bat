echo off
@color 3


::    |    Opening prompts for the start of the script.
::    V  

title=Computer System Diagnostics
@echo __________________________________________________________________________ >> "Script Results.txt"
set info="Script Results.txt"
cls
echo "	 ____ ____ ____ ____ ____ ___ ____	                        "
echo "	||H |||u |||n |||t |||e |||r  |s|\	                        "
echo "	||__|||__|||__|||__|||__|||__||_|\                          "
echo "	|/__\|/__\|/__\|/__\|/__\|/__|/__\	                        "
echo "	 ____ ____ ____ ____ ____ ____ ____ ____ ___ ____ ___ ___   	            "
echo "	||D |||i |||a |||g |||n |||o |||s |||t |||i |||c |||s |||                 "
echo "	||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||                 "
echo "	|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\||    	            "
echo.
echo.
echo.
@SET /P name=Please enter your name: 
@SET /P batchnum=%name% please enter the batch #:
cls
@echo Date: %date%-%time% >> %info%
@echo Name: %name% >> %info%
@echo Batch #: %batchnum% >> %info%
@title=Computer System Diagnostics      User: %name%  /  Batch #: %batchnum%

::    |    Main Menu
::    V  

:MENU
cls
ECHO. 
echo "	 ____ ____ ____ ____ ____ ___ ____	                        "
echo "	||H |||u |||n |||t |||e |||r  |s|\	                        "
echo "	||__|||__|||__|||__|||__|||__||_|\                          "
echo "	|/__\|/__\|/__\|/__\|/__\|/__|/__\	                        "
echo "	 ____ ____ ____ ____ ____ ____ ____ ____ ___ ____ ___ ___   	            "
echo "	||D |||i |||a |||g |||n |||o |||s |||t |||i |||c |||s |||                 "
echo "	||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||__|||                 "
echo "	|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\||    	            "
ECHO.
ECHO _____________________________________________________________
ECHO.
ECHO PRESS 1, 2, 3, 4, 5 OR 6 to select your task, or 7 to Complete.
ECHO _____________________________________________________________
ECHO.
ECHO [1] - Keyboard Test
ECHO [2] - Ethernet Test
ECHO [3] - Sound Test
ECHO [4] - PC Info
ECHO [5] - Shutdown
ECHO [6] - Restart
ECHO [7] - Complete
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, 6 or 7 then press ENTER:

::    |    Menu Options functionality.
::    V   

IF %M%==1 GOTO KEYBOARD
IF %M%==2 GOTO ETHERNET
IF %M%==3 GOTO SOUND
IF %M%==4 GOTO INFO
IF %M%==5 GOTO SHUTDOWN
IF %M%==6 GOTO RESTART
IF %M%==7 GOTO COMPLETE


:KEYBOARD
start backend\keyboard.html
cls
GOTO MENU



:ETHERNET
cls
@ping 127.0.0.1
@ping www.google.com
@ping www.yahoo.com
pause
cls
GOTO MENU

:SOUND
cls
echo.
echo Press "1" + "Enter" to sound test.
echo Press "x" + "Enter" to go back to menu.
echo.
@SET /P sound=">>> "
IF %sound%==1 GOTO SOUNDSTART
IF %sound%==x GOTO MENU
:SOUNDSTART


set "file=backend\soundcheck.wav"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs

start /min sound.vbs
pause
GOTO SOUND


:INFO
cls
@systeminfo
pause
cls
GOTO MENU



:SHUTDOWN
cls
SET /P shutdownn=Are you sure you want to shutdown? [Y/N]:
IF %shutdownn%==Y GOTO SHUTDOWN2
IF %shutdownn%==y GOTO SHUTDOWN2
IF %shutdownn%==N GOTO MENU
IF %shutdownn%==n GOTO MENU
:SHUTDOWN2
shutdown /s /t 0



:RESTART
cls
SET /P restartt=Are you sure you want to restart? [Y/N]:
IF %restartt%==Y GOTO RESTART2
IF %restartt%==y GOTO RESTART2
IF %restartt%==N GOTO MENU
IF %restartt%==n GOTO MENU
:RESTART2
shutdown /r /t 0

::    |    Questionnaire Screen for the CF-31 Diesel QC.
::    V   

:COMPLETE
cls
del sound.vbs
echo "	 ____ ____ ____ ____ ____ ____ 	      "
echo "	||R |||u |||g |||g |||e |||d ||	      "
echo "	||__|||__|||__|||__|||__|||__||	      "
echo "	|/__\|/__\|/__\|/__\|/__\|/__\|	      "
echo "	 ____ ____ ____ ____ ____      	      "
echo "	||D |||e |||p |||o |||t ||     	      "
echo "	||__|||__|||__|||__|||__||     	      "
echo "	|/__\|/__\|/__\|/__\|/__\|     	      "
echo.
echo.
echo.
echo Almost done %name%, please answer the following questions to complete the checklist:
echo.
echo Please press "Y" or "N" and press Enter.
echo.
@SET /P poweronoff=Power ON / OFF? [Y/N]
@echo Power ON and OFF: %poweronoff% >> %info%
@SET /P ramsize=RAM Size 4GB? [Y/N]
@echo Ram Size 4GB: %ramsize% >> %info%
@SET /P batterycheck=Battery? [Y/N]
@echo Battery: %batterycheck% >> %info%
@SET /P caddy=Caddy? [Y/N]
@echo Caddy: %caddy% >> %info%
@SET /P caddycablereg=Did caddy cable register? [Y/N]
@echo Caddy Cable Register: %caddycablereg% >> %info%
@SET /P lcdvideo=LCD / Video? [Y/N]
@echo LCD / Video: %lcdvideo% >> %info%
@SET /P keyboardvisual=Keyboard Visual / Works? [Y/N]
@echo Keyboard Visual / Works: %keyboardvisual% >> %info%
@SET /P WIFI=WiFi? [Y/N]
@echo WiFi: %WIFI% >> %info%
@SET /P bluetooth=Bluetooth? [Y/N]
@echo Bluetooth: %bluetooth% >> %info%
@SET /P sound=Sound? [Y/N]
@echo Sound: %sound% >> %info%
@SET /P mouse=Mouse Visual / Works? [Y/N]
@echo Mouse Visual / Works: %mouse% >> %info%
@SET /P usb=USB x4 Side / Back? [Y/N]
@echo USB x4 Side / Back: %usb% >> %info%
@SET /P ethernet=Ethernet? [Y/N]
@echo Ethernet: %ethernet% >> %info%
@SET /P fan=FAN? [Y/N]
@echo FAN: %fan% >> %info%
@SET /P dustcover=Dust Cover? [Y/N]
@echo Dust Cover: %dustcover% >> %info%
@SET /P palmrest=Palm Rest? [Y/N]
@echo Palm Rest: %palmrest% >> %info%
@SET /P backplate=Back Plate / RAM Door? [Y/N]
@echo Back Plate / RAM Door: %backplate% >> %info%
@SET /P lidvisual=LID Visual / No Damage? [Y/N]
@echo LID Visual / No Damage: %lidvisual% >> %info%

::    |    Final Screen once all tests have been complete.
::    V   

@echo __________________________________________________________________________ >> %info%
cls
echo "	 ____ ____ ____ ____ ____ ____ 	      "
echo "	||R |||u |||g |||g |||e |||d ||	      "
echo "	||__|||__|||__|||__|||__|||__||	      "
echo "	|/__\|/__\|/__\|/__\|/__\|/__\|	      "
echo "	 ____ ____ ____ ____ ____      	      "
echo "	||D |||e |||p |||o |||t ||     	      "
echo "	||__|||__|||__|||__|||__||     	      "
echo "	|/__\|/__\|/__\|/__\|/__\|     	      "
echo.
echo.
echo.
echo "Your results will be in your "Script Results" file, located in the same directory as this script."
echo.
echo.
echo.
echo.
echo.
echo.
echo.
@pause























:: Written by Marcus. <3