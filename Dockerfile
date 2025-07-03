FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto
# --no-cache-dir: Não armazena o cache de pacotes, mantendo a imagem menor
# -r requirements.txt: Instala os pacotes listados no arquivo
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que o Uvicorn será executado
EXPOSE 8000

# Comando para iniciar a aplicação usando Uvicorn
# --host 0.0.0.0: Permite que o servidor seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

