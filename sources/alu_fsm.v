`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 12:19:05 PM
// Design Name: 
// Module Name: alu_fsm
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


module alu_fsm(
    input clk,
    input reset_all,
    input reset_instr,
    input instr_load_en, //this is asynchronous
    input instruction_in,
    output done_input,
    output [3:0] instruction
    );
    
    //on the posedge of instr_load_en input, look at current instruction_in and store it in a register
    reg load_enable;
    reg load_enable_used;
    reg instruction_in_next;

    reg [3:0] instruction_reg;
    reg done_reg;
    
    assign instruction = instruction_reg;
    assign done_input = done_reg;
    
    reg [3:0] state;
    reg [1:0] counter;
    
    localparam INITIAL = 4'b0001;
    localparam LOADFIRST = 4'b0010;
    localparam LOAD = 4'b0100;
    localparam DONE = 4'b1000;
    
    always @(posedge clk, posedge reset_instr, posedge reset_all, posedge instr_load_en) begin
        if(reset_instr||reset_all) begin
            instruction_reg <= 6'b0;
            done_reg <= 1'b0;
            counter <= 2'b0;
            state <= INITIAL;
            
        end
        else if(instr_load_en) begin
            load_enable <= 1'b1;
            instruction_in_next <= instruction_in;
        end 
        else begin
            case(state) 
                INITIAL: begin
                    instruction_reg <= 6'b0;
                    done_reg <= 1'b0;
                    counter <= 2'b0;
                    
                    if(load_enable) begin
                        state <= LOADFIRST;
                    end
                end
                LOADFIRST: begin
                    if(load_enable) begin
                        instruction_reg[counter] <= instruction_in_next;
                        counter <= counter + 1;
                    end
                        //NSL
                    if(load_enable) begin
                        state <= LOAD;
                        load_enable <= 1'b0;
                    end
                end
                LOAD: begin
                    if(load_enable) begin
                        instruction_reg[counter] <= instruction_in_next;
                        counter <= counter + 1;
                        load_enable <= 1'b0;
                        
                        //NSL
                        if(counter == 2'b11) begin
                            state <= DONE;
                            done_reg <= 1'b1;
                        end
                     end
                end 
                DONE: begin
                    done_reg <= 1'b0;
                end
                endcase
        end
    end
    
endmodule
