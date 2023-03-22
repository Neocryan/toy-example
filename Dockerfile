FROM python:3.9

WORKDIR /app

COPY . .
RUN pip3 install streamlit bokeh==2.4.3 fastapi "uvicorn[standard]"


EXPOSE 8000
EXPOSE 8501

CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1", "--reload"]
CMD ["streamlit", "run", "main.py", "--server.port", "8501", "--server.enableCORS", "false"]
