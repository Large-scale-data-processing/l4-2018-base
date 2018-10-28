#!/bin/bash
#PBS -l walltime=00:15:00
#PBS -l select=2:ncpus=1:mem=2048MB
#PBS -q main
#PBS -N "spark_example"

module load spark

# Optionally create tunels to see spark ui
# ssh -fN -R 4040:localhost:4040 <user>@<host>
# ssh -fN -R 8080:localhost:8080 <user>@<host>


#Deploy spark using pbs, redirect output to log file (be aware that on ui logs can apear with some lag because of synchronization)
pbs-spark-submit -C ~/spark_pbs/conf --class ml.lsdp.example.Demo ~/spark_pbs/spark-example-assembly-0.0.1.jar &> ~/spark_pbs/example.log
