# Docker Project

Este projeto utiliza Docker para construir e servir uma aplicação Node.js com arquivos estáticos, usando o Nginx como servidor web.

## Estrutura do Projeto

- **Etapa 1: Build**
  - Usa a imagem `node:lts-alpine` para instalar dependências e construir os arquivos estáticos.
- **Etapa 2: Produção**
  - Usa a imagem `nginx:stable-alpine` para servir os arquivos estáticos gerados.

## Pré-requisitos

Certifique-se de ter o Docker instalado em sua máquina. Você pode verificar a instalação com o comando:

```bash
docker --version
