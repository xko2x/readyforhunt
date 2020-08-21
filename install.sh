#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y libldns-dev
sudo add-apt-repository universe
sudo apt update
sudo apt install python2
sudo apt-get install -y python-setuptools
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y python3-pip
mkdir ~/trash




#install go


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"



#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/



echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
sudo pip install requests
sudo pip install dnspython
sudo pip install argparse
cd ~/tools/
echo "done"

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat .bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"

cd ~/trash/
echo "Installing Golang"
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
sudo tar -xvf go1.15.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
source ~/.bash_profile
sleep 1
cd ~/tools/



#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"
cd ~/tools/

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
sudo pip install -r requirements.txt
echo "done"


echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"


echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"


echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"


echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "Expired Domain Take Overs"
git clone https://github.com/JordyZomer/autoSubTakeover.git
cd autoSubTakeover
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "subbrute"
git clone https://github.com/TheRook/subbrute.git
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

cd ~/trash/

echo "installing httprobe"
wget https://github.com/tomnomnom/httprobe/releases/download/v0.1.2/httprobe-linux-amd64-0.1.2.tgz
tar -xvzf httprobe-linux-amd64-0.1.2.tgz
cp httprobe /usr/local/bin
chmod +x /usr/local/bin/httprobe
echo "done"
echo "installing ffuf"
wget https://github.com/ffuf/ffuf/releases/download/v1.1.0/ffuf_1.1.0_linux_amd64.tar.gz
tar -xvzf ffuf_1.1.0_linux_amd64.tar.gz
cp ffuf /usr/local/bin
chmod +x /usr/local/bin/ffuf
echo "done"
cd ~/tools/
echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"


mkdir ~/wordlist
cd ~/wordlist
git clone https://github.com/danielmiessler/SecLists.git
cd ~/wordlist/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/wordlist
sudo wget -nc http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
sudo wget -nc http://www.tekdefense.com/downloads/wordlists/1aNormusWL.zip
sudo wget -nc http://www.tekdefense.com/downloads/wordlists/KippoWordlist.txt
sudo git clone https://github.com/digininja/CeWL.git
echo "done"
rm -rf ~/trash/
cd ~/tools
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools and ~/wordlist"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
source ~/.bash_profile