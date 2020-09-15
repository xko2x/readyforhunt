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
sudo apt install knockpy
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
sudo apt-get install -y docker.io
sudo apt install snapd
sudo snap install amass
sudo apt-get install -y masscan
sudo apt-get install nmap
pip install webscreenshot
sudo apt-get install phantomjs
sudo apt-get install imagemagick 
sudo apt install curl git libcurl4-openssl-dev make zlib1g-dev \
gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev \
liblzma-dev autoconf libgdbm-dev libncurses5-dev automake \
libtool bison pkg-config ruby ruby-bundler ruby-dev libsqlite3-dev sqlite3 -y

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
cd ~/
echo "done"

echo "installing bash_profile aliases from recon_profile"
wget https://raw.githubusercontent.com/xko2x/readyforhunt/master/.bash_profile
source ~/.bash_profile
echo "done"

cd ~/trash/
echo "Installing Golang"
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz
sudo tar -xvf go1.15.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
cd ~/
source .bash_profile
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
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
gem install nokogiri
gem install wpscan
cd ~/tools/
echo "done"


echo "installing ffuf"
wget https://github.com/ffuf/ffuf/releases/download/v1.1.0/ffuf_1.1.0_linux_amd64.tar.gz
tar -xvzf ffuf_1.1.0_linux_amd64.tar.gz
cp ffuf /usr/local/bin
chmod +x /usr/local/bin/ffuf
echo "done"
cd ~/tools/

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
git clone https://github.com/soaringswine/lazyrecon_docker.git
cd lazyrecon_docker
docker build --rm -f "Dockerfile" -t lazyrecon_docker:latest .
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

cd ~/tools/
echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

echo "installing lazyrecon-docker"
docker pull txt3rob/lazy-recon
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

echo "git-all-secerts"
docker run --rm -it abhartiya/tools_gitallsecrets

cd ~/tools

[ ! -f ~/tools/wordlists/ ] && mkdir ~/tools/wordlists/  2&>1
[ ! -f ~/tools/wordlists/dns/ ] && mkdir ~/tools/wordlists/dns/  2&>1
[ ! -f ~/tools/wordlists/content/ ] && mkdir ~/tools/wordlists/content/  2&>1
[ ! -f ~/tools/wordlists/params/ ] && mkdir ~/tools/wordlists/params/  2&>1

# domain discovery

[[ -f ~/tools/wordlists/dns/all.txt ]] || wget -q -O ~/tools/wordlists/dns/all.txt https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

[[ -f ~/tools/wordlists/dns/commonspeak2-subdomains.txt ]] || wget -q -O ~/tools/wordlists/dns/commonspeak2-subdomains.txt https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt

[[ -f ~/tools/wordlists/dns/shorts.txt ]] || wget -q -O ~/tools/wordlists/dns/shorts.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/subdomains-top1million-20000.txt

# permutation domain
[[ -f ~/tools/wordlists/dns/short-permutation.txt ]] || wget -q -O ~/tools/wordlists/dns/short-permutation.txt https://raw.githubusercontent.com/subfinder/goaltdns/master/words.txt

# vhost domain
[[ -f ~/tools/wordlists/dns/virtual-host-scanning.txt ]] || wget -q -O ~/tools/wordlists/dns/virtual-host-scanning.txt https://raw.githubusercontent.com/codingo/VHostScan/master/VHostScan/wordlists/virtual-host-scanning.txt

# content discovery
[[ -f ~/tools/wordlists/content/raft-large-directories.txt ]] || wget -q -O ~/tools/wordlists/content/raft-large-directories.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories.txt

[[ -f ~/tools/wordlists/content/quick.txt ]] || wget -q -O ~/tools/wordlists/content/quick.txt https://raw.githubusercontent.com/maurosoria/dirsearch/master/db/dicc.txt


[[ -f ~/tools/wordlists/content/top10000.txt ]] || wget -q -O ~/tools/wordlists/content/top10000.txt https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/RobotsDisallowed-Top1000.txt

cat ~/tools/wordlists/content/quick.txt ~/tools/wordlists/content/top10000.txt > ~/tools/wordlists/content/quick-content-discovery.txt

[[ -f ~/tools/wordlists/content/dir-all.txt ]] || wget -q -O ~/tools/wordlists/content/dir-all.txt https://gist.githubusercontent.com/jhaddix/b80ea67d85c13206125806f0828f4d10/raw/c81a34fe84731430741e0463eb6076129c20c4c0/content_discovery_all.txt

# params
[[ -f ~/tools/wordlists/params/param-miner.txt ]] || wget -q -O ~/tools/wordlists/params/param-miner.txt https://raw.githubusercontent.com/PortSwigger/param-miner/master/resources/params

[[ -f ~/tools/wordlists/params/parameth.txt ]] || wget -q -O ~/tools/wordlists/params/parameth.txt https://raw.githubusercontent.com/maK-/parameth/master/lists/all.txt

cat ~/tools/wordlists/params/param-miner.txt ~/tools/wordlists/params/parameth.txt | sort -u > ~/tools/wordlists/params/all.txt




git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools
sudo git clone https://github.com/digininja/CeWL.git
echo "done"
cd ~/tools
echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
echo "and please activate bash_profile by 'source ~/.bash_profile' and edit config section at .bash_profile and put your info!!!!!"
source ~/.bash_profile
