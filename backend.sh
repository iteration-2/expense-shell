dnf module disable nodejs -y
dnf module enable nodejs:18 -y
useradd expense
mkdir -p /app
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip
cd /app
npm install
cp /home/ec2-user/expense-shell/files/backend.service /etc/systemd/system/backend.service
systemctl daemon-reload
systemctl enable backend
systemctl start backend
dnf install mysql -y
mysql -h 172.31.82.144 -uroot -pExpenseApp@1 < /app/schema/backend.sql