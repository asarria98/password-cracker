#!/bin/bash

# Verifica si se proporcionan los argumentos necesarios
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <diccionario> <hash>"
    exit 1
fi

# Asigna los argumentos a variables
diccionario=$1
hash=$2

# Nombre del archivo CSV
csv_file="tiempos_openmp.csv"

# Encabezado del archivo CSV (añadiendo al archivo si ya existe)
echo "Num_nucleos,Tiempo_ejecucion" >> "$csv_file"

# Iterar sobre el número de hilos
for num_threads in 1 2 4 6; do
    # Establecer el número de hilos
    export OMP_NUM_THREADS=$num_threads
    
    # Ejecutar el programa y medir el tiempo de ejecución
    tiempo_ejecucion=$( /usr/bin/time -f "%e" ./out/cracker-openmp "$diccionario" "$hash" 2>&1 >/dev/null)
    
    # Agregar el tiempo de ejecución al archivo CSV
    echo "$num_threads,$tiempo_ejecucion" >> "$csv_file"
done

echo "Los tiempos de ejecución se han añadido al archivo $csv_file"
