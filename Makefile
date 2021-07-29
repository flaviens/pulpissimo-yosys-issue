.PHONY: yosys
yosys: build/sv2v_out.v
	yosys -s yosys.ys -l build/yosys.log

.PHONY: sv2v
sv2v: build/sv2v_out.v
build/sv2v_out.v: soc_domain.sv | build
	sv2v $< > $@
# verilator -cc $< -Wall -Wno-fatal -Wno-BLKANDNBLK -Wno-BLKLOOPINIT -CFLAGS "-std=c++11 -Wall -DTOPLEVEL_NAME=soc_domain -g -O0" --top-module soc_domain

build:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf build
