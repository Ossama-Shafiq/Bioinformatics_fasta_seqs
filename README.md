# README

These scripts have been created and tested in a linux enviroment with both **ncbi-blast+** and **MUSCLE** bioinformatics based tools installed.

The fundamental goal of these scripts is to pre-process raw protein sequences pasted into a text file with filenames such as seq_1.txt, seq_2.txt etc and convert them into fasta format to then be searched against protein databases to see similar sequences or infact identify what organism the sequences may belong to. After this an alignment is performed on the given sequences to assess for similarity and homology.

**MUSCLE** must be installed for sequence alignment tools: **conda install -c bioconda muscle**

To install **blast** for the command line (working directory recommended to be within home): **sudo apt-get install ncbi-blast+**


