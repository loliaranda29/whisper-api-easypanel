FROM python:3.10-slim

# Instalar ffmpeg (requerido por whisper)
RUN apt-get update && apt-get install -y ffmpeg

# Crear carpeta de trabajo
WORKDIR /app

# Copiar archivos
COPY . .

# Instalar dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

# Exponer puerto
EXPOSE 8000

# Comando de inicio
CMD ["python", "app.py"]
