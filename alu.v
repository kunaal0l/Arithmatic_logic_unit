`timescale 1ns / 1ps
// this is behavioral code for alu 
//opcode tells us which operation needs to perform by the alu  
module alu_behavioral(opcode,a,b,x,y);
input [7:0]a,b;
input opcode;
output reg [7:0]x,y;
always @(opcode,a,b)
    begin
     x=8'b0;
     y=8'b0;//initialisation
     case(opcode)
        4'b0000:x[0]=&a;
        4'b0001:x[0]=^a;
        4'b0010:x[0]=|a;
        4'b0011:x=a&b;
        4'b0100:x=a|b;
        4'b0101:x=a^b;
        4'b0110:x=a>b;
        4'b0111:x=a<b;
        4'b1000:x[0]=!a;
        4'b1001:x[0]=a==b;
        4'b1010:{y[0],x}=a+b;
        4'b1011:{x}=a-b;
        4'b1100:{y,x}=a>>b;
        4'b1101:{y,x}=a<<b;
        4'b1110:{y,x}=a*b;
        4'b1111:x=~a;
        default:$display("opcode is not correct");
     endcase
    end
endmodule

