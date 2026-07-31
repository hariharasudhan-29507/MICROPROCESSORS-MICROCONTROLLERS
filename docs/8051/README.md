# Intel 8051 Microcontroller Documentation

The Intel 8051 is a popular 8-bit Harvard architecture microcontroller designed by Intel in 1980 for embedded systems.

---

## 🏗️ Architecture Overview

The 8051 uses separated memory spaces for code (program) and data, a defining characteristic of the **Harvard Architecture**:
- **Program Memory (ROM)**: Used to store the executable program code. It is addressed up to 64 KB.
- **Data Memory (RAM)**: Divided into internal and external memory. Internal RAM consists of 128 bytes (expanded to 256 bytes in 8052) and contains registers, bit-addressable RAM, and scratchpad RAM.

---

## 🗃️ Internal RAM Layout

Internal Data RAM is organized as follows:
1. **Register Banks (00H - 1FH)**: 4 banks of 8 registers each (R0 to R7). Controlled by RS0 and RS1 bits in the Program Status Word (`PSW`).
2. **Bit-Addressable Area (20H - 2FH)**: 16 bytes (128 bits total), which can be addressed individually.
3. **General-Purpose RAM / Scratchpad (30H - 7FH)**: Used for data storage and Stack.

### Special Function Registers (SFRs)
The SFR area occupies addresses `80H - FFH`. Key registers include:
- `ACC` (Accumulator): Register for math, logic, and data transfers.
- `B` register: Used during multiply (`MUL`) and divide (`DIV`) operations.
- `DPTR` (Data Pointer): 16-bit register (`DPH` and `DPL`) used to access external memory.
- `SP` (Stack Pointer): Points to the current top of the stack.
- `PC` (Program Counter): Holds the address of the next instruction.
- `PSW` (Program Status Word): Flags register containing Carry (C), Auxiliary Carry (AC), Overflow (OV), and Register Bank Select bits.

---

## 📂 Assembly Program Explanations

Here are the logical breakdowns of the 8051 programs available in this repository:

### 1. Basic Arithmetic

All programs operate on external RAM since standard 8051 kits access data via the `MOVX` command.

* **[8BIT_ADD.ASM](../../8051/Basic%20Arithmetic/8BIT_ADD.ASM)**:
  - **Purpose**: Adds two 8-bit numbers.
  - **Logic**: Points `DPTR` to `9000H` (first operand), loads it to register `R1`. Increments `DPTR` to `9001H` (second operand), loads to `ACC`. Performs `ADD A, R1`. Checks for Carry (`JNC L1`). If carry is set, increments register `R0` (which acts as MSB). Stores LSB at `9002H` and MSB (carry) at `9003H`.

* **[8BIT_SUB.ASM](../../8051/Basic%20Arithmetic/8BIT_SUB.ASM)**:
  - **Purpose**: Subtracts two 8-bit numbers.
  - **Logic**: Uses `CLR C` to clear the carry flag, then subtracts with borrow using `SUBB A, R1`. Stores result and any borrow state back to external RAM.

* **[8BIT_MUL.ASM](../../8051/Basic%20Arithmetic/8BIT_MUL.ASM)**:
  - **Purpose**: Multiplies two 8-bit numbers.
  - **Logic**: Loads the first operand into the accumulator `A` and the second into register `B`. Executes the `MUL AB` instruction. The lower byte of the result is stored in `A` and the upper byte is stored in `B`. Outputs both bytes to designated external RAM addresses.

* **[8BIT_DIV.ASM](../../8051/Basic%20Arithmetic/8BIT_DIV.ASM)**:
  - **Purpose**: Divides two 8-bit numbers.
  - **Logic**: Loads the dividend into `A` and the divisor into `B`. Executes `DIV AB`. The quotient is placed in `A`, and the remainder goes to register `B`. Both are saved back to external RAM.

* **[16_BIT_ADD.ASM](../../8051/Basic%20Arithmetic/16_BIT_ADD.ASM)**:
  - **Purpose**: Performs 16-bit addition.
  - **Logic**: Performs addition of two 16-bit values by first adding their low bytes (`ADD A, ...`), saving the result, and then adding their high bytes using `ADDC A, ...` to include the carry from the low-byte addition.

* **[16_BIT_SUB.ASM](../../8051/Basic%20Arithmetic/16_BIT_SUB.ASM)**:
  - **Purpose**: Performs 16-bit subtraction.
  - **Logic**: Progressively subtracts the lower bytes using `SUBB`, followed by subtraction of the upper bytes using `SUBB` to handle the borrow correctly.

* **[OWN.ASM](../../8051/Basic%20Arithmetic/OWN.ASM)**:
  - **Purpose**: A custom 8051 application executing complex logical or arithmetic operations.
