# Author: Jared Goodlow
# File: Makefile
# Date: 2025-02-17
# Purpose: Compiles the files in Employee.zip into an executable "employee" program

# Compiler that the Makefile uses
CC = g++

# Target executable that the compiled files get directed to
TARGET = employee

# Compile with all errors and warnings
CFLAGS = -c -Wall -Wextra

# Default target that builds the program
all: $(TARGET)

# Links object files to create the executable
$(TARGET): main.o Employee.o Officer.o Supervisor.o
	$(CC) main.o Employee.o Officer.o Supervisor.o -o $(TARGET)

# Compiles main.o from source (main.cpp)
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) main.cpp

# Compiles employee.o from source (Employee.cpp)
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) Employee.cpp

# Compiles officer.o from source (Officer.cpp)
Officer.o: Officer.cpp Officer.h Employee.h
	$(CC) $(CFLAGS) Officer.cpp

# Compiles supervisor.o from source (Supervisor.cpp)
Supervisor.o: Supervisor.cpp Supervisor.h Employee.h
	$(CC) $(CFLAGS) Supervisor.cpp

# Cleans and removes all objects, Emacs backups, and the target
clean:
	rm -f *.o *~ $(TARGET)
