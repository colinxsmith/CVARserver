#model="$1"
model="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/72 JUN19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190628.csv"
modeln="/ZDrive/client_systems/Star_Systems_RM_build/BITA Risk Models/returnModels/73 JUL19/loadfiles/BITA_ReturnModel_WITH-HACK_GBP_20190731.csv"
awk -F,  'BEGIN{n=0;} /^.[1-5].9.[1-7]/ {print $1;n=n+1;}END{print n;}' "$model" |tr "\n" " " > portfolioL
echo >> portfolioL
awk '{print "n",$NF;}' portfolioL >> portfolioL
for stock in `awk -F,  '/^.[1-5].9.[1-7]/ {print $1;}' "$model" |tr "\n" " "`
do
    echo $stock
    sed -n "s/^$stock,//p" "$model" >> portfolioL
done
sed -i "s/,/ /g" portfolioL
awk  '{print NF;}' portfolioL 
