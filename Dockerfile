FROM python:3.13-alpine
WORKDIR /app
COPY . .
RUN pip install gunicorn && pip install -r requirements.txt
ENV PORT=80
CMD gunicorn --bind ":$PORT" --workers 1 --threads 8 main:app