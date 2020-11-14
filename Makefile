NAME = ft_select

CC = gcc
FLAGS = -Wall -Werror -Wextra

LIBRARIES = -lft -L$(LIBFT_DIR)
INCLUDES = -I$(HEADERS_DIR) -I$(LIBFT_HEADERS)

LIBFT = $(LIBFT_DIR)libft.a
LIBFT_DIR = ./libft/
LIBFT_HEADERS = $(LIBFT_DIR)includes/

HEADERS_LIST = ft_select.h
HEADERS_DIR = ./includes/
HEADERS = $(addprefix $(HEADERS_DIR), $(HEADERS_LIST))

SRC_DIR = sources/
SRC_LIST =	main.c \

SRC = $(addprefix $(SRC_DIR), $(SRC_LIST))

OBJ_DIR = objects/
OBJ_LIST = $(patsubst %.c, %.o, $(SRC_LIST))
OBJ	= $(addprefix $(OBJ_DIR), $(OBJ_LIST))

# COLORS

GRN = \033[0;32m
RED = \033[0;31m
YEL = \033[1;33m
END = \033[0m

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(LIBFT) $(OBJ_DIR) $(OBJ)
	@$(CC) $(FLAGS) $(LIBRARIES) $(INCLUDES) $(OBJ) -o $(NAME)
	@echo "\n$(NAME): $(GRN)$(NAME) object files were created$(RESET)"
	@echo "$(NAME): $(GRN)$(NAME) was created$(RESET)"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)
	@echo "$(NAME): $(GRN)$(OBJ_DIR) created$(END)"

$(OBJ_DIR)%.o : $(SRC_DIR)%.c $(HEADERS)
	@$(CC) $(FLAGS) -c $(INCLUDES) $< -o $@
	@echo "$(GRN).$(END)\c"

$(LIBFT):
	@echo "$(GRN)Creating $(LIBFT)...$(END)"
	@$(MAKE) -C $(LIBFT_DIR)

clean:
	@$(MAKE) -C $(LIBFT_DIR) clean
	@rm -rf $(OBJ_DIR)
	@echo "$(NAME): $(RED)$(OBJ_DIR) deleted$(END)"
	@echo "$(NAME): $(RED)*.o files deleted$(END)"

fclean: clean
	@$(MAKE) -C $(LIBFT_DIR) fclean
	@rm -f $(NAME)
	@echo "$(NAME): $(RED)$(NAME) deleted$(END)"

re:
	@$(MAKE) fclean
	@$(MAKE) all

