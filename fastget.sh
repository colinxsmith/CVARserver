#!/bin/bash
modelo="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/73 JUL19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190731.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/74 AUG 19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190830.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/75 SEP19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190930.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/77 NOV19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20191129.csv"
script1="while(<STDIN>){if(/^.[1-8].[6-7].[2-8]/){print;}}"
script="while(<STDIN>){if(/^.[1-8].[6-7].[3-7]/){print;}}"
perl -e $script < "$model" > portfolioUA
sed -i "s/,/ /g" portfolioUA
echo n > p1
awk '{print $1;}' portfolioUA | tr "\n" " "|awk '{print NF;}' >> p1
echo tlen >>p1
perl -e "while(<STDIN>){print;exit;}"<portfolioUA | awk '{print NF-1;}'>>p1
echo names >>p1
awk '{print $1;}' portfolioUA | tr "\n" " " >> p1
echo >>p1
sed -i "s/ $//" p1
echo DATA>>p1
perl -e $script <portfolioUA>>p1
mv p1 portfolioUA
