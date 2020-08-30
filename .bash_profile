export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#----- CONFIG -------
########################################
auquatoneThreads=5
chromiumPath=/snap/bin/chromium
subdomainThreads=10
dirsearchThreads=50
dirsearchWordlist=~/tools/dirsearch/db/dicc.txt
dirsearchExtensions=php,asp,aspx,jsp,html,zip,jar,json,js,inc,inc.php,config,old,sql,db,cfg,bak
fuffwordlist=~/tools/SecLists/Discovery/Web-Content/Apache.fuzz.txt #dont forget change it as you like ~/tools/SecLists/Discovery/Web-Content/....
ffufExtensions=asp,aspx,cgi,cfml,CFM,htm,html,json,jsp,php,phtml,pl,py,sh,shtml,sql,txt,xml,xhtml,tar,tar.gz,tgz,war,zip,swp,src,jar,java,log,bin,js,db
fuffcode=200,204,403,307,401,403 #default: 200,204,301,302,307,401,403
githubtoken=xxxxxxxxxxxx #put your github token here
########################################
#----- AWS -------

s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1 
}

#---- Content discovery ----
dirs(){ #this grabs endpoints from a application.wadl and puts them in yahooapi.txt
curl -s $1 | grep path | sed -n "s/.*resource path=\"\(.*\)\".*/\1/p" | tee -a ~/tools/dirsearch/db/yahooapi.txt
}
fuf(){
	name=$(echo $1 | unfurl -u domains)
	x=$(date +%Y%m%d%H%M%S)
	mkdir -p ~/FFUF-Reports
	mkdir -p ~/FFUF-Reports/$name
	ffuf -w $fuffwordlist -u $1/FUZZ -D -e $ffufExtensions -t 150 -o ~/FFUF-Reports/$name/$name_$x.json -mc $fuffcode 
}
#----- recon -----
screenshot(){
echo "ex: screenshot tools/urlist.txt  output..."
cat ~/$1 | aquatone -chrome-path $chromiumPath -out ~/$2/aqua_out -threads $auquatoneThreads
}    #urllist.txt                                     #output name


lazy(){ #fiexed lazyrecon with docker 
docker run --user $(id -u):$(id -g) -v $(pwd)/lazyrecon_results:/home/lazyrecon_user/tools/lazyrecon/lazyrecon_results/ soaringswine/lazyrecon_docker -d $1
}

crtndstry(){
./tools/crtndstry/crtndstry $1
}

am(){ #runs amass passively and saves to json
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g"| httprobe -c 60 | tee -a $1-domains.txt
}

certprobe(){ #runs httprobe on all the hosts from certspotter
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a ./all.txt
}

mscan(){ #runs masscan
sudo masscan -p 4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744 $
}

certspotter(){ 
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

ipinfo(){
curl http://ipinfo.io/$1
}


#------ Tools ------
dirsearch(){ ##runs dirsearch and takes host and extension as arguments
python3 ~/tools/dirsearch/dirsearch.py -w $dirsearchWordlist -u $1 -e $dirsearchExtensions -t $dirsearchThreads -b
}

sqlmap(){
python ~/tools/sqlmap*/sqlmap.py -u $1 
}

ncx(){
nc -l -n -vv -p $1 -k
}

crtshdirsearch(){ #gets all domains from crtsh, runs httprobe and then dir bruteforcers
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50 | grep https | xargs -n1 -I{} python3 ~/tools/dirsearch/dirsearch.py -u {} -w $dirsearchWordlist -e $dirsearchExtensions -t $dirsearchThreads -b
}
secerts(){ #tool will proceed to scan all the org repos, then all the user repos and user gists by org name only (ex: secerts roblox.com)
docker run -it abhartiya/tools_gitallsecrets -token=$githubtoken -org=$1
}
