#!/bin/bash -v
yum -y install mariadb mariadb-server
systemctl enable mariadb.service
systemctl start mariadb.service
mysqladmin -u root password $db_rootpassword
cat << EOF | mysql -u root --password=$db_rootpassword
CREATE DATABASE $db_name;
GRANT ALL PRIVILEGES ON $db_name.* TO "$db_user"@"%"
IDENTIFIED BY "$db_password";
FLUSH PRIVILEGES;
EXIT
EOF