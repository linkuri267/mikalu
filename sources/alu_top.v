`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 12:19:05 PM
// Design Name: 
// Module Name: alu_top
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


module alu_top(
    input clk,
    //DEBOUNCE FOLLOWING:
    input instr_load_en,
    input instruction_in,
    input reset_instr,
    input reset_all,
    //STOP
    input [5:0] A,
    input [5:0] B,
    output [6:0] SEG,
    output [7:0] AN,
    output DP,
    output [11:0] bcd_result 
    );
    
    //inputs coming from FSM
    wire done_input; //flag set by fsm when user is done inputting instruction
    wire [3:0] instruction; //when done_input is set, this instruction is valid
    //end inputs 
    
    reg [3:0] instruction_reg_valid;
    reg [5:0] A_reg;
    reg [5:0] B_reg;
    reg start_conversion;
    wire [11:0] result_wire;
    wire [11:0] result_wire_bcd; //output from binary_to_bcd fsm
    
    assign bcd_result = result_wire_bcd;
 
    //if instruction is valid, load A and B into registers on posedge clk
    always @(posedge clk or posedge reset_all or posedge reset_instr) begin
        if(reset_all) begin
           A_reg <= 6'b0;
           B_reg <= 6'b0; 
           instruction_reg_valid <= 4'b0011;
           start_conversion <= 1'b0;
        end
        else if(~reset_instr) begin
           instruction_reg_valid <= 4'b0011;
           start_conversion <= 1'b0;
        end
        else begin
            if(done_input) begin
                A_reg <= A;
                B_reg <= B;
                instruction_reg_valid <= instruction;
                start_conversion <= 1'b1;
            end
            else begin
                start_conversion <= 1'b0;
            end
        end
    end

    
    alu_fsm fsm(.clk(clk), 
                .reset_all(reset_all),
                .reset_instr(~reset_instr),
                .instr_load_en(instr_load_en),
                .instruction_in(instruction_in),
                .done_input(done_input),
                .instruction(instruction));
                
    alu_combinational combinational_unit(.instruction(instruction_reg_valid),
                      .A(A_reg),
                      .B(B_reg),
                      .result(result_wire));
    wire reset_conversion;
    assign reset_conversion = reset_all || ~reset_instr;
    reg ack_top;
    
    binary_to_bcd coverter(.clk(clk),
                           .start(start_conversion),
                           .reset(reset_conversion),
                           .binary(result_wire),
                           .ack(ack_top),
                           .bcd(result_wire_bcd),
                           .done(done_conversion));
                           
   reg [11:0] valid_bcd;
   
   always @(posedge clk, posedge reset_all, negedge reset_instr) begin
    if(reset_all) begin
        valid_bcd <= 12'b0;
    end
    else if(!reset_instr) begin
        valid_bcd <= 12'b0;
    end
    else begin
        if(done_conversion) begin
            valid_bcd <= result_wire_bcd;
            ack_top <= 1'b1;
        end
        else begin
            ack_top <= 1'b0;
        end
    end
   end
                           
                           
    seven_seg decoder(.clk(clk),
                      .bcd(valid_bcd),
                      .reset(reset_conversion),
                      .an(AN),
                      .c(SEG),
                      .dp(DP));      
                      


endmodule
