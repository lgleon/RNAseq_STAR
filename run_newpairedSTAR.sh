#!bin/bash


#############################################################################
##############################################################################
# PAIRED-END part
##############################################################################
##############################################################################


##where are the data that we are analyzing, this part is hard code need to be change each time
prj=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/fastq_normals/trimmNormals

##loop to interact over all the fastq files in the folder
##check the nale-tail of the files and adapt if need it
for i in ${prj}/*R1*.f*q 

do 
    #name=$(basename ${i} _R1_001.fastq.gz) 
    name=$(basename ${i/%_R1_001_val_1.f*q})
    
	echo ${name}
    echo ${name}_R1_001_val_1.fq
	echo ${name}_R2_001_val_2.fq
	echo ${prj}/${name}_R1_001_val_1.fq
	echo ${prj}/output/
	echo ${prj}/output/${name}


    /home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
    --runMode alignReads \
    --genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
    --runThreadN 16 \
    --sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
    --readFilesIn  ${prj}/${name}_R1_001_val_1.fq ${prj}/${name}_R2_001_val_2.fq \
    --outSAMtype BAM SortedByCoordinate \
    --outFileNamePrefix ${prj}/output/${name} \
    --outFilterMismatchNmax 10 \
    --outFilterIntronMotifs None \
    --chimSegmentMin 1 \
    --sjdbScore 2 \
    --quantMode GeneCounts \
    #--readFilesCommand zcat


done
