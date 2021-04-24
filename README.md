# 2 Stage pipelined MIPS32 Processor

## Loay Rashid

Implementation of a 2 stage MIPS processor, with different modules for fetch, ALU, decode, execute units. The
processor must be able to execute a given set of MIPS32 instructions.

## ARCHITECTURAL DESIGN:

1. ALU UNIT: Performs basic arithmetic and logic ops like add, xor, greater than, etc.
1. DECODE UNIT: Decodes the current instruction to get control signals (ALU_Ctr, mem_to_reg, etc)
1. FETCH UNIT: Update PC register depending on current instruction (PC increment by 4 or PC update for
branch/jump).
1. EXECUTE UNIT: Executes instruction, updates all registers once ALU is done.

## MAIN MEMORY UNIT:

Memory realized using 2-D arrays in verilog. The architecture used is Harvard Architecture (good for embedded systems).

#### DATA MEMORY:
- Little Endian
- Word Based (32 bits)
- 32x32 bits.

#### INSTRUCTION MEMORY:
- Byte based (8 bits)
- 128x8 bits.

#### REGISTERS:
- MIPS32 has 32 32bit registers on the processor
- 32x32 bits.

### SUPPORTED INSTRUCTIONS:
- ADD
- AND
- NOR
- OR
- SUB
- XOR
- SLT
- SLTU
- SLL
- SLLV
- SRA
- SRAV
- SRL
- SRLV
- ADDI
- ANDI
- SLTI
- SLTIU
- ORI
- XORI
- BGTZ
- BLEZ
- BNE
- LW
- SW
- BEQ
- J
- JAL

### UNSUPPORTED MIP32 INSTRUCTIONS:

- TLBP
- TLT
- WAIT
- PREFE
- PREF
- PAUSE
- MOVF
- DIV
- MULT
- REM
- MOD
- NAND
- BGT
- LB
- LH
- SB
- SH
- TRAP
- MLTO
- MTHI
- MLFO
- JALR
- BAL
- EXT
- LBE
- LBU

## PROS:

● 2 stage pipelined architecture for higher throughput.
● Not too many changes required to add more MIPS32 instructions.
● Processor has a branch delay slot, can add independent instructions instead of NOOP.
● Can efficiently execute conditional/iterative statements.
● Processor Clock Frequency: 100 Mhz

## CONS:

● Clock frequency can be reduced further by more efficient implementation+more pipelining
● Code is not modular, all modules (ALU, Control Unit, Fetch, etc) are in the same verilog file.
● Lower throughput due to branch delay slot.
● Cannot cleanly load instructions into the memory, need to change verilog code for that.
● Large number of MIPS32 instructions not implemented.
