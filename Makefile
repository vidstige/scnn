SRC := .
OBJ := obj

SOURCES := $(wildcard $(SRC)/*.c)
OBJECTS := $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SOURCES))

mininn: $(OBJECTS)
	$(CC) $^ -o $@ -lm

$(OBJ):
	mkdir -p $(OBJ)

$(OBJ)/%.o: $(SRC)/%.c $(OBJ)
	$(CC) -Wall -I$(SRC) -c $< -o $@

clean:
	rm $(OBJECTS) mininn

