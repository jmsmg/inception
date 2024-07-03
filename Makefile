up:
	cd srcs && sudo docker-compose up --build -d

down:
	cd srcs && sudo docker-compose down --rmi all
	sudo rm -rf /home/seonggoc/data/mariadb/*
	sudo rm -rf /home/seonggoc/data/wordpress/*
ps:
	cd srcs && sudo docker-compose ps

mariadb:
	sudo docker exec -it mariadb /bin/bash

nginx:
	sudo docker exec -it mariadb /bin/bash

wordpress:
	sudo docker exec -it mariadb /bin/bash