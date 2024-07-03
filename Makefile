all:
	cd srcs && sudo docker-compose up --build -d

clean :
	cd srcs && sudo docker-compose down --rmi all

fclean: clean
	sudo rm -rf /home/seonggoc/data/mariadb/*
	sudo rm -rf /home/seonggoc/data/wordpress/*

ps:
	cd srcs && sudo docker-compose ps

mariadb:
	sudo docker exec -it mariadb /bin/bash

nginx:
	sudo docker exec -it nginx /bin/bash

wordpress:
	sudo docker exec -it wordpress /bin/bash