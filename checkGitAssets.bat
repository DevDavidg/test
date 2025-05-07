@echo off
ECHO Verificando si los assets están en Git...

REM Verifica si la carpeta assets existe
IF NOT EXIST assets (
  ECHO La carpeta assets no existe en el directorio actual!
  EXIT /B 1
)

REM Verificar archivos específicos
ECHO Verificando archivos específicos...

ECHO Verificando assets/downloads:
IF EXIST assets\downloads\comic_batman.pdf (ECHO ✓ comic_batman.pdf existe) ELSE (ECHO ✕ comic_batman.pdf NO existe)
IF EXIST assets\downloads\comic_batman.pptx (ECHO ✓ comic_batman.pptx existe) ELSE (ECHO ✕ comic_batman.pptx NO existe)

ECHO Verificando assets/images:
IF EXIST assets\images\icons\logo.png (ECHO ✓ logo.png existe) ELSE (ECHO ✕ logo.png NO existe)
IF EXIST assets\images\background.png (ECHO ✓ background.png existe) ELSE (ECHO ✕ background.png NO existe)
IF EXIST assets\images\banner.jpg (ECHO ✓ banner.jpg existe) ELSE (ECHO ✕ banner.jpg NO existe)
IF EXIST assets\images\banner2.png (ECHO ✓ banner2.png existe) ELSE (ECHO ✕ banner2.png NO existe)
IF EXIST assets\images\banner3.jpg (ECHO ✓ banner3.jpg existe) ELSE (ECHO ✕ banner3.jpg NO existe)
IF EXIST assets\images\images.jpg (ECHO ✓ images.jpg existe) ELSE (ECHO ✕ images.jpg NO existe)
IF EXIST assets\images\tesla-sprites.svg (ECHO ✓ tesla-sprites.svg existe) ELSE (ECHO ✕ tesla-sprites.svg NO existe)

REM Listar contenido de la carpeta assets
ECHO Contenido de la carpeta assets:
DIR assets /S /B

REM Agregar la carpeta assets a Git
ECHO Agregando la carpeta assets a Git...
git add -f assets/

ECHO.
ECHO Por favor ejecuta estos comandos manualmente:
ECHO git commit -m "Agregar carpeta assets con todos los archivos"
ECHO git push origin master

ECHO.
ECHO Después del push, ejecuta la acción de GitHub:
ECHO 1. Ve a tu repositorio en GitHub
ECHO 2. Haz clic en "Actions"
ECHO 3. Selecciona el workflow "Deploy Website"
ECHO 4. Haz clic en "Run workflow" y selecciona la rama master

ECHO.
ECHO Script completado. 