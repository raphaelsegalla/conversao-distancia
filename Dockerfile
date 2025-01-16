# imagem que vai ser usada no container
FROM python:3.13.0
# cria o diretorio de trabalho e entra nele
WORKDIR /app
# copia arquivos da maquina local para dentro do container (dentro da pasta /app) 
COPY requirements.txt .
# executa o comando pip para instalar as dependencias
RUN pip install -r requirements.txt
# copia todos os aquivo da pasta local raiz para a raiz do container
COPY . .
# expoem a porta 5000
EXPOSE 5000
# comando de inicialização do projeto que é executado depois do container criado
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]