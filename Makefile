RM			= rm -f
MKDIR		= mkdir -p

SOURCES		= $(shell find src -type f -iname "*.s" -o -iname "*.c")
OBJECTS		= $(patsubst src/%.c,out/%.o,$(patsubst src/%.s,out/%.o,$(SOURCES)))

TARGET		= ./out/nesbin

AS			= ca65
ASFLAGS		= 

CC			= cc65
CFLAGS		= 

LD			= ld65
LDFLAGS		= 

FCEUX		= fceux

all: nesbin

clean:
	echo "$(OBJECTS)"
	$(RM) $(TARGET) $(OBJECTS)

nesbin: $(OBJECTS)
	$(LD) -o $(TARGET) $^ $(LDFLAGS)

out/%.o: src/%.c | src/%.s | create_dirs
	$(CC) $(CFLAGS) -c $^ -o $@ $(LDFLAGS)

create_dirs:
	@$(MKDIR) $(sort $(dir $(OBJECTS)))

test:
	$(FCEUX) $(TARGET)
