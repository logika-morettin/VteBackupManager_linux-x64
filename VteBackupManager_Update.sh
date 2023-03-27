PROJECT_NAME=VteBackupManager
GH_USER=logika-morettin
GH_REPO=${PROJECT_NAME}_linux-x64
GH_BRANCH=main

cd "$(dirname "$0")"

rm -r $PROJECT_NAME/.backup
mkdir -p $PROJECT_NAME/.backup
cp -r $PROJECT_NAME/* $PROJECT_NAME/.backup

wget https://github.com/$GH_USER/$GH_REPO/archive/$GH_BRANCH.tar.gz -O $GH_REPO-$GH_BRANCH.tar.gz

tar -xzvf $GH_REPO-$GH_BRANCH.tar.gz
rm $GH_REPO-$GH_BRANCH.tar.gz

systemctl stop $PROJECT_NAME

cp -r $GH_REPO-$GH_BRANCH/* .
rm -r $GH_REPO-$GH_BRANCH

cp $PROJECT_NAME/.backup/appsettings.json $PROJECT_NAME/.

chmod +x $PROJECT_NAME/VteBackupManager_Install.sh
$PROJECT_NAME/VteBackupManager_Install.sh