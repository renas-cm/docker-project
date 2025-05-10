# Etapa 1: Build
FROM node:lts-alpine AS build-stage

WORKDIR /app

# Copiar apenas os arquivos necessários para instalar dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante dos arquivos e construir o projeto
COPY . .
RUN npm run build


#Etapa 2: Usar uma imagem leve do Nginx para servir os arquivos
FROM nginx:stable-alpine as production-stage

# Copiar os arquivos construídos para o diretório padrão do Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copiar o arquivo de configuração do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expor a porta 80 para acesso externo
EXPOSE 80

# Iniciar o Nginx em primeiro plano
CMD ["nginx", "-g", "daemon off;"]