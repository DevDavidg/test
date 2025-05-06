# GitHub Actions Workflows

Este proyecto utiliza GitHub Actions para automatizar tareas de validación y despliegue.

## Workflows disponibles

### 1. Deploy Website

- **Archivo**: `.github/workflows/deploy.yml`
- **Función**: Valida los archivos HTML y despliega el sitio web en GitHub Pages automáticamente cuando se hace un push a la rama master.
- **Pasos**:
  - Checkout del código
  - Configuración de Node.js
  - Instalación de dependencias
  - Validación de HTML
  - Despliegue a GitHub Pages (solo en push a master)

### 2. Lint CSS

- **Archivo**: `.github/workflows/lint.yml`
- **Función**: Realiza linting de archivos CSS para mantener estándares de calidad en el código.
- **Pasos**:
  - Checkout del código
  - Configuración de Node.js
  - Instalación de dependencias (stylelint)
  - Linting de CSS
  - Creación de configuración de stylelint si no existe

## Configuración

### Permisos de GitHub Actions

El workflow de despliegue incluye permisos específicos para que GitHub Actions pueda escribir en el repositorio:

```yaml
permissions:
  contents: write
  pages: write
  id-token: write
```

No se requiere configuración adicional para usar estos workflows. Se activan automáticamente cuando:

- Se hace push a la rama master
- Se crea un pull request hacia la rama master

## GitHub Pages

Para que el despliegue funcione correctamente:

1. Habilita GitHub Pages en la configuración del repositorio
   - Ve a Settings > Pages
   - Selecciona la rama `gh-pages` como origen

El sitio web se despliega automáticamente en la rama `gh-pages`. La URL de acceso será:
`https://<nombre-usuario>.github.io/<nombre-repositorio>/`
