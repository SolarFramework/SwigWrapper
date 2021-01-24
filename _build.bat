@ECHO OFF
CLS

SETLOCAL ENABLEDELAYEDEXPANSION

SET COMPILER=win-cl-14.1
SET LANG=csharp

GOTO :SWIG

:NOVICE
ECHO Call BuildCSharp bat file from SolARPipelineManager folder
PUSHD ..\..\SolARPipelineManager\
CALL BuildCSharp.bat
POPD

:SWIG
ECHO ----------------------- SWIG wrapping -----------------------

SET SOLAR_VERSION=0.9.0
SET XPCF_VERSION=2.5.0
SET OUT=src

IF NOT EXIST "%OUT%" MKDIR "%OUT%"
DEL /s /q "%OUT%\*.*" > NUL

SET OPTIONS=^
 -c++ ^
 -%LANG% ^
 -small -O ^
 -I"../../SolARPipelineManager/swig" ^
 -I"../../SolARPipelineManager/swig/include" ^
 -I"./swig" ^
 -I"%REMAKEN_PKG_ROOT%/packages/%COMPILER%/xpcf/%XPCF_VERSION%/interfaces" ^
 -I"%REMAKEN_PKG_ROOT%/packages/SolARBuild/%COMPILER%/SolARFramework/%SOLAR_VERSION%/interfaces" ^
 -DXPCF_USE_BOOST ^
 -DSWIG_CSHARP_NO_WSTRING_HELPER ^
 -dllimport SolARWrapper ^
 

FOR %%F IN (swig/*.i) DO (
ECHO ##########
ECHO # %%F
SET F=%%~nF
SET OUTDIR=%LANG%\!F:_=\!
IF NOT EXIST "!OUTDIR!" MKDIR "!OUTDIR!"
DEL /Q "!OUTDIR!\*.*"
CALL SWIG ^
 %OPTIONS% ^
 -namespace !F:_=.! ^
 -outdir "!OUTDIR!" ^
 -o "%OUT%/!F!_wrap.cxx" ^
 "swig/%%F"
)

ECHO ----------------------- SWIG completed -----------------------

:ANDROID

:: MonoPInvokeCallback should be added to static method generated by SWIG while using IL2CPP
ECHO ----------------------- Patch for Android support -----------------------
PUSHD %LANG%
POWERSHELL -command "Get-ChildItem -Path .\ -Filter *PINVOKE.cs -Recurse -File -Name | ForEach-Object {echo """# $_""";[System.IO.File]::WriteAllText($_,([System.IO.File]::ReadAllText($_) -replace 'static void SetPending','[AOT.MonoPInvokeCallback(typeof(ExceptionDelegate))] static  void  SetPending' -replace 'static string CreateString','[AOT.MonoPInvokeCallback(typeof(SWIGStringDelegate))] static string  CreateString'))}"
POPD

ECHO ----------------------- Patch completed -----------------------

:DEPLOY

ECHO ----------------------- Copy to REMAKEN_PKG_ROOT -----------------------

SET SOLAR_WRAPPER_VERSION=0.9.0
SET OUT=%REMAKEN_PKG_ROOT%/packages/SolARBuild/%COMPILER%/SolARWrapper/%SOLAR_WRAPPER_VERSION%/%LANG%

IF EXIST "%OUT%" RMDIR "%OUT%" /S /Q
XCOPY /S /R /I /Q /Y "%LANG%" "%OUT%"

ECHO ----------------------- Copy completed -----------------------

IF NOT errorlevel 0 PAUSE
