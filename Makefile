# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ide-spir <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/01 12:54:02 by ide-spir          #+#    #+#              #
#    Updated: 2022/07/04 11:07:16 by ide-spir         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = ft_server.c \
	ft_client.c

OBJS = $(SRC:.c=.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: server client

bonus: server client

server: ft_server.o libft
	@$(CC) -o $@ $< -Llibft -lft

client: ft_client.o libft
	@$(CC) -o $@ $< -Llibft -lft

%.o: %.c
	@$(CC) -c $(CFLAGS) $?

libft:
	@make -C libft

clean:
	@rm -f $(OBJS)
	@make -C libft clean

fclean: clean
	@rm -f server client libft/libft.a

re: fclean all

.PHONY: all bonus libft clean fclean re
