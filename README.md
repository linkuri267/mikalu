# mikalu
verilog alu!


Hierarchy:

-   alu_top.v
    

-   alu_fsm.v
    
-   alu_combinational.v
    
-   binary_to_bcd.v
    
-   seven_seg.v
    

  

alu_fsm.v:

-   State machine that handles instruction input. It has an internal counter that counts from 0 to 3. On posedge of instr_load_en, the module stores the current value of instr_in in a temporary register and sets an instruction load flag to 1. In the state machine, if it sees flag == 1, it loads the bit in the temporary register to instruction[counter] and increments counter. Once counter reaches 3, a done flag is sent and this flag is seen by the top file.
    

alu_combinational.v

-   A purely combinational unit. We used a case statement with Verilog operators to create output. NOP will show ALL ZEROES.
    

binary_to_bcd.v

-   State machine that handles conversion from binary to BCD. The algorithm is from [https://pubweb.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html](https://pubweb.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html). We keep shifting bits from the right side of INPUT to the left side of a ONES register. We shift from left side of ONES register to right side of TENS register. At every shift, we check if the value in each register is > 8. If so we add 3. Raises a DONE flag when conversion is complete.
    

seven_seg

-   This module contains a slow clock. The system clock is 100Mhz and we want the refresh rate to be around 15ms. We used the upper 2 bits of a 20 bit counter for ANODE select. We used a case statement and the BCD data from binary_to_bcd module to determine which cathodes to turn active LOW for each ANODE.
