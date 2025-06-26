`timescale 1ns / 1ps
module alu_behavioral_tb;

  reg [7:0] a, b;
  reg [3:0] opcode;
  wire [7:0] x, y;

  alu_behavioral uut (
    .opcode(opcode),
    .a(a),
    .b(b),
    .x(x),
    .y(y)
  );

  initial begin
    $display("Time\tOpcode\tA\tB\tX\tY");
    $monitor("%0t\t%b\t%h\t%h\t%h\t%h", $time, opcode, a, b, x, y);

    a = 8'h0A; b = 8'h05;

    opcode = 4'b0000; #10;
    opcode = 4'b0001; #10;
    opcode = 4'b0010; #10;
    opcode = 4'b0011; #10;
    opcode = 4'b0100; #10;
    opcode = 4'b0101; #10;
    opcode = 4'b0110; #10;
    opcode = 4'b0111; #10;
    opcode = 4'b1000; #10;
    opcode = 4'b1001; #10;
    opcode = 4'b1010; #10;
    opcode = 4'b1011; #10;
    opcode = 4'b1100; #10;
    opcode = 4'b1101; #10;
    opcode = 4'b1110; #10;
    opcode = 4'b1111; #10;

    opcode = 4'b1111; a = 8'hFF; b = 8'h00; #10;

    $finish;
  end

endmodule
