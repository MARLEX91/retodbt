# Usa una imagen base con Python
FROM python:3.10

# Instala dbt y DuckDB
RUN pip install --no-cache-dir dbt-core==1.9.3 dbt-duckdb==1.9.2 duckdb 

# Configura el directorio de trabajo
WORKDIR /app

# Copia el código del proyecto
COPY . .

# Comando por defecto al iniciar el contenedor
ENTRYPOINT ["dbt"]
