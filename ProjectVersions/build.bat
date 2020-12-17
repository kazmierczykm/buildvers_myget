@echo Off
set config=%1
if "%config%" == "" (
   set config=Release
)

set version-Version %PackageVersion%


