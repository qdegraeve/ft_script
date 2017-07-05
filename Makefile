# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdegraev <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/06/02 19:09:44 by qdegraev          #+#    #+#              #
#    Updated: 2017/07/05 15:20:33 by qdegraev         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= ft_script

FLAGS= -Wall -Wextra -Werror
CC= clang
INCLUDES= includes/

VPATH= srcs/
SRCS= \
	  malloc.c \
	  calloc.c \
	  free.c \
	  realloc.c \
	  show_alloc_mem.c \
	  zone_tools.c \
	  debug.c \
	  norme.c

OBJDIR= objs/
OBJS= $(patsubst %.c, $(OBJDIR)%.o, $(SRCS))

default: all

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS)

$(OBJDIR)%.o: %.c $(OBJDIR)
	$(CC) $(FLAGS) -I $(INCLUDES) -o $@ -c $<

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME) libft_malloc.so

re: fclean all

.PHONY: re clean fclean all
