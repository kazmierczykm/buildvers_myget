@echo Off
set config=%1
if "%config%" == "" (
   set config=Debug
)

set version=
if not "%PackageVersion%" == "" (
   set version=-Version %PackageVersion%
)

REM Detect MSBuild 15.0 path
if exist "%programfiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\15.0\Bin\MSBuild.exe" (
    set msbuild="%programfiles(x86)%\Microsoft Visual Studio\2019\Community\MSBuild\15.0\Bin\MSBuild.exe"
REM %msbuild%
)
if exist "%programfiles(x86)%\Microsoft Visual Studio\2019\Professional\MSBuild\15.0\Bin\MSBuild.exe" (
    set msbuild="%programfiles(x86)%\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\MSBuild.exe"
REM %msbuild%
)
if exist "%programfiles(x86)%\Microsoft Visual Studio\2019\Enterprise\MSBuild\15.0\Bin\MSBuild.exe" (
    set msbuild="%programfiles(x86)%\Microsoft Visual Studio\2019\Enterprise\MSBuild\15.0\Bin\MSBuild.exe"
REM %msbuild%
)

REM (optional) build.bat is in the root of our repo, cd to the correct folder where sources/projects are

REM Package
mkdir Build
call %nuget% pack "ProjectVersions\ProjectVersions.csproj" -symbols -o Build -p Configuration=%config% %version%



