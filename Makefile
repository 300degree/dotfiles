CC = g++
CFLAGS = -std=c++17 -Iinclude
TARGET = setup-dotfiles

all: clean $(TARGET)

$(TARGET): main.cpp
	$(CC) $(CFLAGS) main.cpp -lpthread -o $@

clean:
	rm -f $(TARGET) *.o *.out