# ALU Behavioral Model

## Overview

This is an 8-bit Arithmetic Logic Unit (ALU) implemented using Verilog behavioral modeling. The ALU performs various arithmetic and logical operations based on a 4-bit opcode input.

## Design Approach

The ALU uses a **combinational design** with a `case` statement to decode the 4-bit opcode and execute the corresponding operation. All operations complete in a single clock cycle. The design initializes both output registers (`x` and `y`) to zero at the beginning of each operation, then performs the selected operation based on the opcode.

**Key Design Features:**
- Behavioral modeling for easy understanding and modification
- Combinational logic (no clock required)
- 16 different operations (4-bit opcode = 2^4 possibilities)
- Dual output design: primary result (`x`) and secondary result (`y`) for overflow/carry

## Ports

| Port | Type | Width | Description |
|------|------|-------|-------------|
| `opcode` | Input | 4-bit | Operation selector |
| `a`, `b` | Input | 8-bit | Input operands |
| `x` | Output | 8-bit | Primary result |
| `y` | Output | 8-bit | Secondary result/carry/overflow |

## Opcode Reference

| Opcode | Operation | Description | Result |
|--------|-----------|-------------|---------|
| `0000` | AND Reduction | AND all bits of A | Single bit in `x[0]` |
| `0001` | XOR Reduction | XOR all bits of A | Single bit in `x[0]` |
| `0010` | OR Reduction | OR all bits of A | Single bit in `x[0]` |
| `0011` | Bitwise AND | A & B | 8-bit result in `x` |
| `0100` | Bitwise OR | A \| B | 8-bit result in `x` |
| `0101` | Bitwise XOR | A ^ B | 8-bit result in `x` |
| `0110` | Greater Than | A > B | Comparison result in `x` |
| `0111` | Less Than | A < B | Comparison result in `x` |
| `1000` | Logical NOT | !A | Single bit in `x[0]` |
| `1001` | Equality | A == B | Single bit in `x[0]` |
| `1010` | Addition | A + B | 9-bit result: carry in `y[0]`, sum in `x` |
| `1011` | Subtraction | A - B | 8-bit result in `x` |
| `1100` | Right Shift | A >> B | 16-bit result: `{y,x}` |
| `1101` | Left Shift | A << B | 16-bit result: `{y,x}` |
| `1110` | Multiplication | A * B | 16-bit result: `{y,x}` |
| `1111` | Bitwise NOT | ~A | 8-bit result in `x` |

## Output Usage Strategy

The ALU uses a smart output allocation strategy:
- **Single-bit results**: Stored in `x[0]` (reduction and logical operations)
- **8-bit results**: Stored in `x` (bitwise and comparison operations)
- **9-bit results**: Lower 8 bits in `x`, carry/overflow in `y[0]` (addition)
- **16-bit results**: Lower 8 bits in `x`, upper 8 bits in `y` (multiplication, shifts)

## Discussion

Have ideas for improving this ALU design? Found any issues or optimizations? 

**Open a GitHub Issue or Pull Request to discuss:**
- Additional operations you'd like to see
- Performance optimizations
- Bug fixes or design improvements
- Alternative implementation approaches
- Testing strategies and edge cases

Your contributions and suggestions are welcome!
