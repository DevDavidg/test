#!/bin/bash

# Script para verificar y agregar los assets a Git

echo "Verificando si los assets están en Git..."

# Verificar si hay assets sin seguimiento
git ls-files --others --exclude-standard | grep -i assets

if [ $? -eq 0 ]; then
  echo "Se encontraron archivos de assets que no están en Git. Agregándolos..."
  git add assets/
  echo "Assets agregados. Por favor haz commit y push de estos cambios."
else
  # Verificar si los assets están en el repositorio pero no en el último commit
  git ls-tree -r HEAD | grep -i assets
  
  if [ $? -ne 0 ]; then
    echo "No se encontraron assets en el último commit."
    echo "Agregando manualmente todos los assets..."
    
    # Forzar la adición de assets
    git add -f assets/
    
    echo "Assets agregados. Por favor haz commit y push de estos cambios:"
    echo "git commit -m \"Agregar carpeta assets\""
    echo "git push origin master"
  else
    echo "Los assets ya están en Git. Verificando si están correctamente en el último commit..."
    git show --name-only | grep -i assets
    
    if [ $? -ne 0 ]; then
      echo "Los assets no están en el último commit. Verifica tus cambios recientes."
    else
      echo "Los assets están correctamente en el último commit."
    fi
  fi
fi

# Listar los archivos en la carpeta assets para verificación
echo "Contenido de la carpeta assets:"
find assets -type f | sort

echo "Script completado." 