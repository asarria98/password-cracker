#!/bin/bash

# Verifica si se proporcionan los argumentos necesarios
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <diccionario> <hash>"
    exit 1
fi

diccionario=$1
hash=$2
output_file="tiempos_mpi.csv"

# Verifica si el archivo CSV ya existe
if [ ! -e "$output_file" ]; then
    # Si no existe, crea el encabezado
    echo "nucleos,tiempo" > "$output_file"
fi

# Recorre diferentes números de núcleos
for num_cores in 1 2 4 6; do
    # Ejecutar el comando con time y capturar el tiempo real
    real_time=$( { time -p mpirun -quiet -np $num_cores ./out/cracker-mpi "$diccionario" "$hash"; } 2>&1 | awk '/^real/ {print $2}' )

    # Guardar el tiempo en el archivo CSV
    echo "$num_cores,$real_time" >> "$output_file"
done

echo "Los tiempos de ejecución se han guardado en $output_file"
