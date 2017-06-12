#!/bin/bash

awk '{if($4=="-"){v=$6}else{v=$5} print $3,v,v,$4}' OFS="\t" mm10.refGene.txt | awk 'length($1) < 6 {print $0}' | awk '$1 != "chrY" {print $0}' | sortBed -i stdin | uniq  > ../TSS/mm10.refGene.TSS.bed
awk '{if($4=="-"){v=$6}else{v=$5} print $3,v,v,$4}' OFS="\t" mm9.refGene.txt | awk 'length($1) < 6 {print $0}' | awk '$1 != "chrY" {print $0}' | sortBed -i stdin | uniq  > ../TSS/mm9.refGene.TSS.bed
awk '{if($4=="-"){v=$6}else{v=$5} print $3,v,v,$4}' OFS="\t" hg19.refGene.txt | awk 'length($1) < 6 {print $0}' | awk '$1 != "chrY" {print $0}' | sortBed -i stdin | uniq  > ../TSS/hg19.refGene.TSS.bed
awk '{if($4=="-"){v=$6}else{v=$5} print $3,v,v,$4}' OFS="\t" hg38.refGene.txt | awk 'length($1) < 6 {print $0}' | awk '$1 != "chrY" {print $0}' | sortBed -i stdin | uniq  > ../TSS/hg38.refGene.TSS.bed

awk '{print substr($0,4)}' ../TSS/hg19.refGene.TSS.bed | awk '{print "human"$0}' > ../TSS/hg19_mm10_c.refGene.TSS.bed
awk '{print substr($0,4)}' ../TSS/mm10.refGene.TSS.bed | awk '{print "mouse"$0}' >> ../TSS/hg19_mm10_c.refGene.TSS.bed

