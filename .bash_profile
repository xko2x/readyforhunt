#----- CONFIG -------
########################################
auquatoneThreads=5
chromiumPath=/snap/bin/chromium
subdomainThreads=10
fastffufwordlist=~/tools/wordlists/content/quick.txt
dirsearchExtensions=php,asp,aspx,jsp,html,zip,jar,json,js,inc,inc.php,config,old,sql,db,cfg,bak
fuffwordlist=~/tools/wordlists/content/dir-all.txt #dont forget change it as you like ~/tools/SecLists/Discovery/Web-Content/....
ffufExtensions=asp,aspx,cgi,cfml,CFM,htm,html,json,jsp,php,phtml,pl,py,sh,shtml,sql,txt,xml,xhtml,tar,tar.gz,tgz,war,zip,swp,src,jar,java,log,bin,js,db
fuffcode=200,204,403,307,401,403 #default: 200,204,301,302,307,401,403
notfuffcode=500-599,404,301,400 
githubtoken=xxxxxxxxxxxx #put your github token here
########################################

#----- vulns -------

gen(){ #runs nuclei scan
nuclei -c 200 -t vulnerabilities/generic -l $1
}

tkv(){ #runs nuclei scan
nuclei -c 200 -t takeovers/subdomain-takeover.yaml -l $1
}


#----- AWS -------

s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1 
}

#---- Content discovery ----

fastfuf(){

	ffuf -w $fastffufwordlist -u $1/FUZZ -D -ic -e $ffufExtensions -t 200  -mc $fuffcode -mc all -fc $notfuffcode -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36"
}

fuf(){

	ffuf -w $fuffwordlist -u $1/FUZZ -D -ic -e $ffufExtensions -t 200  -mc $fuffcode -mc all -fc $notfuffcode -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36"
}
#----- recon -----
screenshot(){
echo "ex: screenshot tools/urlist.txt  output..."
cat ~/$1 | aquatone -chrome-path $chromiumPath -out ~/$2/aqua_out -threads $auquatoneThreads
}    #urllist.txt                                     #output name


am(){ #runs amass passively and saves to json
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g"| httprobe -c 60 | tee -a $1-domains.txt
}

certprobe(){ #runs httprobe on all the hosts from certspotter
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a ./all.txt
}

mscan(){ #runs masscan
sudo masscan -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744 $1
}

crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

#------ Tools ------
wayback(){ 
echo "$1" | gau | anew $1-waybacks.txt > /dev/null
echo "$1" | waybackurls -no-subs | anew $1-waybacks.txt > /dev/null
}

waybackall(){ 
cat $1 | gau | anew all-waybacks.txt > /dev/null
cat $1 | waybackurls -no-subs | anew all-waybacks.txt > /dev/null
}

gauq() {
	gau $1 -subs | \
	grep "=" | \
	egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | \
	qsreplace -a
}

sqliz() {
	gauq $1 | python3 $HOME/Tools/DSSS/dsss.py
}

bxss() {
	BLIND="https://xxko2xx.xss.ht"
	gauq $1 | kxss | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | \
	dalfox pipe -b $BLIND
}


ncx(){
nc -l -n -vv -p $1 -k
}

crtshdirsearch(){ #gets all domains from crtsh, runs httprobe and then dir bruteforcers
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50 | grep https | xargs -n1 -I{} python3 ~/tools/dirsearch/dirsearch.py -u {} -w $dirsearchWordlist -e $dirsearchExtensions -t $dirsearchThreads -b
}

