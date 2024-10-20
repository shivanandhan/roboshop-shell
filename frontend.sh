color= "\e[35m"
no_color= "\e[0m"

echo -e "$color Installing nginx $no_color"

dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

echo -e "$color copying conf file $no_color"
cp nginx.conf /etc/nginx/nginx.conf

echo -e "$color removing file and downloading content $no_color"

rm -rf /usr/share/nginx/html/*
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
cd /usr/share/nginx/html

unzip /tmp/frontend.zip

echo -e "$color restarting nginx $no_color"
systemctl enable nginx
systemctl restart nginx