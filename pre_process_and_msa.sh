#!/usr/bin/bash

# Here automatically retreive a database in this case the pdbaa database for use in the blast command
mkdir DB/
wget http://evomics.org/wp-content/uploads/2013/01/blastplus.zip -P ./DB/
unzip DB/blastplus.zip -d ./DB/





for file in ./*.txt;do 
	
	# remove extension from file name to keep prefix
	file_prefix=$(basename $file '.txt')
	
	
	# break long string into multiline with fixed character length for each line
	cat $file | fold -w 60 > ${file%.*}.fasta
	
        # blast the fasta sequences provied against swiss-prot database and pre process this output to fetch the name of the protein  
	protein_name=$(blastp -query $file_prefix.fasta -db ./DB/blastplus/db/pdbaa -outfmt '6 std stitle' -max_target_seqs 3 | cut -f 13 | head -n1)
	
        echo $protein_name

	# append protein name above and also file name along side fasta > character to the beginning of the file to finalise fasta format  
        sed -i "1s~^~> $file_prefix $protein_name\n~" ${file%.*}.fasta	
	
done

#Combine both fasta files
cat *.fasta > combined_sequences.fasta
# Using muscle we can output 2 alignments one default and one with clustalw format
muscle -in combined_sequences.fasta -out normal_aligned.aln
muscle -in combined_sequences.fasta -out clustal_aligned.aln -clw

