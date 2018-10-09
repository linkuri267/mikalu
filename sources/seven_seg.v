`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2018 06:25:28 PM
// Design Name: 
// Module Name: seven_seg
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


module seven_seg(
    input clk,
    input [11:0] bcd,
    input reset,
    output [7:0] an,
    output [6:0] c,
    output dp
    );
    
    reg [19:0] counter;
    wire [1:0] led_activate;
    reg [7:0] anode_activate;
    reg [3:0] value_to_display;
    reg [6:0] cathodes;
    
    assign c = cathodes;
    assign an = anode_activate;
    assign dp = 1'b1;
    
    //assign led_activate = counter[6:5];
    assign led_activate = counter[19:17];
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            counter <= 20'b0;
        end
        else begin
            counter <= counter + 1;
        end
    end
    
    always @(*) begin
        case(led_activate)
            3'b000: begin
                anode_activate = 8'b11110111;
                value_to_display = 4'b0000;
            end
            3'b001: begin
                anode_activate = 8'b11111011;
                value_to_display = bcd[11:8];
            end
            3'b010: begin
                anode_activate = 8'b11111101;
                value_to_display = bcd[7:4];
            end
            3'b011: begin
                anode_activate = 8'b11111110;
                value_to_display = bcd[3:0];
            end
            3'b100: begin
                anode_activate = 8'b11101111;
                value_to_display = 4'b0000;
            end
            3'b101: begin
                anode_activate = 8'b11011111;
                value_to_display = 4'b0000;
            end
            3'b110: begin
                anode_activate = 8'b10111111;
                value_to_display = 4'b0000;
            end
            3'b111: begin
                anode_activate = 8'b01111111;
                value_to_display = 4'b0000;
            end
            
        endcase
    end
    
    always @(*) begin
        case(value_to_display) 
            4'b0000: begin
                cathodes = 7'b1000000;
            end
            4'b0001: begin
                cathodes = 7'b1111001;
            end
            4'b0010: begin
                cathodes = 7'b0100100;
            end
            4'b0011: begin
                cathodes = 7'b0110000;
            end
            4'b0100: begin
                cathodes = 7'b0011001;
            end
            4'b0101: begin
                cathodes = 7'b0010010;
            end
            4'b0110: begin
                cathodes = 7'b0000010;
            end
            4'b0111: begin
                cathodes = 7'b1111000;
            end
            4'b1000: begin
                cathodes = 7'b0000000;
            end
            4'b1001: begin
                cathodes = 7'b0010000;
            end
            default: begin
                cathodes = 7'b1000000;
            end
        endcase
    end
    
    
    
endmodule
