mv vsftpd.conf /etc/vsftpd/
mv vsftpd.pem /etc/vsftpd/
mv vsftpd.cert /etc/vsftpd/

adduser -D admin
echo "admin:admin" | chpasswd

mkdir /home/admin/test

vsftpd /etc/vsftpd/vsftpd.conf