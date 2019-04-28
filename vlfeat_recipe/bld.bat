@echo OFF

rem Force l'utilisation de visual studio 2015
call "c:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

if %ARCH% EQU 32 (
   set VL_ARCH="win32"
rem   call "%VCINSTALLDIR%\vcvarsall.bat" x86
) else (
   set VL_ARCH="win64"
rem   call "%VCINSTALLDIR%\vcvarsall.bat" amd64
)
if errorlevel 1 exit /b 1

env

nmake /f local_Makefile.mak ARCH=%VL_ARCH%
if errorlevel 1 exit /b 1

copy "bin\%VL_ARCH%\sift.exe" "%LIBRARY_BIN%\sift.exe"
if errorlevel 1 exit /b 1
copy "bin\%VL_ARCH%\mser.exe" "%LIBRARY_BIN%\mser.exe"
if errorlevel 1 exit /b 1
copy "bin\%VL_ARCH%\aib.exe"  "%LIBRARY_BIN%\aib.exe"
if errorlevel 1 exit /b 1

copy "bin\%VL_ARCH%\vl.dll" "%LIBRARY_BIN%\vl.dll"
if errorlevel 1 exit /b 1
copy "bin\%VL_ARCH%\vl.exp" "%LIBRARY_BIN%\vl.exp"
if errorlevel 1 exit /b 1
copy "bin\%VL_ARCH%\vl.lib" "%LIBRARY_BIN%\vl.lib"
if errorlevel 1 exit /b 1

robocopy "vl" "%LIBRARY_INC%\vl" *.h /MIR

rem Matlab parts.
set dst_path=%PREFIX%\MATLAB\%PKG_NAME%
md %dst_path%
if errorlevel 1 exit /b 1
xcopy /E toolbox %dst_path%\toolbox\
if errorlevel 1 exit /b 1
xcopy /E apps %dst_path%\apps\
if errorlevel 1 exit /b 1
xcopy /E data %dst_path%\data\
if errorlevel 1 exit /b 1
xcopy /E docsrc %dst_path%\docsrc\
if errorlevel 1 exit /b 1

copy vlfeat_setup.m %PREFIX%\MATLAB
if errorlevel 1 exit /b 1

exit 0