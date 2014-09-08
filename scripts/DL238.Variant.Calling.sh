#!bin/bash

#
# Starting Point
#

# Download Chromosome III
wget http://hgdownload.cse.ucsc.edu/goldenPath/ce10/chromosomes/chrIII.fa.gz
gzip -d chrIII.fa.gz
bgzip chrIII.fa

# Cut out first 2M bp; index.
samtools faidx chrIII.fa.gz chrIII:1-2000000 |  sed -e 's/:1-2000000//g' | bgzip > chrIII.2M.fa.gz
bwa index chrIII.2M.fa.gz

# Perform alignment.
bwa mem -t 2 chrIII.2M.fa.gz DL238.chrIII.fq.gz | samtools view -S -b - > DL238.chrIII.2M.bam

# Sort Reads
samtools sort DL238.chrIII.2M.bam DL238.chrIII.2M.sorted

# Index
samtools index DL238.chrIII.2M.sorted.bam 

## Call Variants
samtools mpileup -uf chrIII.2M.fa.gz  DL238.chrIII.2M.sorted.bam | bcftools call -mv -O v | grep -v '##' > DL238.vcf

## Fix VCF So it can be viewed in IGV.
cat <(echo "##fileformat=VCFv4.1") <(grep -v '##' DL238.vcf)  > DL238.fixed.vcf

## View Statistics
## Doesn't seem to work. Error is "Could not read the file or the file is not indexed: DL238.vcf.gz"
# bcftools stats DL238.vcf.gz 
