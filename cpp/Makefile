#Run 'pkg-config --libs opencv4' or 'pkgconf --libs opencv4' for exact -L and all -l to use
#Run 'pkgconf --cflags opencv4' for exact -I to use

TARGET_EXEC := main
TARGET_DIR := bin
BUILD_DIR := build
SRC_DIRS := src

SRC := $(shell find $(SRC_DIRS) -name '*.cpp')
OBJS := $(SRC:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))
# -I/opt/homebrew/opt/opencv/include/opencv4

CXX := clang++
CXXFLAGS := $(INC_FLAGS) -MMD -MP -std=c++23 -O3 -Wall -Wextra -Wpedantic -Wno-c11-extensions
CXXDEFS :=
LDFLAGS :=
#-L/opt/homebrew/opt/opencv/lib
LDLIBS :=
#-lopencv_core -lopencv_highgui -lopencv_imgcodecs

#ansi escape codes for colloring output (yellow-compiling, green-compiled executable)
$(TARGET_DIR)/$(TARGET_EXEC): $(OBJS)
	@mkdir -p $(dir $@)
	@printf '\n  \033[1m\033[38;2;51;204;51mCompiled binary:\033[0m %s\n' $@
	@$(CXX) $(OBJS)  -o $(TARGET_DIR)/$(TARGET_EXEC) $(LDFLAGS) $(LDLIBS)

$(BUILD_DIR)/%.cpp.o: %.cpp
	@mkdir -p $(dir $@)
	@printf '  \033[1m\033[38;2;255;255;0mCompiling:\033[0m %s\n' $@
	@$(CXX) $(CXXFLAGS) $(CXXDEFS) -c $< -o $@

.PHONY: clean run
clean: 
	@printf '  rm -r %s %s\n' $(BUILD_DIR)/ $(TARGET_DIR)/
	@rm -r build/ bin/ 2>/dev/null || true

run: $(TARGET_DIR)/$(TARGET_EXEC)
	@./$(TARGET_DIR)/$(TARGET_EXEC)

-include $(DEPS)

# Notes
# 	@ Before a command makes it silent, so you won't see what's ran
# 	- Before a command makes it keep going even if there's an error
# 	$@ -> refers to item before : in rule, so above build/main
# 		would be a $@
# 	$< -> refers to first item after : in rule, so above src/main.cpp
# 		would be one
