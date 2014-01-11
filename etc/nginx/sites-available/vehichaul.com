# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts

server {
	listen   80 default;
	server_name  test.vehichaul.com;

	access_log  /var/log/nginx/localhost.access.log;

	keepalive_timeout 5;
	
       root /var/rails/vehichaul/current/public;


	location / {
	      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	      proxy_set_header Host $http_host;
	      proxy_redirect off;

	      # If you don't find the filename in the static files
	      # Then request it from the unicorn server
	      if (!-f $request_filename) {
		proxy_pass http://localhost:8080;
		break;
	      }
    	}
		
        location ~ ^/assets/ {
                expires 1y;
                add_header Cache-Control public;

                add_header ETag "";
                break;
        }

	error_page 500 502 503 504 /500.html;
	    location = /500.html {
	      root /var/rails/testapp/public;
	    }
}
