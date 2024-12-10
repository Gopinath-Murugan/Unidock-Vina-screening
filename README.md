# Virtual Screening Script using Unidock (Autodock Vina-GPU)

This script automates virtual screening using the Unidock docking tool, leveraging GPU acceleration for fast computations.

## Prerequisites

To use this script, ensure the following:

1. **System Requirements**:
   - A system with a compatible GPU card.
   - CUDA must be installed and configured.
   - Examples of supported GPUs:
     - NVIDIA RTX 30 series (e.g., RTX 3060, RTX 3080)
     - NVIDIA RTX 20 series (e.g., RTX 2060, RTX 2080)
     - NVIDIA Tesla series (e.g., Tesla V100, Tesla A100)
   - Ensure the correct version of CUDA for your GPU driver.

2. **Unidock Installation**:
   - Install Unidock, which is optimized for GPU-based docking.
   - Follow the official Unidock installation guide for setup.

3. **Protein File**:
   - The receptor protein file should be named `receptor.pdbqt`.
   - Place the file in the same directory as the script.

4. **Ligands Folder**:
   - All ligand files should be placed in the `ligands` folder.
   - Ligands must be in `.pdbqt` format.

5. **Configuration File**:
   - The script uses a configuration file named `config.txt`.
   - Ensure the file includes the following parameters:
     ```plaintext
     center_x = -24.247
     center_y = 11.918
     center_z = 11.502
     size_x = 30
     size_y = 30
     size_z = 30
     ```
   - Note: The search box size should not exceed 30 units for `size_x`, `size_y`, and `size_z`.

6. **Usage**:

   1. Clone or download the script to your local system.
   2. Place the `receptor.pdbqt` file in the script's directory.
   3. Ensure all ligand files are in the `ligands` folder and are in `.pdbqt` format.
   4. Verify the `config.txt` file is properly configured as shown above.
   5. Run the screening script:
      ```bash
      bash unidock_vina_screen.sh
      ```
   6. The results will be saved in the `results` directory.

7. **Sorting and Selecting Top Ligands**:

   To sort the results and extract top ligands, use the sorting script:

   ```bash
   bash unidock_sort.sh
   ```

   - The script prompts the user to specify the number of top ligands to extract.
   - Results are saved in `sorted_results.csv` and `sorted_results.txt`.
   - Top ligands are copied to the `Top_ligands` directory.

## Output

- For each ligand, a result file with docking details will be created in the `results` folder.
- The script prints progress updates for each ligand processed.

## Additional Notes

- Ensure proper permissions for executing the script (`chmod +x script_name.sh`).
- GPU memory issues may arise if too many ligands are processed at once. Consider splitting the ligand files if needed.
- For optimal performance, ensure all dependencies are correctly installed and the GPU drivers are up to date.

## Citation

If you are using this script for your studies, kindly acknowledge the use of Open Babel as per its citation guidelines and mention my GitHub repository:

Yu, Yuejiang, et al. "Uni-Dock: GPU-accelerated docking enables ultralarge virtual screening." Journal of chemical theory and computation 19.11 (2023): 3336-3345. https://doi.org/10.1021/acs.jctc.2c01145

Trott, Oleg, and Arthur J. Olson. "AutoDock Vina: improving the speed and accuracy of docking with a new scoring function, efficient optimization, and multithreading." Journal of computational chemistry 31.2 (2010): 455-461. https://doi.org/10.1002/jcc.21334

For the latest version of this script and updates, visit my GitHub repository:
https://github.com/Gopinath-Murugan/Unidock-Vina-screening

Mentioning this repository in your publications or research would be greatly appreciated.

Happy docking and sorting!
