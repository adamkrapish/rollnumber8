username="adamkrapish"
password="coldfusion@1"
emailaddress="adamkrapish@structuredweb.com"
CURL_URL="https://api.github.com/user/repos"
git config --global user.name "adamkrapish"
git config --global user.email "adamkrapish@structuredweb.com"

for d in */ ; do
    echo $d
    cd $d
    RepoName="\""${d::-1}"\""
    CURL_ARGS="-u "$username":"$password" "$CURL_URL" -d {\"name\":$RepoName}"
    curl $CURL_ARGS >> ../${d::-1}.sh
    git init  >> ../${d::-1}.sh
    git add .   >> ../${d::-1}.sh
    git commit -m $RepoName   >> ../${d::-1}.sh
    
    RepoURL="https://github.com/"$username"/"${d::-1}".git"
    git remote add origin $RepoURL   >> ../${d::-1}.sh
    git push -u origin master   >> ../${d::-1}.sh
    cd ..
done