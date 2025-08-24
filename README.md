# NeoVim

Paquetes de lenguages https://github.com/mason-org/mason-registry/tree/main/packages en lua/base/configs/mason.lua

## Linux

Borrar la configuración existente de neovim:

```
rm -rf ~/.config/nvim
```

Copia .config/nvim y ejecuta `:MasonInstallAll`

## Windows

Borrar la configuración existente de neovim:

```
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

### Requisitos importantes

- Instalar https://sourceforge.net/projects/mingw/

  En el instalador selecciona gcc-base y añadir el PATH

  "Presiona Win + R, escribe sysdm.cpl → pestaña Opciones avanzadas → Variables de entorno → busca Path → Editar → Nuevo → pega la ruta"

- Instalar pyenv-win mediante

```
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"

pyenv install 3.13.5

pyenv global 3.13.5
```

### Instalación configuraciones y ejecución nvim

```
git clone https://github.com/FStanDev/myNvChadConfig.git $ENV:USERPROFILE\AppData\Local\nvim; if ($?) { nvim }
```

Iniciado desde plantilla en blanco de lazyvim.
