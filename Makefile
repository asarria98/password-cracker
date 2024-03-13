help:
	@echo "Lista de comandos disponibles"	
	@echo "    help: Muestra el menu de ayuda del proyecto"
	@echo "    compile: Compila el codigo del proyecto"
	@echo "    hash-hola: Lanza el hash sobre la cadena 'hola'"
	@echo ""
	
compile:
	mkdir -p out
	gcc src/hash.c src/utils.c -o out/hasher -lcrypto

hash-hola:
	./out/hasher hola