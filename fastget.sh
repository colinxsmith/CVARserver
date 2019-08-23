#!/bin/bash
modelo="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/73 JUL19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190731.csv"

perl -e "while(<STDIN>){if(/^.[1-8].[6-7].[2-8]/){print;}}" < "$model" > portfolioU
sed -i "s/,/ /g" portfolioU
echo n > p1
awk '{print $1;}' portfolioU | tr "\n" " "|awk '{print NF;}' >> p1
echo tlen >>p1
perl -e "while(<STDIN>){print;exit;}"<portfolioU | awk '{print NF-1;}'>>p1
echo names >>p1
awk '{print $1;}' portfolioU | tr "\n" " " >> p1
echo >>p1
sed -i "s/ $//" p1
echo DATA>>p1
perl -e "while(<STDIN>){if(s/^.[1-8].[6-7].[2-8]. //){print;}}"<portfolioU>>p1
mv p1 portfolioU