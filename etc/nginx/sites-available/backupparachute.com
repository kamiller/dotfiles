server {
	#listen   80; ## listen for ipv4; this line is default and implied
	#listen   [::]:80 default ipv6only=on; ## listen for ipv6

	server_name backupparachute.com;

	root /var/www/bps;
	index index.html index.htm;


	#location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to index.html
		#try_files $uri $uri/ /index.html;
	#}

	#location /doc {
		#root /usr/share;
		#autoindex on;
		#allow 127.0.0.1;
		#deny all;
	#}

	#location /images {
		#root /usr/share;
		#autoindex off;
	#}

	#error_page 404 /404.html;

	# redirect server error pages to the static page /50x.html
	#
	#error_page 500 502 503 504 /50x.html;
	#location = /50x.html {
	#	root /usr/share/nginx/www;
	#}

	# proxy the PHP scripts to Apache listening on 127.0.0.1:80
	#
	#location ~ \.php$ {
	#	proxy_pass http://127.0.0.1;
	#}

	# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
	#
	#location ~ \.php$ {
	#	fastcgi_pass 127.0.0.1:9000;
	#	fastcgi_index index.php;
	#	include fastcgi_params;
	#}

	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
	#	deny all;
	#}
}
