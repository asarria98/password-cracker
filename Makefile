HASH_WORD=hola
HASH_TO_CRACK="b221d9dbb083a7f33428d7c2a3c3198ae925614d70210e28716ccaa7cd4ddb79" # hola
# HASH_TO_CRACK="a10335a2644cd19e4af502cb5abe0d85c3878caff3449f8fe206b556d490d6b4" # tetris

BASE_DICT="abcdefghijklmnopqrstuvwxyz"
MEDIUM_DICT="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
BIG_DICT="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

help:
	@echo "Lista de comandos disponibles"	
	@echo "    help: Muestra el menu de ayuda del proyecto"
	@echo "    compile: Compila el codigo del proyecto"
	@echo "    hash: Lanza el hash sobre la cadena en la variable HASH_WORD"
	@echo "    crack-seq: Lanza el crack sobe el hash de 'hola'"

compile:
	mkdir -p out
	gcc src/hash.c 			src/utils.c -o out/hasher -lcrypto -Wno-deprecated-declarations
	gcc src/crack.c 		src/utils.c -o out/cracker -lcrypto -Wno-deprecated-declarations
	gcc src/crack-openmp.c 	src/utils.c -o out/cracker-openmp -lcrypto -Wno-deprecated-declarations -fopenmp
	mpicc src/crack-mpi.c 	src/utils.c -o out/cracker-mpi -lcrypto -Wno-deprecated-declarations

hash:
	./out/hasher $(HASH_WORD)

crack-seq:
	./out/cracker $(BASE_DICT) $(HASH_TO_CRACK)

crack-openmp:
	./out/cracker $(BASE_DICT) $(HASH_TO_CRACK) 

crack-mpi:
	mpirun -np 4 ./out/cracker-mpi $(BASE_DICT) $(HASH_TO_CRACK)
