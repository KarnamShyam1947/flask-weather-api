FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gunicorn

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_PORT=5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
