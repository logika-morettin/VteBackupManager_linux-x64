PROJECT_NAME=VteBackupManager

systemctl stop $PROJECT_NAME

chmod +x $PROJECT_NAME

mv $PROJECT_NAME.service /etc/systemd/system

chmod +x /etc/systemd/system/$PROJECT_NAME.service

systemctl daemon-reload
systemctl enable application.service
systemctl start $PROJECT_NAME