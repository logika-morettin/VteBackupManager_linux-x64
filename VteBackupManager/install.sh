PROJECT_NAME=VteBackupManager
GH_USER=logika-morettin
GH_REPO=${PROJECT_NAME}_linux-x64
GH_BRANCH=main

cd "$(dirname "$0")"

systemctl stop $PROJECT_NAME

rm -r .backup
mkdir -p .backup
cp -r * .backup

wget https://github.com/$GH_USER/$GH_REPO/archive/$GH_BRANCH.tar.gz -O $GH_REPO-$GH_BRANCH.tar.gz

tar -xzvf $GH_REPO-$GH_BRANCH.tar.gz
rm $GH_REPO-$GH_BRANCH.tar.gz

cp -r $GH_REPO-$GH_BRANCH/* .
rm -r $GH_REPO-$GH_BRANCH

cp .backup/appsettings.json .

chmod +x install.sh
chmod +x $PROJECT_NAME

mv ./$PROJECT_NAME.service /etc/systemd/system

chmod +x /etc/systemd/system/$PROJECT_NAME.service

systemctl daemon-reload
systemctl start $PROJECT_NAME
