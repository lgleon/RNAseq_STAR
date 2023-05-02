#!bin/bash


# Working directory is hard coded, careful 
# ENVIRONMENT
    prj=/DATA/share/pipelines/lgleon/C5_RNAseq_FFPE/fastq_files/

#We do not need an extra parameter since is single-end reads

#Command

for file in ${prj}/*.f*q.gz
do   
   inputfqgz=$file
   filenamestem=${file/%.f*q.gz/}
   echo "!!!!!!!!!!!!!! Expected final output {$filenamestem.coordinate-bam}"

    /home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
    --runMode alignReads \
    --genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
    --runThreadN 16 \
    --sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
    --readFilesIn  $inputfqgz \
    --outSAMtype BAM SortedByCoordinate \name
    --outFileNamePrefix $filenamestem \
    --outFilterMismatchNmax 10 \
    --outFilterIntronMotifs None \
    --chimSegmentMin 1 \
    --sjdbScore 2 \
    --quantMode GeneCounts \
    --readFilesCommand zcat

done




#############################################################################

# This part I was tesing using also the testnames script to adjust for single or paired end 
#Now is working the final script for STAR single OR paired is in
# run_STAR_singleORpaired.sh

##############################################################################

#prj=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/test-code

#for i in ${prj}/*R1*.fastq.gz 

#do 
#    name=$(basename ${i} _R1_001.fastq.gz) 

#	echo ${name}
#	echo ${name}_R1_001.fastq.gz
#	echo ${name}_R2_001.fastq.gz
#	echo ${prj}/output/


#/home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
#--runMode alignReads \
#--genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
#--runThreadN 16 \
#--sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
#--readFilesIn ${name}_R1_001.fastq.gz ${name}_R2_001.fastq.gz \
#--outSAMtype BAM SortedByCoordinate \
#--outFileNamePrefix /path_to/${name} \
#--outFilterMismatchNmax 10 \
#--outFilterIntronMotifs None \
#--chimSegmentMin 1 \
#--sjdbScore 2 \
#--readFilesCommand zcat'


#done




#find  /DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/trimmed/  -name "*_R1_001_val_1.fq.gz" | cut -d "_" -f1
#for i in $(ls *.f*q.gz | rev | cut -c 14- | rev | uniq)
