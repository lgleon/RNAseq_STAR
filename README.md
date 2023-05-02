# RNAseq WorkFlow with STAR
## for Frozen or FFPE samples
## Leticia G Leon

### Introduction

This is a workFlow to make a RNAseq analysis from frozen samples or FFPE samples (exome capture).
The main steps are the trimming, mapping and the count annotation using bash scripts in the notebook. 
In this workflow we put together several steps using a Jupyter Notebook, starting from a fastqc checking then, trimming and STAR alignment, prepare the annotated expression counts.
During the pipeline we use GRCh38 genome build as Ref for STAR and featureCounts. This notebook can be use, with modification, for single-end reads or paired-end reads.

The notebook of the RNAseq (pre-processing) include few steps: 

- QC checking using fastqc
- trimming using trim-galore
- Mapping using STAR
- Bam to counts expressionm usign featureCounts (Rsubread)
- QC of the preproces using multiqc, optional


The following steps are NOT include in this Notebook
From there we can use the output counts file for: 

Check the post-processing part 

### Installation
New version is from 2021
Go to https://github.com/NKI-TGO/RNAseqFlow_notebook and click the button "Clone or Download" --> Download zip.
Unzip the zip file in your Home directory, 'My Documents' or where you are allowed to install programs.


### Usage

To run the pipeline you need to have installed Jupiter Notebook and be able to work in the Terminal if needed, or use and editor for the scripts.

The notebook, have several cells or chunks of code, in one you can see the script and the one below you can actually run the code which will run in the Terminal.
In this repo you have the notebook and the scripts that are needed to run the workflow. then you will be able to change teh paths to folders when needed.
This workflow consists of 3 main steps, that need to be run consecutively.

x. QC checking, cell at the beginning to run fastqc, before run the analysis
1. Trimming, removing the rest of the adaptor with trim-galore  
2. Alignment (mapping), STAR
3. Annotation of the expression counts, featureCounts
x. QC ckeck of the process, using multiQC we can check how was the entire process, optional

Those stepts are not interctive, yo need to take care of few features

- path to the hg38 reference, if you do not have any we recommend to use: [Homo_sapiens.GRCh38.dna.primary_assembly](https://www.ensembl.org/Homo_sapiens/Info/Index). For direct download, copy the next URL and put in your browser:
ftp://ftp.ensembl.org/pub/release-76/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz
- path to your working directory, where you want to save the outputs
- path to your fastq files, and bam files 


#### To Run those scripts: 

__Jupyter Notebook__

All steps can be run from the Notebook
All script are bash script that can be easily run form the Notebook, The notebook can be use also to change the paths and folder directories

#### Input files
QC, trimming and Alignment
You need fastq(fq).gz files

Bam to counts
You will need the bam files created in the previous step


#### How to run 

___Trimming__Alignment___
You need to open and edit the script and then run from the Notebook
In the script, you need to add the path to your folder/directory where your fastq files are store, in the bash script and click run in the notebook

___Bam to Counts ___

This is a direct command line run, so you can change directly in the Notebook cell what do you want, exons, gene_id or gene_name.


#### Output Files
___From the trimming and alignment, You will get:___
trimmed fastq.gz files and sorted bams


___From Bam to Counts, you will get:___

- Count matrix with samples as columns and genes (id, names, exons, transcripts) as rows
- Summary of the counts run

