#Makefile setup modified from from: https://makefiletutorial.com/

#Assumes
#	- src/ has all .c files, and will make build/ and bin/ dirs as needed
#	- clang for compiler
#	- std=c23 and -O3 optimization

TARGET_EXEC := main
TARGET_DIR := bin
BUILD_DIR := build
SRC_DIR := src

SRC := $(shell find $(SRC_DIR) -name '*.c')
OBJS := $(SRC:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

CC := clang
CFLAGS := $(INC_FLAGS) -MMD -MP -std=c23 -O3 -Wall -Wextra
CLINK := -lncurses
LDFLAGS :=
CDEFS :=

$(TARGET_DIR)/$(TARGET_EXEC): $(OBJS)
	@mkdir -p $(dir $@)
	@printf '\n  Compiled binary: %s\n' $@
	@$(CC) $(OBJS)  -o $(TARGET_DIR)/$(TARGET_EXEC) $(LDFLAGS)

$(BUILD_DIR)/%.c.o: %.c
	@mkdir -p $(dir $@)
	@printf '  Compiling: %s\n' $@
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean run
clean: 
	@printf '  rm -r %s %s\n' $(BUILD_DIR)/ $(TARGET_DIR)/
	@rm -r build/ bin/ 2>/dev/null || true

run: 
	@./$(TARGET_DIR)/$(TARGET_EXEC)

-include $(DEPS)
