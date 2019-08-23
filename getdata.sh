#model="$1"
modelo="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/73 JUL19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190731.csv"
awk -F,  'BEGIN{n=0;} /^.[1-8].[6-7].[2-8]/ {print $1;n=n+1;}END{print n;}' "$model" |tr "\n" " " > portfolio374
echo >> portfolio374
awk '{print "n",$NF;}' portfolio374 >> portfolio374
for stock in `awk -F,  '/^.[1-8].[6-7].[2-8]/ {print $1;}' "$model" |tr "\n" " "`
do
    echo $stock
    sed -n "s/^$stock,//p" "$model" >> portfolio374
done
sed -i "s/,/ /g" portfolio374
awk  '{print NF;}' portfolio374 