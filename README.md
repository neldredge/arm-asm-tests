Some exercises in learning ARM assembly.

Relevant documentation:

- Arm Architecture Reference Manual:
  https://developer.arm.com/documentation/ddi0487/latest

  Documents the full instruction set.  It is extremely long (8000
  pages) but most is irrelevant to us.  Of note:

  - B1.2 (page 107) describes register set

  - C1.2.4 (page 185) lists condition codes for conditional branch,
    etc (`B.EQ`, `B.LT`, etc)

  - C1.3 (page 189) describes addressing modes

  - C3.1 (p 202) overview of branch instructions (mainly
    C3.1.1-C3.1.3)

  - C3.2 (p 209) overview of load and store (mainly C3.2.1-C3.2.3)

  - C3.3 (p 226) data processing with immediate operand

  - C3.4 (p 231) data processing with all register operands

  - C3.5 (p 239) SIMD and floating point

  - C4 exhaustive list of all instructions with detailed descriptions

- GNU as (assembler) manual: https://sourceware.org/binutils/docs/as/

  Explains assembler directives (everything starting with `.`).

- ABI: https://c9x.me/compile/bib/abi-arm64.pdf

  Describes calling conventions: rules for calling functions, how to
  pass data in registers, etc.
  
