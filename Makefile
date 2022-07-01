# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ide-spir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/01 12:54:02 by ide-spir          #+#    #+#              #
#    Updated: 2022/07/01 13:34:24 by ide-spir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER = server
CLIENT = client
cc = gcc
LIBFT = libft/libft.a
CFLAGS = -Wall -Wextra -Werror
SRC_S = ft_server.c
SRC_C = ft_client.c
INCLUDE = -I libft/.

all: $(LIBFT) $(SERVER) $(CLIENT)

$(SERVER):
	@$(CC) $(CFLAGS) $(LIBFT) ft_server.c -o server

$(CLIENT):
	@$(CC) $(CFLAGS) $(LIBFT) ft_client.c -o client

$(LIBFT):
	@make -C libft

clean:
	@make clean -C libft

fclean: clean
	@make fclean -C libft
	@rm -rf $(SERVER)
	@rm -rf $(CLIENT)

re: fclean all

.PHONY: re clean fclean all
