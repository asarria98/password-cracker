help:
	@echo "Lista de comandos disponibles"	
	@echo "    help: Muestra el menu de ayuda del proyecto"
	@echo "    compile: Compila el codigo del proyecto"
	@echo "    hash-hola: Lanza el hash sobre la cadena 'hola'"
	@echo "    crack-hola: Lanza el crack sobe el hash de 'hola'"

compile:
	mkdir -p out
	gcc src/hash.c src/utils.c -o out/hasher -lcrypto -Wno-deprecated-declarations
	gcc src/crack.c src/utils.c -o out/cracker -lcrypto -Wno-deprecated-declarations
	gcc src/crack-openmp.c src/utils.c -o out/cracker-openmp -lcrypto -Wno-deprecated-declarations -fopenmp

hash-hola:
	./out/hasher hola

crack-hola:
	./out/cracker "abcdefghijklmnopqrstuvwxyz" "b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79"

