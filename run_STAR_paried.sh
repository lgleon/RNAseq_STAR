#!bin/bash


# Working directory is hard coded, careful 
# ENVIRONMENT
prj=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/
outp=/DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/bam_start_test/

# Make arrays named fq1 and fq2
fq1=(${prj}/trimmed/*_R1_001_val_1.f*q.gz)
fq2=(${prj}/trimmed/*_R2_001_val_2.f*q.gz)

#Command
for ((i=0;i<"${#fq1[@]}";i++)); do
  sample="${fq1[$i]%%_R*}"
  outprefix=${outp}/"${sample}"

/home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
--runMode alignReads \
--genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
--runThreadN 16 \
--sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
--readFilesIn  "${fq1[$i]}" "${fq2[$i]}" \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix $outprefix \
--outFilterMismatchNmax 10 \
--outFilterIntronMotifs None \
--chimSegmentMin 1 \
--sjdbScore 2 \
--quantMode GeneCounts \
--readFilesCommand zcat

done




#############################################################################

# This part ar previos test but they were not working

##############################################################################

#ls | grep '_R1_001_val_1\.fq\.gz$' | sed 's:_R1_001_val_1\.fq\.gz$::' | xargs -n1 -P16 -I {} bash -c '
#/home/l.gonzalez/programs/STAR-2.7.5c/bin/Linux_x86_64_static/STAR \
#--runMode alignReads \
#--genomeDir /DATA/share/pipelines/lgleon/References/Ensembl/newSTAR_idx/ \
#--runThreadN 16 \
#--sjdbGTFfile /DATA/share/pipelines/lgleon/References/Ensembl/STAR_Ref/Homo_sapiens.GRCh38.99.gtf \
#--readFilesIn /DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/trimmed/{}_R1_001_val_1.fq.gz /DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/trimmed/{}_R2_001_val_2.fq.gz \
#--outSAMtype BAM SortedByCoordinate \
#--outFileNamePrefix /DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/bam_star/{}_ \
#--outFilterMismatchNmax 10 \
#--outFilterIntronMotifs None \
#--chimSegmentMin 1 \
#--sjdbScore 2 \
#--readFilesCommand zcat'


#find  /DATA/share/pipelines/lgleon/organoids_rawdata/RNAseq/trimmed/  -name "*_R1_001_val_1.fq.gz" | cut -d "_" -f1
#for i in $(ls *.f*q.gz | rev | cut -c 14- | rev | uniq)
