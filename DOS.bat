@echo off
if "%1"=="12345" ( set homedir=%2 ) ELSE ( set homedir=%cd% )
set realdir=%cd%
if "%1"=="TXTED" goto TXTcom

mode con: cols=96 lines=50

echo       SSSSS              IIIIIIIIIIII            M       M            PPPP           LL
echo      S                        II                M M     M M           P  P           LL
echo       SSSSS                   II               M   M   M   M          PPPP           LL
echo            S                  II              M     M M     M         P              LL
echo       SSSSS              IIIIIIIIIIII        M       M       M        P              LLLLL
ECHO.
echo                                      DDDD            O            SSSSS     
echo                                      D   D          O O          S   
echo                                      D    D        O   O          SSSSS
echo                                      D   D          O O                S        
echo                                      DDDD            O            SSSSS    

::SIMPL-DOS source code
title SIMPL-DOS 0.38
echo SIMPL-DOS 0.38
echo Copyright 2010 Fire219 and the SIMPL-DOS Team
echo.
echo Welcome to SIMPL-DOS!
echo Type HELP to learn the commands.
echo Remember to type commands in capital letters.
echo.
echo Today is %date% at %time%.
echo.

:newcom
set cmd=0
set choice=
set /p choice=

if "%choice%"=="" goto newcom
if "%choice%"=="HELP" goto HELP
if "%choice%"=="VER" goto VERcom
if "%choice%"=="EXIT" (
if exist SIMPL_junk rd /s /q SIMPL_junk
if exist SIMPL_TXT.tmp del SIMPL_TXT.tmp
exit /b
)
if "%choice%"=="WINPRPT" goto WINPRPTcom
if "%choice%"=="OPEN" set cmd=1 & goto OPENcom
if "%choice%"=="CAKE" goto Easter1
if "%choice%"=="MOO" goto Easter2
if "%choice%"=="I AM BORED" goto Easter3
if "%choice%"=="TXTED" START SIMPL-DOS_0.38.bat TXTED %homedir% & goto newcom
if "%choice%"=="COLOR" goto COLcom
if "%choice%"=="INFO" goto INFOcom
if "%choice%"=="OTHBOS" goto OTHBcom
if "%choice%"=="ADVTOOLS" goto ADVTcom
if "%choice%"=="FILEDEL" goto FLDLcom
if "%choice%"=="INTRPIN" goto INTPcom
if "%choice%"=="INTRPIN6" goto INTP6com
if "%choice%"=="DATE" goto DATEcom
if "%choice%"=="TIME" goto TIMEcom
if "%choice%"=="OPENB" goto OPENBcom
if "%choice%"=="FILES" goto FILEScom
if "%choice%"=="TOUR" goto TOURcom
if "%choice%"=="SAM" goto SAMcom
if "%choice%"=="CLR" cls & goto newcom

echo %choice% is not a valid command.
goto newcom

:HELP
echo.
echo HELP
echo.
echo Commands:
echo ADVTOOLS = Shows the commands for advanced utilities.
echo COLOR = Allows you to change the color scheme.
echo DATE = Shows the date.
echo EXIT = Closes the Session.
echo CLR = Clears the screen.
echo FILES = Opens the file explorer.
echo HELP = Brings up this list.
echo INFO = Learn about SIMPL-DOS.
echo VER = Says the version of SIMPL-DOS and other info.
echo OPEN = Open any file on your system.
echo OPENB = Open the website of your choice. this doesnt work
echo SAM = Open the SIMPL App Manager
echo TIME = Shows the time.
echo TOUR = A Brief Tour of SIMPL-DOS.
echo TXTED = Open a simple text editor.
echo WINPRPT = Opens a Windows command prompt.
goto newcom

:VERcom
echo.
echo SIMPL-DOS 0.3 Beta  (build 0380)
echo by The SIMPL-DOS Team
echo.
echo Legal Info:
echo.
echo SIMPL-DOS kernel: Copyright 2010 Fire219
echo Most programs: Copyright 2010 Fire219
echo Color Changer code: Copyright 2010 Zorbak42
echo (External) IPv4 pinging code: Copyright 1987 IBM and Microsoft.
echo (External) IPv6 pinging code: Copyright 1993 Microsoft.
goto newcom

:WINPRPTcom
start cmd.exe
goto newcom

:Easter1
echo The cake is a lie!
goto newcom

:Easter2
echo Moo! I am a cow!
set /p choice=
 echo DON'T MILK MEH!!!!!!!!
goto newcom

:Easter3
echo You're bored, eh? Well, you've got plenty to do with SIMPL-DOS. Type HELP for commands, or maybe you'd like the tour. Go ahead and try out stuff!
goto newcom

:TXTcom
cls
title SIMPL TEXT EDITOR 2.0
if exist SIMPL_TXT.tmp del SIMPL_TXT.tmp
echo SIMPL TEXT EDITOR 2.0
echo Press Enter for new line. Close this window to exit.
echo Type "SAVETXT" (in all caps without quotes) to save your text file.
:newline
set name=*
set /p choice=
if "%choice%"=="SAVETXT" goto choosename
echo %choice% >> SIMPL_TXT.tmp
goto newline
:choosename
md SIMPL_junk
set slashfail=0
set fail=0
cd %homedir%
echo Type the name you want your file to have.
set /p name=
md "%realdir%\SIMPL_junk\%name%.12345"
if errorlevel 1 set fail=1 
if %fail%==1 (
echo Illegal character used, please try another name.
goto choosename
)
if not exist "%realdir%\SIMPL_junk\*.12345" (
echo Illegal character used, please try another name.
rd /s /q "%realdir%\SIMPL_junk"
goto choosename
)
rd /s /q "%realdir%\SIMPL_junk"
if exist "%name%" choice /n /m "The file %name% already exists, would you like to replace it [Y] or choose a different name [N]?
if ERRORLEVEL 2 goto choosename
copy "%realdir%\SIMPL_TXT.tmp" "%name%"
:cont
set /p choice= "Continue working on this document [C] or start a new document [N]?
cls
if %choice%==C (
title SIMPL TEXT EDITOR 2.0 - %name%
type SIMPL_TXT.tmp)
 if %choice%==N (
title SIMPL TEXT EDITOR 2.0
del SIMPL_TXT.tmp
)ELSE(
goto cont
)
)

:COLcom
echo.
echo What color do you want the background to be? 0 = Black, 1 = Blue, 2 = Green,    3 = Aqua, 4 = Red, 5 = Purple, 6 = Yellow, 7 = White.
set /p colour1=
echo What color do you want the text to be? 8 = Grey, 9 = Blue, A = Green, B = Aqua, C = Red, D = Purple, E = Yellow, F = White.
set /p colour2=
color %colour1%%colour2%
goto newcom

:INFOcom
echo.
echo INFO
echo.
echo SIMPL-DOS is a simple but fast version of DOS. It is programmed in Windows Batch Commands.
echo It runs inside Windows, but is isolated from it, apart from Command Prompt and your default web browser. 
echo.
echo Due to its command line only interface, and its simplicity, SIMPL-DOS is the  fastest OS around.
echo.
echo It is easy to add applications. Just open SIMPL-DOS in notepad and add a new command name and routine name under newcom.
echo Then, add the the actual app under the routine name with a colon in front of it. There's your app.
echo.
echo Well, that's about all you need to know. Feel free to make your own mod of this. Just give me credit.
echo.
echo								Have fun,
echo								Fire219 and The SIMPL-DOS Team
goto newcom


:ADVTcom
echo.
echo Advanced Utilities
echo.
echo FILEDEL = Deletes any file on your system.
echo INTRPIN = Pings the chosen IPv4 address.
echo INTRPIN6 = Pings the chosen IPv6 address.
goto newcom

:FLDLcom
echo.
echo File Deleter Utility
echo Copyright 2010 Fire219
echo WARNING: Deleting System file(s) may cause damage to your computer!
:delfile
echo Type the name  and path of the file you wish to delete.
set /p choice=
if not exist %choice% echo %choice% doesn't exist.
if not exist %choice% goto delfile
choice /n /m "Are you sure you want to delete %choice%?"
if ERRORLEVEL 2 goto delfile
del %choice%
echo Deleted.
choice /n /m "Delete another file? [Y or N]"
if ERRORLEVEL 1 goto delfile
goto newcom

:INTPcom
echo.
echo IPv4 ping Utility
echo Copyright 2010 Fire219 and 1987 IBM and Microsoft.
echo Type the IPv4 address you wish to ping.
set /p choice=
ping %choice%
goto newcom

:INTP6com
echo.
echo IPv6 ping utility 
echo Copyright 2010 Fire219 and 1993 Microsoft.
echo Type the IPv6 address you wish to ping.
set /p choice=
ping -6 %choice%
goto newcom

:DATEcom
echo.
date /t
goto newcom

:TIMEcom
echo.
time /t
goto newcom

:OPENBcom
echo Website Opener v2.0
echo Copyright 2010 Fire219
echo What site do you want to visit? (Don't type the protocol, http:// will be used.)
set /p choice=
START "http://%choice%"

goto newcom


:FILEScom
echo.
echo FileSnake v1.5
echo Copyright 2010 Fire219 and meowmeow55
echo Type CMND for navigational commands.
cd %homedir%
:nxtdir
set /p choice=%cd%:
echo.
if "%choice%"=="CMND" goto CMNDS
if "%choice%"=="DRIVE" goto CHGDRV
if "%choice%"=="DIR" (
dir /b /p
goto nxtdir
)
if "%choice%"=="HOME" goto HOMEDIR
if "%choice%"=="OPEN" goto OPENcom
if "%choice%"=="FHELP" goto FSHELP
if "%choice%"=="EXIT" (
cd "%realdir%"
goto newcom
)
cd "%choice%"
dir /b /p
goto nxtdir
:HOMEDIR
cd "%homedir%"
dir /b /p
goto nxtdir
:CHGDRV
echo Type the drive letter you want to change to (e.g. D:).
set /p choice=
%choice%
goto nxtdir
:OPENcom
if %cmd%==1 cd %homedir%
echo Type a file to open or a command to run.
set /p open=Type your command:
%open%
if %cmd%==1 (
cd "%realdir%"
goto newcom
)
goto nxtdir
:CMNDS
echo.
echo Commands
echo.
echo CMND = Open this list.
echo DIR = Get the directory listing for the current directory.
echo HOME = Go back to the Home directory.
echo OPEN = Open a file in the current directory or run any command.
echo FHELP = Open the help document.
echo EXIT = Exit (self-explanatory really :P)
goto nxtdir
:FSHELP
echo.
echo FileSnake Help
echo.
echo To go to a directory:
echo Type its name when you see the flashing cursor.
echo.
echo To open a file, type "OPEN", then type your command.
echo.
echo End of Help. Continue from where you left off.
goto nxtdir

:TOURcom
cls
echo.
echo Welcome to SIMPL-DOS, the new DOS that will fit on a floppy!
echo.
pause
echo.
echo SIMPL-DOS is made for you to get things done fast. Plain and SIMPLe.
echo For older people, this also can be used for nostalgia, remembering the days of  MS-DOS and i386s.
echo.
pause
echo.
echo Ok, enough stuff about SIMPL-DOS. Now it's time to learn how to use it.
echo. 
echo And from now on, I will refer to SIMPL-DOS as SIMPL, because "SIMPL-DOS" takes a minute to write, and I am VERY lazy. ;)
pause
echo. 
echo Ok, you have figured out how to start a program, or else you would not be reading this, so I will skip that. We will start with how to tell if a program is     ready.
echo.
pause
echo When you go into most programs, you notice a small introduction for the program, then a blinking cursor/underscore. That cursor means that SIMPL is waiting for input. 
echo.
echo Next is how SIMPL may interact with Windows applications.
pause
echo.
echo Some programs may interact with outside (Windows) applications.  Due to the obvious limitations of text-based technology and Batch Processing (what we use to make SIMPL), we cannot  run graphical apps in SIMPL. The next best thing is to use Windows apps. For example, Website Opener asks for the webpage you wish to visit, then tells your web browser to go there.
echo.
echo Next: Last Stop
echo.
pause
echo.
echo Well, that is  about all I can tell you. SIMPL is constantly being improved. Keep your eye out for new releases.

echo Have fun, and if you are a Scratcher (scratch.mit.edu), Scratch on!
echo Fire219
echo.
pause
cls
goto newcom

:SAMcom
if not exist "%userprofile%\SIMPL-apps" md "%userprofile%\SIMPL-apps"
echo.
echo SIMPL App Manager (SAM) v1.0
echo Copyright 2010 Fire219
echo.
echo Confused? Type SAMHLP to learn what this is!
echo Type EXIT to exit.
echo.
:SAMstart
echo Apps in SIMPL-apps folder:
dir "%userprofile%\SIMPL-apps\" /B
goto SAMopen
:SAMhlp
echo.
echo SIMPL App Manager Help
echo.
echo SIMPL App Manager (SAM) is a new feature of SIMPL-DOS, where you can use external SIMPL-DOS apps, made by the SD team, or other SIMPL-DOS users.
echo.
echo SAM looks in a folder called SIMPL-apps in your user directory for the SIMPL-DOS applications. This folder will be created the first time you run SAM.
echo.
echo To use SAM, put your apps in the mentioned folder, run SAM, and select the app you wish to run, and your app will start!
echo.
echo SIMPL-DOS apps can be in any Windows executable file format, including .bat, .exe, and .cmd. Other than that, the sky is the limit for apps and SAM!
echo                                                                  -Fire219
goto SAMstart

:SAMopen
set SAMo=
echo.
echo Select the app you wish to run.
set /p SAMo=
if "%SAMo%"=="SAMHLP" goto SAMhlp
if "%SAMo%"=="EXIT" goto newcom
cd "%userprofile%\SIMPL-apps\"
start %SAMo%
cd "%realdir%"
goto SAMstart


 
