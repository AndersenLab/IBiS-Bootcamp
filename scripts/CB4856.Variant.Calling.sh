#!bin/bash


# Used to Subset Original
samtools merge DL238.merged.bam `ls *DL238*bam`
samtools index DL238.merged.bam
samtools view -h -b CB4856.merged.bam chrIII:1-2000000 | samtools bam2fq - > DL238.chrIII.fq


# Requires Homebrew, and samtools (dev)
brew install --devel samtools

#
# Starting Point
#

# Download Chromosome III
wget http://hgdownload.cse.ucsc.edu/goldenPath/ce10/chromosomes/chrIII.fa.gz
gzip -d chrIII.fa.gz
bgzip chrIII.fa

# Generate Stats
seqtk comp chrIII.fa.gz 

# Cut out first 2M bp; index.
samtools faidx chrIII.fa.gz chrIII:1-2000000 | bgzip > chrIII.2M.fa.gz
bwa index chrIII.2M.fa.gz

# Perform alignment.
bwa mem -t 2 chrIII.2M.fa.gz CB4856.chrIII.fq.gz | samtools view -S -b - > CB4856.chrIII.2M.bam

# Sort Reads
samtools sort CB4856.chrIII.2M.bam CB4856.chrIII.2M.sorted

## Call Variants
samtools mpileup -uf chrIII.2M.fa.gz  CB4856.chrIII.2M.sorted.bam | bcftools call -mv -Ov > CB4856.vcf.gz

