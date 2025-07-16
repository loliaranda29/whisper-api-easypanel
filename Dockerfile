# Usa una imagen oficial ligera de Python
FROM python:3.10-slim

# Instala ffmpeg (si lo necesitás), y limpia caches para reducir tamaño
RUN apt-get update \
    && apt-get install -y ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Establece el directorio de trabajo
WORKDIR /app

# Copia requisitos e instala dependencias
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copia el resto de la aplicación
COPY . .

# Expone el puerto donde corre tu app
EXPOSE 8000

# Arranca la app directamente con python
CMD ["python", "app.py"]


