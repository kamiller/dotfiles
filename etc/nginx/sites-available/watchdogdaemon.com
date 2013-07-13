# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts

server {
	listen   80 default;
	server_name  watchdogdaemon.com;

	access_log  /var/log/nginx/localhost.access.log;
	
	root /var/www;

	# error_page  502 503 504 /50x.html;


	error_page  503 502 504 = @server_error;

    location @server_error {
        try_files /50x.html /var/www/50x.html =500;
    }

	location /maintenance/carbon_fibre.png {
		root /var/www;
#		index index.html index.htm;
		try_files /carbon_fibre.png /;
	}

	location /maintenance/watchdogd-logo-small.png {
		root /var/www;
#		index index.html index.htm;
		try_files /watchdogd-logo-small.png /;
	}

	location /images {
		root /var/lib/tomcat6/webapps/ROOT;
#		index index.html index.htm;
	}

	location /styles {
		root /var/lib/tomcat6/webapps/ROOT;
#		index index.html index.htm;
	}

	location /scripts {
		root /var/lib/tomcat6/webapps/ROOT;
#		index index.html index.htm;
	}

	location / {
		proxy_set_header X-Forwarded-Host $host;
		proxy_set_header X-Forwarded-Server $host;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_pass http://localhost:8080/;
		# proxy_redirect	http://localhost:8080/ /;
		proxy_redirect default;
		
	}


	# redirect server error pages to the static page /50x.html
	#
	#error_page   500 502 503 504  /50x.html;
	#location = /50x.html {
	#	root   /var/www/nginx-default;
	#}

	# proxy the PHP scripts to Apache listening on 127.0.0.1:80
	#
	#location ~ \.php$ {
		#proxy_pass   http://127.0.0.1;
	#}

	# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
	#
	#location ~ \.php$ {
		#fastcgi_pass   127.0.0.1:9000;
		#fastcgi_index  index.php;
		#fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
		#includefastcgi_params;
	#}

	# deny access to .htaccess files, if Apache's document root
	# concurs with nginx's one
	#
	#location ~ /\.ht {
		#deny  all;
	#}
}


# another virtual host using mix of IP-, name-, and port-based configuration
#
#server {
#listen   8000;
#listen   somename:8080;
#server_name  somename  alias  another.alias;

#location / {
#root   html;
#index  index.html index.htm;
#}
#}


# HTTPS server
#
#server {
#listen   443;
#server_name  localhost;

#ssl  on;
#ssl_certificate  cert.pem;
#ssl_certificate_key  cert.key;

#ssl_session_timeout  5m;

#ssl_protocols  SSLv2 SSLv3 TLSv1;
#ssl_ciphers  ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
#ssl_prefer_server_ciphers   on;

#location / {
#root   html;
#index  index.html index.htm;
#}
#}
