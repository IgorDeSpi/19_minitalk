# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ide-spir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/01 12:54:02 by ide-spir          #+#    #+#              #
#    Updated: 2022/07/06 12:05:56 by ide-spir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_server.c \
	ft_client.c

SRC_B = ft_server_bonus.c \
	ft_client_bonus.c

OBJS = $(SRC:.c=.o)

OBJS_B = $(SRC_B:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: server client

bonus: Server Client

server: ft_server.o libft
	@$(CC) -o $@ $< -Llibft -lft

client: ft_client.o libft
	@$(CC) -o $@ $< -Llibft -lft

Server: ft_server_bonus.o libft
	@$(CC) -o $@ $< -Llibft -lft

Client: ft_client_bonus.o libft
	@$(CC) -o $@ $< -Llibft -lft

%.o: %.c
	@$(CC) -c $(CFLAGS) $?

libft:
	@make -C libft

clean:
	@make -C libft clean
	@rm -f $(OBJS) $(OBJS_B)

fclean: clean
	@rm -f server client libft/libft.a Server Client

re: fclean all

.PHONY: all bonus libft clean fclean re
