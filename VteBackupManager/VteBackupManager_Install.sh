PROJECT_NAME=VteBackupManager

cd "$(dirname "$0")"

chmod +x $PROJECT_NAME

mv $PROJECT_NAME.service /etc/systemd/system

chmod +x /etc/systemd/system/$PROJECT_NAME.service

systemctl daemon-reload
systemctl enable $PROJECT_NAME.service
systemctl restart $PROJECT_NAME
