SRC=src

main:
	bison -d $(SRC)/bison.y -o $(SRC)/bison.cpp
	flex -o $(SRC)/flex.cpp $(SRC)/flex.l
	g++ $(SRC)/flex.cpp $(SRC)/bison.cpp -lfl -o out
