`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2018 05:51:11 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(
    input clk,
    input start,
    input reset,
    input ack,
    input [11:0] binary,
    output [11:0] bcd,
    output done
    );
    
    reg doneReg;
    assign done = doneReg;
   
    localparam
    I = 4'b0001, B2BCD = 4'b0010, SHIFT = 4'b0100, DONE = 4'b1000;

    reg [3:0] state;
    reg [11:0] bcd_reg; 
    assign bcd = bcd_reg;
    
    //for calcuating BCD from binary
    reg [3:0] Hundreds;
    reg [3:0] Tens;
    reg [3:0] Ones;
    reg [3:0] count;
    
    always @(posedge clk or posedge reset) begin
            if (reset) begin
                state <= I;
                bcd_reg[11:0] <= 16'b0000000000000000;
                Hundreds <= 4'b0000;
                Tens <= 4'b0000;
                Ones <= 4'b0000;
                doneReg <= 1'b0;
            end
            else begin
                case(state)
                I:
                begin
                    //NSL
                    if(start) begin
                        state <= B2BCD;
                    end
    
                    //RTL
                    bcd_reg[11:0] <= 16'b0000000000000000;
                    Ones[3:0] <= 4'd0;
                    Tens[3:0] <= 4'd0;
                    Hundreds[3:0] <= 4'd0;
                    doneReg <= 1'b0;
                    count <= 4'd11;
                end
                B2BCD:
                begin
                    //NSL
                    state <= SHIFT;
                
                    //RTL
                    //Algorithm taken from https://pubweb.eng.utah.edu/~nmcdonal/Tutorials/BCDTutorial/BCDConversion.html
                    if(Hundreds >= 4'd5) begin
                        Hundreds <= Hundreds  + 4'b0011;
                    end
                    if(Tens >= 4'd5) begin
                        Tens <= Tens  + 4'b0011;
                    end
                    if(Ones >= 4'd5) begin
                        Ones <= Ones  + 4'b0011;
                    end
                    
                    
                    
                end
                SHIFT:
                    begin
                    if(count == 4'd0) begin
                         state <= DONE;
                    end
                    else
                         state <= B2BCD;
    

                    Hundreds[3] <= Hundreds[2];
                    Hundreds[2] <= Hundreds[1];
                    Hundreds[1] <= Hundreds[0];
                    Hundreds[0] <= Tens[3];
                    
                    Tens[3] <= Tens[2];
                    Tens[2] <= Tens[1];
                    Tens[1] <= Tens[0];
                    Tens[0] <= Ones[3];
                    
                    Ones[3] <= Ones[2];
                    Ones[2] <= Ones[1];
                    Ones[1] <= Ones[0];
                    Ones[0] <= binary[count];
                    
                    count <= count - 1;
                    end
                
                DONE:
                begin
                    //NSL
                    state <= I;
                    //RTL
                    bcd_reg[11:8] <= Hundreds[3:0];
                    bcd_reg[7:4] <= Tens[3:0];
                    bcd_reg[3:0] <= Ones[3:0];
    
                    doneReg <= 1'b1;
                    if(ack) begin
                        state <= I;
                    end
              
                end
                
                endcase
            end
        end
endmodule
