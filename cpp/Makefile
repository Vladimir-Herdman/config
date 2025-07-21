CXX = clang++
CXXFLAGS = -std=c++20 -O2 -Isrc -Wall -Wextra -Wno-bitwise-op-parentheses
CXXMACRODEF = -DEXAMPLE -DEXAMPLE_TWO

# Extremely cool .cpp to .o setup and recipes here for easier src additions
# Great resource over Makefiles: https://makefiletutorial.com/#getting-started
SRC := ${shell find src/ -name '*.cpp'}
OBJ := ${patsubst src/%.cpp,build/%.o,$(SRC)}

all: ${OBJ}
	@mkdir -p ./bin
	@${CXX} ${CXXFLAGS} ${CXXMACRODEF} ${OBJ} -o ./bin/main

# Use different compilers throughout to make sure of less errors, so switch g++
# every once in a while with CXX above
build/%.o: src/%.cpp
	@mkdir -p $(dir $@)
	@${CXX} ${CXXFLAGS} ${CXXMACRODEF} -c $< -o $@

# Here, we have litte make scripts we can use
# 	.PHONY says, hey, this 'file' is always out of date, so always execute
# 	what we have written in here
.PHONY: all clean test run
clean: 
# Here, the 2/dev/null will redirect errors away from stdout, and the '||true'
# section makes it so Make won't show an error if it can't complete
	@echo '    cleaning build/ and bin/ directories...'
	@rm -r build/ bin/ 2>/dev/null || true

test:
	@${CXX} ${CXXFLAGS} test/test.cpp -o bin/test
	@./bin/test

run: all
	@./bin/main

# Notes
# 	@ Before a command makes it silent, so you won't see what's ran
# 	- Before a command makes it keep going even if there's an error
# 	$@ -> refers to item before : in rule, so above build/main
# 		would be a $@
# 	$< -> refers to first item after : in rule, so above src/main.cpp
# 		would be one
