#model="$1"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
awk -F,  'BEGIN{n=0;} /^.5.9.[1-7]/ {print $1;n=n+1;}END{print n;}' "$model" |tr "\n" " " > portfolio1
echo >> portfolio1
awk '{print "n",$NF;}' portfolio1 >> portfolio1
for stock in `awk -F,  '/^.5.9.[1-7]/ {print $1;}' "$model" |tr "\n" " "`
do
    echo $stock
    sed -n "s/^$stock,//p" "$model" >> portfolio1
done
sed -i "s/,/ /g" portfolio1
awk  '{print NF;}' portfolio1 
