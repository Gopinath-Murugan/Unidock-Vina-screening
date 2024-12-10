#!/bin/bash

# Display a header message about the script
cat << "EOF"
            ########################################################################## 
            ##                                                                      ##
            ##     Virtual Screening Script using Unidock (Autodock Vina-GPU)       ##
            ##                   Written by Gopinath Murugan                        ##
            ##       CAS in Crystallography and Biophysics, University of Madras    ##
            ##                   Email: murugangopinath12@gmail.com                 ##
            ##                                                                      ##
	    ##									    ##  
            ########################################################################## 
EOF

# Directory containing the ligands
ligand_dir="./ligands"

# Directory to store the results
results_dir="results"

# Create the results directory if it doesn't exist
mkdir -p "$results_dir"

# Loop over each ligand file in the ligand directory
for ligand in "$ligand_dir"/*; do
    # Get the ligand filename without the path and extension
    ligand_name=$(basename "$ligand")
    ligand_base="${ligand_name%.*}"
    
    # Run the unidock command for the current ligand and redirect output
    unidock --receptor receptor.pdbqt --search_mode balance --scoring vina \
            --num_modes 9 --config config.txt --gpu_batch "$ligand" --dir "$results_dir" \
            --verbosity 1 > "$results_dir/${ligand_base}.txt"

    echo "Completed processing for $ligand_name"

done

echo "All ligands have been screened against the receptor."

