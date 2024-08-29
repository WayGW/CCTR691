#!/bin/bash

######################################################
#  Set the date format as a variable
DATE=$(date +%Y%m%d-%H%M%S)
#  "#" followed by a "SBATCH" == Slurm parameter...
#  execute script in current directory

#SBATCH --chdir=./
#  want any .e/.o stuff to show up here too
#SBATCH -e ./%x.e%j_$DATE
#SBATCH -o ./%x.o%j_$DATE
#SBATCH -J challenge1_count_bcm_files

#  run job in this queue/partition:
#SBATCH -p cpu

#  request memory be available: NOTE value MUST end in M, G, or T!
#SBATCH --mem=50M
#  request CPUs for task
#SBATCH --cpus-per-task 1
#  run for 1/2 minute
#SBATCH -t 0:30

######################################################

#  Count the number of files with "BCM_15034" in the name
count_underscore=$(ls ./data | grep -c "BCM_15034")

#  Count the number of files with "BCM-15034" in the name
count_dash=$(ls ./data | grep -c "BCM-15034")

#  Calculate the sum of both counts
total_count=$((count_underscore + count_dash))

#  Write the results to the Challenge1.txt file
echo "Number of BCM_15034 files: $count_underscore" > Challenge1.txt
echo "Number of BCM-15034 files: $count_dash" >> Challenge1.txt
echo "Total count: $total_count" >> Challenge1.txt



#  Finish with a confirmation message

echo "File count has been written to Challenge1.txt"

