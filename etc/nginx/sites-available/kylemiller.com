server {
	#listen   80; ## listen for ipv4; this line is default and implied
	#listen   [::]:80 default ipv6only=on; ## listen for ipv6

	server_name kylemiller.com *.kylemiller.com;

	root /var/www/km;
	index index.html index.htm;

}
