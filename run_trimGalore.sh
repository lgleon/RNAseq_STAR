#!bin/bash



#############################################################################
##############################################################################
# SINGLE-END part
##############################################################################
##############################################################################

#careful with fastq.gz OR fq.gz   can give problems!

#Hardcode fastq folder change when need it
    #prj=/DATA/share/pipelines/lgleon/C5_RNAseq_FFPE/fastq_files
    prj=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/test-code   #testing porpouses only

for i in ${prj}/*R1*.f*q.gz 

do 
    name=$(basename ${i} _R1_001.fastq.gz)

	echo ${name}
	echo ${name}_R1_001.fastq.gz
#	echo ${name}_R2_001.fastq.gz
	echo ${prj}/trimmed/


#    /home/l.gonzalez/programs/TrimGalore-0.6.5/trim_galore -q 35 -o ${prj}/trimmed/ ${name}_R1_001.fastq.gz
   /home/l.gonzalez/programs/TrimGalore-0.6.5/trim_galore -q 35 -o ${prj}/trimmed/ ${prj}/${name}_R1_001.fastq.gz #>logtrim.txt &
 


done

#Aleternative 

# /home/l.gonzalez/programs/TrimGalore-0.6.5/trim_galore -q 35 -o ${prj}/trimmed/ ${prj}/${name}_R1_001.fastq.gz >logtrim.txt &



#############################################################################
##############################################################################
# PAIRED-END part
##############################################################################
##############################################################################
#to work with this part remove the # in the single ones, doubles are explanations

##careful with fastq.gz OR fq.gz   can give problems!

##Hardcode fastq folder change when need it
#    prj=/DATA/share/pipelines/lgleon/C5_RNAseq_FFPE/fastq_files/

#for i in ${prj}/*R1*.f*q.gz 

#do 
#    name=$(basename ${i} _R1_001.fastq.gz)

#	echo ${name}
#	echo ${name}_R1_001.fastq.gz
#	echo ${name}_R2_001.fastq.gz
#	echo ${prj}trimmed/


#    /home/l.gonzalez/programs/TrimGalore-0.6.5/trim_galore -q 35 --paired -o ${prj}trimmed/ ${name}_R1_001.fastq.gz #${name}_R2_001.fastq.gz
    


#done
