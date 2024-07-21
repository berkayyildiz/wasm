CXXFLAGS := -Wall -Wextra -std=c++14

output: main.o
		g++ main.o -o output

main: main.cpp
		g++ -c main.cpp

clean: 
		rm *.o output

run: 
		clear
		make
		./output