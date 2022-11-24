#include "verilated.h"
#include "verilated_vcd_c.h"
#include "Vtop.h"

#define MAX_SIM_CYC 100
#define ADDRESS_WIDTH 8
#define ROM_SZ 256

int main(int argc, char **argv, char **env) {
  int cycle;     // simulation clock count
  int tick;       // each clk cycle has two ticks for two edges

  Verilated::commandArgs(argc, argv);
  auto top = new Vtop;
  Verilated::traceEverOn(true);
  auto tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("top.vcd");
 
  top->clk = 0;
  top->rst = 1;
  top->PCsrc = 0;
  top->ImmOp = 0;

  // run simulation for MAX_SIM_CYC clock cycles
  for (cycle=0; cycle<MAX_SIM_CYC; cycle++) {

    top->ImmOp = 5;
    top->PCsrc = (cycle==10||cycle==15);
    top->rst = cycle==0 || (cycle==30);
    
    // dump variables into VCD file and toggle clock
    for (tick=0; tick<2; tick++) {
      top->clk = !top->clk;
      top->eval ();
      tfp->dump (2*cycle+tick);
    }

    // vbdCycle(cycle); //display cycle

    // // either simulation finished, or 'q' is pressed
    // if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
    //   exit(0);                // ... exit if finish OR 'q' pressed
  }

  // vbdClose();     // ++++
  tfp->close(); 
  exit(0);
}