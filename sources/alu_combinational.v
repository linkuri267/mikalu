`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 12:19:05 PM
// Design Name: 
// Module Name: alu_combinational
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


module alu_combinational(
    input [3:0] instruction,
    input [5:0] A,
    input [5:0] B,
    output [11:0] result
    );
    
    reg [11:0] result_reg;
    assign result = result_reg;

    localparam ADD = 4'b1000;
    localparam SUBTRACT = 4'b1001;
    localparam MODULUS = 4'b1010;
    localparam MULTIPLY = 4'b1011;
    localparam DIVIDE = 4'b1100;
    localparam NOT = 4'b1101;
    localparam AND = 4'b1110;
    localparam OR = 4'b1111;
    localparam XOR = 4'b0000;
    localparam SHIFT_LEFT = 4'b0010;
    localparam SHIFT_RIGHT = 4'b0001;
    
    always @(A or B or instruction) begin
        case(instruction) 
            ADD: begin
                result_reg = A + B;
            end
            SUBTRACT: begin
                result_reg = A - B;
            end
            MODULUS: begin
                result_reg = A % B;
            end 
            MULTIPLY: begin
                result_reg = A * B;
            end
            DIVIDE: begin
                result_reg = A / B;
            end
            NOT: begin
                result_reg [5:0] = ~A;
                result_reg [11:6] = 6'b000000;
            end
            AND: begin
                result_reg [5:0] = A & B;
                result_reg [11:6] = 6'b000000;
            end
            OR: begin
                result_reg [5:0] = A | B;
                result_reg [11:6] = 6'b000000;
            end
            XOR: begin
                result_reg [5:0] = A ^ B;
                result_reg [11:6] = 6'b000000;
            end
            SHIFT_LEFT: begin
                result_reg = A << B;
            end
            SHIFT_RIGHT: begin
                result_reg = A >> B;
            end
            default: begin
                result_reg [5:0] = 6'b0;
                result_reg [11:6] = 6'b0;
            end
            
            
            
            
            
        endcase
    end
    
endmodule
