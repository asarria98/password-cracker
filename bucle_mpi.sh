#!/bin/bash

output_file="tiempos.csv"

# Recorre diferentes números de núcleos
#for num_cores in 1 2 4 6 8; do
for num_cores in 1 2 4 6; do
    # Ejecutar el comando con time y capturar el tiempo real
    real_time=$( { time -p mpirun -quiet -np $num_cores ./out/cracker-mpi abcdefghijklmnopqrstuvwxyz0123456789 7215d1384efb84579b4490f1fb9b4cbedb098956b54f3218f48ea28a9ebcaf67; } 2>&1 | awk '/^real/ {print $2}' )

    # Guardar el tiempo en el archivo CSV
    echo "Numero de núcleos: $num_cores, Time: $real_time" >> $output_file
done
