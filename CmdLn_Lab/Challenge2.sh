#!/bin/bash
######################################################
#  Set the date format as a variable
DATE=$(date +%Y%m%d-%H%M%S)

#  SLURM parameters to execute the job
#SBATCH --chdir=./
#SBATCH -e ./%x.e%j_$DATE
#SBATCH -o ./%x.o%j_$DATE
#SBATCH -J challenge2_process_files
#SBATCH -p cpu
#SBATCH --mem=50M
#SBATCH --cpus-per-task 1
#SBATCH -t 0:30

######################################################



# Create a file listing all R1 BCM 15034 files (both _ and -)
ls ./data/*BCM_15034*R1* ./data/*BCM-15034*R1* > vert_R1.txt

# Create a file listing all R2 BCM 15034 files (both _ and -)
ls ./data/*BCM_15034*R2* ./data/*BCM-15034*R2* > vert_R2.txt


# Combine R1 and R2 lists into a single vertically aligned file
cat vert_R1.txt vert_R2.txt > vert.txt


# Combine R1 and R2 lists side by side in a horizontally aligned file
paste vert_R1.txt vert_R2.txt > horiz.txt


# Clean up intermediate files
rm vert_R1.txt vert_R2.txt

# Write the final output to Challenge2.txt
echo "Vertically aligned file (R1 followed by R2):" > Challenge2.txt
cat vert.txt >> Challenge2.txt
echo -e "\nHorizontally aligned file (R1 beside R2):" >> Challenge2.txt
cat horiz.txt >> Challenge2.txt


echo "Files processed and output written to Challenge2.txt"

