model="$1"
#model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
awk -F,  'BEGIN{n=0;} /^B.9.[1-7]/ {print $1;n=n+1;}END{print n;}' "$model" |tr "\n" " " > portfolio
echo >> portfolio
awk '{print "n",$NF;}' portfolio >> portfolio
for stock in `awk -F,  'BEGIN{n=0;} /^B.9.[1-7]/ {print $1;n=n+1;}END{print n;}' "$model" |tr "\n" " "`
do
    echo $stock
    sed -n "s/$stock,//p" "$model" >> portfolio
done
sed -i "s/,/ /g" portfolio

awk  '{print NF;}'  portfolio