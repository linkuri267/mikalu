`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 01:18:30 PM
// Design Name: 
// Module Name: alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_tb;

    reg clk;
    reg instr_load_en;
    reg instruction_in;
    reg reset_instr;
    reg reset_all;
    reg [5:0] A;
    reg [5:0] B;
    wire [11:0] result;
    
    
    parameter CLK_PERIOD=100;
    alu_top ee454_alu(.clk(clk),
                      .instr_load_en(instr_load_en),
                      .instruction_in(instruction_in),
                      .reset_instr(reset_instr),
                      .reset_all(reset_all),
                      .A(A),
                      .B(B),
                      .bcd_result(result));
                      
                      
    task do_test_instruction;
        input [3:0] test_instruction;
        begin
            #(CLK_PERIOD*10)
            instruction_in = test_instruction[0];
            instr_load_en = 1;
            #(CLK_PERIOD*10)
            instr_load_en = 0;
            #(CLK_PERIOD*10)
            instruction_in = test_instruction[1];
            instr_load_en = 1;
            #(CLK_PERIOD*10)
            instr_load_en = 0;
            #(CLK_PERIOD*10)
            instruction_in = test_instruction[2];
            instr_load_en = 1;
            #(CLK_PERIOD*10)
            instr_load_en = 0;
            #(CLK_PERIOD*10)
            instruction_in = test_instruction[3];
            instr_load_en = 1;
            #(CLK_PERIOD*10)
            instr_load_en = 0;
        end
    endtask
    
    task do_reset_instruction;
    begin
        #(CLK_PERIOD*30)
        reset_instr = 0;
        #(CLK_PERIOD*30)
        reset_instr = 1;
    end
    endtask
    
    task do_reset_all;
    begin
        #(CLK_PERIOD*30)
        reset_all = 1;
        #(CLK_PERIOD*30)
        reset_all = 0;
    end
    endtask
    
        
    initial begin clk = 0; end
    always begin #10; clk = ~clk; end
    
    initial begin
    reset_all = 1;
    A = 6'b010101;
    B = 6'b010001;
    instr_load_en = 0;
    #(CLK_PERIOD*10)
    reset_all = 0;
    reset_instr = 1;
  
    
    //ADD 
    do_test_instruction(4'b1000);
    //reset instruction
    do_reset_instruction();
    //SUBTRACT
    do_test_instruction(4'b1001);
    //reset all
    do_reset_all();
    //MODULUS
    do_test_instruction(4'b1010);
    //reset instruction
    do_reset_instruction();
    //MULTIPLY
    do_test_instruction(4'b1011);
    //reset instruction
    do_reset_instruction();
    //DIVIDE
    do_test_instruction(4'b1100);
    //reset instruction
    do_reset_instruction();
    //NOT
    do_test_instruction(4'b1101);
    //reset instruction
    do_reset_instruction();
    //AND
    do_test_instruction(4'b1110);
    //reset instruction
    do_reset_instruction();
    //OR
    do_test_instruction(4'b1111);
    //reset instruction
    do_reset_instruction();
    //XOR
    do_test_instruction(4'b0000);
    //reset instruction
    do_reset_instruction();
    //SL
    do_test_instruction(4'b0010);
    //reset instruction
    do_reset_instruction();
    //SR
    do_test_instruction(4'b0001);
    //reset instruction
    do_reset_instruction();
    //SUBTRACT
    do_test_instruction(4'b0011);
    //reset all
    do_reset_all();

    
    
   
    
    end
    


endmodule
