# Intel 8086 Microprocessor Documentation

The Intel 8086 is a seminal 16-bit microprocessor introduced by Intel in 1978. It features a 16-bit data bus and a 20-bit address bus, allowing it to address up to 1 MB of physical memory.

---

## 🏗️ Architecture Overview

The 8086 microprocessor is divided internally into two functional units:
1. **Execution Unit (EU)**: Executes instructions using the ALU, general-purpose registers, and flag register.
2. **Bus Interface Unit (BIU)**: Fetches instructions, reads/writes data from/to memory and I/O ports, and maintains a 6-byte instruction queue.

### Memory Segmentation
The 1 MB memory space is divided into logical segments of up to 64 KB each. The four active segments are:
- **Code Segment (CS)**: Pointed to by `CS` register, contains instructions.
- **Data Segment (DS)**: Pointed to by `DS` register, contains variables/data.
- **Stack Segment (SS)**: Pointed to by `SS` register, manages the stack.
- **Extra Segment (ES)**: Pointed to by `ES` register, commonly used for string operations.

The **Physical Address** is calculated as:
$$\text{Physical Address} = (\text{Segment Register} \times 10\text{H}) + \text{Offset Register}$$

---

## 🗃️ Registers Layout

* **General-Purpose Registers (16-bit, can be split into 8-bit high/low)**:
  - `AX` (Accumulator: `AH` / `AL`): Used for arithmetic, logic, and I/O operations.
  - `BX` (Base Register: `BH` / `BL`): Frequently used as an address pointer.
  - `CX` (Count Register: `CH` / `CL`): Loop counter and string shift counter.
  - `DX` (Data Register: `DH` / `DL`): Used for multiplication, division, and I/O port addressing.

* **Pointer and Index Registers**:
  - `SP` (Stack Pointer): Offset into the stack segment.
  - `BP` (Base Pointer): Offset into the stack, used to access local variables.
  - `SI` (Source Index): Used as source offset for string operations.
  - `DI` (Destination Index): Used as destination offset for string operations.

---

## 📂 Assembly Program Explanations

Here are the logical breakdowns of the 8086 programs available in this repository:

### 1. Basic Arithmetic

* **[ADD1.ASM](../../8086/Basic%20Arithmetic/ADD1.ASM)**:
  - **Purpose**: Performs 16-bit addition.
  - **Logic**: Loads two 16-bit numbers from memory (or immediate values), adds them using the `ADD` instruction, and stores the result back to memory. Handles the carry using `ADC` (Add with Carry) or conditional jumps.

* **[SUB.ASM](../../8086/Basic%20Arithmetic/SUB.ASM)**:
  - **Purpose**: Performs 16-bit subtraction.
  - **Logic**: Loads the minuend and subtrahend, uses `SUB` to subtract them, and writes the result to memory. Handles borrows accordingly.

* **[MUL.ASM](../../8086/Basic%20Arithmetic/MUL.ASM)**:
  - **Purpose**: Performs 16-bit unsigned/signed multiplication.
  - **Logic**: Uses the `MUL` or `IMUL` instruction. One multiplier is loaded into `AX`, and the other is a memory/register operand. The 32-bit result is stored in the `DX:AX` register pair.

* **[DIV.ASM](../../8086/Basic%20Arithmetic/DIV.ASM)**:
  - **Purpose**: Performs 16-bit division.
  - **Logic**: Divides a 32-bit dividend in `DX:AX` by a 16-bit divisor. Uses `DIV` instruction. The quotient is stored in `AX` and the remainder in `DX`.

* **[OWN.ASM](../../8086/Basic%20Arithmetic/OWN.ASM)**:
  - **Purpose**: A custom arithmetic program implementing specific complex operations or formula evaluations.

---

### 2. Array Operations

* **[ASCE.ASM](../../8086/Array/ASCE.ASM)**:
  - **Purpose**: Sorts an array of 8-bit or 16-bit integers in ascending order.
  - **Logic**: Implements Bubble Sort. Uses two nested loops controlled by `CX`. Compares adjacent elements using `CMP` and swaps them using `XCHG` if the first is greater than the second (`JA` / `JG` conditional jump).

* **[ODEV.ASM](../../8086/Array/ODEV.ASM)**:
  - **Purpose**: Separates odd and even numbers from an input array.
  - **Logic**: Iterates through the array. For each element, checks the least significant bit (LSB) using `TEST AL, 01H` or `SHR AL, 1`. If the carry/zero flag indicates it is odd/even, it copies the value to its respective output array.

* **[SEARCH.ASM](../../8086/Array/SEARCH.ASM)**:
  - **Purpose**: Searches for a target number within an array (Linear Search).
  - **Logic**: Loads array length into `CX`. Loops through elements, comparing each with the key in `AL`. Uses `JZ` to exit early when found and records the index/position.

---

### 3. String Operations

* **[COMP.ASM](../../8086/String/COMP.ASM)**:
  - **Purpose**: Compares two strings.
  - **Logic**: Uses string instructions `REPE CMPSB`. Sets `SI` to the source string, `DI` to the destination string, and `CX` to length. Compares byte-by-byte; if mismatch occurs, comparison terminates, and flags indicate equality.

* **[OCC.ASM](../../8086/String/OCC.ASM)**:
  - **Purpose**: Counts the occurrences of a specified character in a string.
  - **Logic**: Iterates through the string character by character. Compares each byte with the target character in `AL`. If equal, increments a counter register (like `DL` or `BX`).

* **[SRVL.ASM](../../8086/String/SRVL.ASM)**:
  - **Purpose**: Performs reverse left-shift on a string or reverses a string.
  - **Logic**: Uses two pointers (start and end of string) to swap characters progressively, or manipulates characters to left-shift and append.

---

### 4. ADC (Analog to Digital Converter) Interfacing

* **[adc.asm](../../8086/ADC/adc.asm)**:
  - **Purpose**: Interfaces an ADC (e.g., ADC 0808/0809) with 8086.
  - **Logic**: Sends a Start of Conversion (SOC) pulse by writing to the control port. Polls the End of Conversion (EOC) pin or waits for an interrupt. Once conversion completes, reads the digital equivalent value from the ADC data port into `AL`.

---

### 5. DAC (Digital to Analog Converter) Interfacing

* **[SIN.ASM](../../8086/DAC/SIN.ASM)**:
  - **Purpose**: Generates a Sine wave output using a DAC.
  - **Logic**: Uses a lookup table containing pre-calculated digital values of a sine wave. Continuously loops, reading values from the table and outputting them to the DAC port.

* **[SQUARE.ASM](../../8086/DAC/SQUARE.ASM)**:
  - **Purpose**: Generates a Square wave output.
  - **Logic**: Alternates between sending `00H` (low level) and `FFH` (high level) to the DAC port with a software delay loop in between to control the frequency.

* **[STAIR.ASM](../../8086/DAC/STAIR.ASM)**:
  - **Purpose**: Generates a Staircase wave output.
  - **Logic**: Increments the digital value by a fixed step size (e.g., `20H`) in a loop and outputs it to the DAC. Resets to `00H` once the maximum value is reached.

* **[TRI.ASM](../../8086/DAC/TRI.ASM)**:
  - **Purpose**: Generates a Triangular wave output.
  - **Logic**: Progressively increments the DAC output byte from `00H` to `FFH`, then progressively decrements it from `FFH` to `00H` in a continuous loop.

* **[STEPPER.ASM](../../8086/DAC/STEPPER.ASM)**:
  - **Purpose**: Controls stepper motor through DAC signals.
  - **Logic**: Sends step sequences to coordinate stepper movement.

---

### 6. Stepper Motor Control

* **[STEPPER.ASM](../../8086/Stepper%20Motor%20Control/STEPPER.ASM)**:
  - **Purpose**: Controls stepper motor rotation using full-step sequence.
  - **Logic**: Outputs a 4-step sequence (e.g., `09H`, `05H`, `06H`, `0AH`) to the stepper motor control lines (usually via PPI 8255 ports) with software delays between steps.

* **[STEPPER45.ASM](../../8086/Stepper%20Motor%20Control/STEPPER45.ASM)**:
  - **Purpose**: Rotates the stepper motor by specific 45° steps.
  - **Logic**: Employs a half-step sequence (8-step sequence) to double the step resolution and achieve 45° precise increments.
