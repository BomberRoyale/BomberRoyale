FROM node:18

# Define o diretório de trabalho dentro do container
WORKDIR /BomberRoyale

# Copia os arquivos do projeto
COPY . .

# Instala as dependências
RUN rm -rf node_modules
RUN npm install

# Compila o TypeScript
RUN npm run build

# Expõe a porta da API
EXPOSE 3000

# Inicia a aplicação compilada
CMD ["npm", "start"]

#Como era antes
#WORKDIR /BomberRoyale

#COPY . .

#RUN rm -rf node_modules
#RUN npm install

#CMD ["npm", "start"]

#EXPOSE 3000