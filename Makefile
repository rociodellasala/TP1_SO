APPLICATION=application
SOURCES_APPLICATION=application.c

SLAVE=slave
SOURCES_SLAVE=slave.c

QUEUE=queue.o
SOURCES_QUEUE=queue.c

VIEW=view
SOURCES_VIEW=view.c

GCC=gcc

all: $(APPLICATION) $(SLAVE) $(VIEW)

$(SLAVE): $(SOURCES_SLAVE) $(QUEUE)
	$(GCC) $(SOURCES_SLAVE) $(QUEUE) -o $(SLAVE)

$(APPLICATION): $(SOURCES_APPLICATION) $(QUEUE) 
	$(GCC) $(SOURCES_APPLICATION) $(QUEUE) -o $(APPLICATION)

$(QUEUE): $(SOURCES_QUEUE)
	$(GCC) -c $(SOURCES_QUEUE)

$(VIEW): $(SOURCES_VIEW)  
	$(GCC) -c $(SOURCES_VIEW) -o $(VIEW)

clean:
	rm -rf *.o $(APPLICATION) $(SLAVE) $(VIEW)

.PHONY: all clean print debug