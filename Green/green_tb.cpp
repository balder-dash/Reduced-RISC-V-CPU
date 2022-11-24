#include <verilated.h>
#include <verilated_vcd.h>
#include <Vgreen_top.h>

int main(int argc, char **argv, char **env) {
    int i;
    int clk;

    Verilated:: commandArgs(argc, argv);
    
    Vgreen_top* top = new Vgreen_top;

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp,99);
    tfp->open ("counter.vcd");

    top->clk = 1;
    top->rst = 1;
    top->en = 1;

    for (i = 0; i < 300; i++){

        //dump var into VCD file and toggle clk
        for(clk = 0; clk < 2; clk++){
            tfp->dump(2*i+clk); //unit is in ps
            top->clk = !top->clk;
            top->eval ();
        }
        top->rst = 0;
        
        if (Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}
