#!/bin/bash

# Directorio donde se guardarán los resultados
result_dir="results"

# Verifica si se proporcionan los argumentos necesarios
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <diccionario> <hash> <nombre_csv>"
    exit 1
fi

diccionario=$1
hash=$2
nombre_csv=$3
output_file="${result_dir}/${nombre_csv}_tiempos_mpi.csv"

# Crea el directorio de resultados si no existe
mkdir -p "$result_dir"

# Recorre diferentes números de núcleos
for num_cores in 1 2 4 6 8; do
    # Ejecutar el comando con time y capturar el tiempo real
    real_time=$( { time -p mpirun -np $num_cores ./out/cracker-mpi "$diccionario" "$hash"; } 2>&1 | awk '/^real/ {print $2}' )

    # Reemplaza la coma por un punto para el tiempo
    real_time=$(echo "$real_time" | tr ',' '.')

    # Guardar el tiempo en el archivo CSV
    echo "$num_cores,$real_time" >> "$output_file"
done

echo "Los tiempos de ejecución se han guardado en $output_file"

