FROM python:3.10-slim

# Instala ffmpeg, requerido por Whisper
RUN apt-get update && apt-get install -y ffmpeg

# Crea el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Instala dependencias de Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expone el puerto usado por Flask
EXPOSE 8000

# Inicia la app
CMD ["python", "app.py"]
