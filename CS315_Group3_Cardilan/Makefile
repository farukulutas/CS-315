all:
	lex lex.l
	gcc -o out lex.yy.c
clean:
	rm lex.yy.c
	rm out
test:
	lex lex.l
	gcc -o out lex.yy.c
	./out < a.cl
	rm lex.yy.c
	rm out


