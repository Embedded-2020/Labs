all: dijkstra_init dijkstra_ddtr

dijkstra_init: dijkstra_init.c
	gcc dijkstra_init.c -o dijkstra_init -pthread -lcdsl -L./../synch_implementations -I./../synch_implementations

dijkstra_ddtr: dijkstra_ddtr.c
	gcc dijkstra_ddtr.c -o dijkstra_ddtr -pthread -lcdsl -L./../synch_implementations -I./../synch_implementations

clean:
	rm -f dijkstra_ddtr dijkstra_init