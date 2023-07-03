# Altyapi
FROM python:3.12.0b3-alpine3.18

# Calisma Alani
WORKDIR /app

# Move docs & Files
# COPY app.py /app
COPY . .
CMD python app.py


