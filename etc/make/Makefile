#Makefile setup modified from from: https://makefiletutorial.com/

#Assumes
#	- src/ has all .c files, and will make build/ and bin/ dirs as needed
#	- clang for compiler
#	- std=c23 and -O3 optimization

#For include and linking:
#	run 'pkgconf --libs <opencv4>' for exact system path -L and -l to use for packages
#	run 'pkgconf --cflags <opencv4>' for exact system path -I to use

#Basically
#	Should work for c and cpp with slight adjustments per project (and SRC_FILETYPE
#	for the specific project, like '.c' or '.cpp'). Replace variables like 'CFLAGS'
#	with CXX variant for cpp: 'CXXFLAGS'.

#Tips (opencv example)
	#Run 'pkg-config --libs opencv4' or 'pkgconf --libs opencv4' for exact -L and all -l to use
	#Run 'pkgconf --cflags opencv4' for exact -I to use

#Windows
#	SRC := $(wildcard src/*.cpp) $(wildcard src/*/*.cpp) $(wildcard src/*/*/*.cpp)
#	@cmd /C "if not exist bin mkdir bin"
#	build/%.o: src/%.cpp
#		@cmd /C "if not exist $(subst /,\,$(dir $@)) mkdir $(subst /,\,$(dir $@))"
#	Clean
#		@cmd /C "if exist build rmdir /S /Q build"
#		@cmd /C "if exist bin rmdir /S /Q bin"

TARGET_EXEC := main
TARGET_DIR := bin
BUILD_DIR := build
SRC_DIRS := src
SRC_FILETYPE := '.c'

SRC := $(shell find $(SRC_DIRS) -name "*$(SRC_FILETYPE)")
OBJS := $(SRC:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))
# -I/opt/homebrew/opt/opencv/include/opencv4

CC := clang
CFLAGS := $(INC_FLAGS) -MMD -MP -std=c23 -O3 -Wall -Wextra -Wpedantic
CDEFS :=
LDFLAGS :=
#-L/opt/homebrew/opt/opencv/lib
LDLIBS :=
#-lopencv_core -lopencv_highgui -lopencv_imgcodecs

#Linking stage, so don't need compile time flags and such, just linker options/additions
#	ansi escape codes for colloring output (yellow-compiling, green-compiled executable)
$(TARGET_DIR)/$(TARGET_EXEC): $(OBJS)
	@mkdir -p $(dir $@)
	@printf '\n  \033[1m\033[38;2;51;204;51mCompiled binary:\033[0m %s\n' $@
	@$(CC) $(OBJS)  -o $(TARGET_DIR)/$(TARGET_EXEC) $(LDFLAGS) $(LDLIBS)

#Compilation stage, so set all compilation options/flags here
$(BUILD_DIR)/%$(SRC_FILETYPE).o: %$(SRC_FILETYPE)
	@mkdir -p $(dir $@)
	@printf '  \033[1m\033[38;2;255;255;0mCompiling:\033[0m %s\n' $@
	@$(CC) $(CFLAGS) $(CDEFS) -c $< -o $@

.PHONY: clean run
clean: 
	@printf '  rm -r %s %s\n' $(BUILD_DIR)/ $(TARGET_DIR)/
	@rm -r build/ bin/ 2>/dev/null || true

run: $(TARGET_DIR)/$(TARGET_EXEC)
	@./$(TARGET_DIR)/$(TARGET_EXEC)

-include $(DEPS)

# Personal Notes
# 	@ Before a command makes it silent, so you won't see what's ran
# 	- Before a command makes it keep going even if there's an error
# 	$@ -> refers to item before : in rule, so above build/main
# 		would be a $@
# 	$< -> refers to first item after : in rule, so above src/main.cpp
# 		would be one

#	For LSP diagnostics and stuff, include a .clangd or
#	compile_flags.txt, also in current dir.
