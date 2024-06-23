# VHDL Repository

This repository contains VHDL code and testbenches using GHDL, GTKWave, and Makefile.

## Repository Structure

```
├── and_gate/
│   ├── and_gate.vhd
│   ├── and_gate_tb.vhd
│   └── output/
|       └── and_gate_tb.vcd   
├── makefile
└── README.md
```

## Dependencies

To run the tests and view the results, you'll need the following tools installed on your system:
- [GHDL](https://github.com/ghdl/ghdl)
- [GTKWave](https://gtkwave.sourceforge.net/)
- [Make](https://www.gnu.org/software/make/)

## Usage

### Default Directory for VHDL Files

The VHDL files should be located in a subdirectory, such as `and_gate/`, and the testbench should follow the naming convention: `<entity_name>_tb.vhd`.

### Makefile

The included Makefile automates the process of compilation, simulation, and result visualization.

#### Variable

- `VHDL_DIR`: directory where the VHDL files are located (default: `and_gate`).

#### Commands

- `make VHDL_DIR=<entity_name> test`: runs the simulation and opens GTKWave to visualize the waveform;
- `make VHDL_DIR=<entity_name> view`: only opens GTKWave to visualize the last generated waveform;
- `make VHDL_DIR=<entity_name> clean`> cleans up the files generated by the simulation.

#### Example

1. Navigate to the project directory;
2. Run the testbench and visualize the waveform:
```
make VHDL_DIR=and_gate test
````
3. View the last generated waveform: 
```
make VHDL_DIR=and_gate view;
```
4. Clean up the generated files: 
```
make VHDL_DIR=and_gate clean.
```

---
