COMPOSE = docker-compose 
FLAG = up --build -d
VOLUME = 
# %.o: %.cpp
# 	$(CC) $(FLAG)

$(NAME):
	$(COMPOSE) $(FLAG)

all: $(NAME)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: flcean all

.PHONY: all clean fclean re