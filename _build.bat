@echo off
cls
SET CURRENTDIR=%cd%
echo Apply BuildCSharp bat file in SolARPipelineManager folder

cd ..\..\SolARPipelineManager\
call BuildCSharp.bat
cd %CURRENTDIR%

setlocal ENABLEDELAYEDEXPANSION

SET LANG=csharp
SET COMPILER=win-cl-14.1
SET SOLAR_WRAPPER_VERSION=0.8.1
SET SOLAR_VERSION=0.8.1
SET XPCF_VERSION=2.3.4
SET OUT=%REMAKEN_PKG_ROOT%\packages\SolARBuild\%COMPILER%\SolARWrapper\%SOLAR_WRAPPER_VERSION%\%LANG%

SET OPTIONS=^
 -c++ ^
 -%LANG% ^
 -small -O ^
 -outcurrentdir ^
 -I./Swig ^
 -I./Swig/include ^
 -I%REMAKEN_PKG_ROOT%/packages/%COMPILER%/xpcf/%XPCF_VERSION%/interfaces ^
 -I%REMAKEN_PKG_ROOT%/packages/SolARBuild/%COMPILER%/SolARFramework/%SOLAR_VERSION%/interfaces ^
 -DXPCF_USE_BOOST ^
 -dllimport SolARWrapper ^
 

FOR %%F IN (Swig\*.i) DO (
ECHO ##########
ECHO # %%F
SET F=%%~nF
SET OUTPUT=%OUT%\!F:_=\!
IF NOT EXIST "!OUTPUT!" MKDIR "!OUTPUT!"
DEL /Q "!OUTPUT!\*.*"
CALL SWIG ^
 %OPTIONS% ^
 -namespace !F:_=.! ^
 -outdir "!OUTPUT!" ^
 %%F
)

GOTO :END

:END
echo ----------------------- completed ----------------------------
