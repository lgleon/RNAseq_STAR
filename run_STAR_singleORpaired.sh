#!bin/bash



#############################################################################
##############################################################################
# SINGLE-END part
##############################################################################
##############################################################################


#careful with fastq.gz OR fq.gz   can give problems!



#where are the data that we are analyzing, this part is hard code need to be change each time
prj=/DATA/share/pipelines/lgleon/C5_RNAseq_FFPE/trimmed

#loop to interact over all the fastq files in the folder, take one file
#check the nale-tail of the files and adapt if need it
for i in ${prj}/*R1*_trimmed.f*q.gz 

do 
    name=$(basename ${i} _R1_001.trimmed.fq.gz) 

	echo ${name}
	echo ${name}_R1_001_trimmed.fq.gz
#	echo ${name}_R2_001.fastq.gz
	echo ${prj}/output/


    /home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
    --runMode alignReads \
    --genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
    --runThreadN 16 \
    --sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
    --readFilesIn ${name} \
    --outSAMtype BAM SortedByCoordinate \
    --outFileNamePrefix ${prj}/output/${name} \
    --outFilterMismatchNmax 10 \
    --outFilterIntronMotifs None \
    --chimSegmentMin 1 \
    --sjdbScore 2 \
    --quantMode GeneCounts \
    --readFilesCommand zcat


done


#############################################################################
##############################################################################
# PAIRED-END part
##############################################################################
##############################################################################


##careful with fastq.gz OR fq.gz   can give problems!



##where are the data that we are analyzing, this part is hard code need to be change each time
#prj=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/test-code

##loop to interact over all the fastq files in the folder
##check the nale-tail of the files and adapt if need it
#for i in ${prj}/*R1*.fastq.gz 

#do 
#    name=$(basename ${i} _R1_001.fastq.gz) 

#	echo ${name}
#	echo ${name}_R1_001.fastq.gz
#	echo ${name}_R2_001.fastq.gz
#	echo ${prj}/output/
#	echo ${prj}/output/${name}


#    /home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
#    --runMode alignReads \
#    --genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
#    --runThreadN 16 \
#    --sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
#    --readFilesIn  ${name}_R1_001.fastq.gz ${name}_R2_001.fastq.gz \
#    --outSAMtype BAM SortedByCoordinate \
#    --outFileNamePrefix ${prj}/output/${name} \
#    --outFilterMismatchNmax 10 \
#    --outFilterIntronMotifs None \
#    --chimSegmentMin 1 \
#    --sjdbScore 2 \
#    --quantMode GeneCounts \
#    --readFilesCommand zcat


#done
