#! /bin/bash

echo   "BBBB____ RRRR____ AAAA____ HHHH____ MMMM____ AAAA____ SSSS____ TTTT____ RRRR____ AAAA"
sleep 1
echo "Checking Subfinder..."
echo "Checking Amass..."
sleep 1
echo "If Amass,Subfinder is installed so S0UNDS G00D if not installed so choose the options 'y' from Below? (y/n)"
read Below  
if [[ $Below == "n" ]]; then
       echo "No problem u can processed..*"
else
 
       go install -v github.com/OWASP/Amass/v3/...@master
       go get -u github.com/tomnomnom/fff
       go get -u github.com/tomnomnom/assetfinder
       go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
       go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
       go install github.com/tomnomnom/waybackurls@latest
       go install github.com/tomnomnom/httprobe@latest
       go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
       go install -v github.com/tomnomnom/anew@latest
       GO111MODULE=on go get -u -v github.com/lc/subjs@latest
       go install github.com/003random/getJS@latest
       go install github.com/lc/gau/v2/cmd/gau@latest
       go get -u github.com/lc/secretz
fi
 
echo "Checking Subfinder..."  
cd go/bin
sudo cp -r * /usr/local/bin

  
echo -n "Type your Traget name --->"
read name
echo -n "Type your file Name Where you want to Store your Recon of Target --->"
read Filename
echo "Running Subfinder... "
subfinder -d $name  -silent -t 50
echo "Subfinder in offline"
sleep 1
cd ../../
echo "Running Amass..."
amass enum -active -brute -d $name | tee -a $Filename
echo "Running Dirb"
dirb $name

