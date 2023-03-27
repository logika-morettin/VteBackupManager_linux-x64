PROJECT_NAME=VteBackupManager
GH_USER=logika-morettin
GH_REPO=${PROJECT_NAME}_linux-x64
GH_BRANCH=main

cd "$(dirname "$0")"

systemctl stop $PROJECT_NAME

rm -r $PROJECT_NAME/.backup
mkdir -p $PROJECT_NAME/.backup
cp -r $PROJECT_NAME/* $PROJECT_NAME/.backup

wget https://github.com/$GH_USER/$GH_REPO/archive/$GH_BRANCH.tar.gz -O $GH_REPO-$GH_BRANCH.tar.gz

tar -xzvf $GH_REPO-$GH_BRANCH.tar.gz
rm $GH_REPO-$GH_BRANCH.tar.gz

cp -r $GH_REPO-$GH_BRANCH/* .
rm -r $GH_REPO-$GH_BRANCH

cp $PROJECT_NAME/.backup/appsettings.json $PROJECT_NAME/.

chmod +x ${PROJECT_NAME}_Install.sh
chmod +x $PROJECT_NAME/$PROJECT_NAME

mv $PROJECT_NAME.service /etc/systemd/system

chmod +x /etc/systemd/system/$PROJECT_NAME.service

systemctl daemon-reload
systemctl enable application.service
systemctl start $PROJECT_NAME
