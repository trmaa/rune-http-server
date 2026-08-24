src = $(wildcard src/*.rn)
obj = $(src:src/%.rn=obj/%.o)

.PHONY: clean all

all: serve

serve: $(obj)
	cc -m32 -no-pie -o $@ $^

obj/%.o: src/%.rn | obj
	rc -c $<
	mv $(patsubst %.rn,%.o,$<) $@

obj:
	mkdir -p obj

clean:
	rm -rf obj
	rm -f serve
