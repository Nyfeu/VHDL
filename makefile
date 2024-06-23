# Define the default VHDL files directory and the testbench entity name
VHDL_DIR ?= and_gate
VHDL_FILES = $(VHDL_DIR)/*.vhd
TESTBENCH = $(VHDL_DIR)_tb
OUTPUT_DIR = $(VHDL_DIR)/output
WAVEFORM = $(OUTPUT_DIR)/$(TESTBENCH).vcd

# Define the commands to be used
GHDL = ghdl
GTKWAVE = gtkwave
RM = del

# Run a testbench
$(WAVEFORM): $(VHDL_FILES)
	$(GHDL) -a --std=08 $^
	$(GHDL) -e --std=08 $(TESTBENCH)
	$(GHDL) -r --std=08 $(TESTBENCH) --vcd=$(WAVEFORM)
	$(RM) work-obj08.cf

# Open the waveform in GTKWave
test: $(WAVEFORM)
	$(GTKWAVE) $(WAVEFORM)

view:
	$(GTKWAVE) $(WAVEFORM)

# Clean up generated files in output directory
clean:
	$(RM) "$(OUTPUT_DIR)\$(TESTBENCH).vcd"