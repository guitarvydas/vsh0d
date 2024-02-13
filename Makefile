LIBSRC=0D/odin/std
ODIN_FLAGS ?= -debug -o:none
D2J=0d/das2json/das2json

run: vsh0d transpile.drawio.json
	./vsh0d ! main vsh0d.drawio $(LIBSRC)/transpile.drawio

vsh0d: vsh0d.drawio.json
	odin build . $(ODIN_FLAGS)

vsh0d.drawio.json: vsh0d.drawio transpile.drawio.json
	$(D2J) vsh0d.drawio

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf vsh0d vsh0d.dSYM *~ *.json
