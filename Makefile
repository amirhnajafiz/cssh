# compiler
CC = gcc

# compiler flags
CFLAGS = -Wall -g -Iinclude

# source files
SRCS_SERVER = src/server.c src/handler.c include/panic.c
SRCS_CLIENT = src/client.c

# object files
OBJS_SERVER = $(SRCS_SERVER:.c=.o)
OBJS_CLIENT = $(SRCS_CLIENT:.c=.o)

# output directories
BIN_DIR = bin
BUILD_DIR = build

# build targets
all: $(BIN_DIR)/server $(BIN_DIR)/client

$(BIN_DIR)/server: $(OBJS_SERVER)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/server $(OBJS_SERVER)

$(BIN_DIR)/client: $(OBJS_CLIENT)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/client $(OBJS_CLIENT)

# compile source files into object files
$(BUILD_DIR)/%.o: src/%.c
	mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# clean up build files
clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)
	rm src/*.o include/*.o
