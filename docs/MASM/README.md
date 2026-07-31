# Microsoft Macro Assembler (MASM) Program Documentation

This section contains standalone 8086 assembly programs written and assembled using the Microsoft Macro Assembler (MASM).

---

## 🏗️ MASM Assembly Directives & Setup

Unlike bare-metal or microcontroller programming, MASM programs are written to execute in a DOS environment. They leverage assembler directives and DOS interrupts for operating system services.

### Common Directives
- `ASSUME`: Tells the assembler which segment register corresponds to which logical segment in the code.
- `.MODEL`: Sets the memory model (e.g., `SMALL`, `MEDIUM`, `COMPACT`, `LARGE`, `HUGE`). A `SMALL` model indicates code fits in 64 KB and data fits in 64 KB.
- `.STACK`: Reserves storage space for the stack (e.g., `.STACK 100H`).
- `.DATA`: Marks the beginning of the data segment where variables are declared.
- `.CODE`: Marks the beginning of the logical code segment containing execution instructions.
- `PROC` / `ENDP`: Defines the boundaries of procedures (functions).
- `END`: Marks the physical end of the assembly file.

---

## 🗃️ DOS Interrupts (INT 21H) Reference

MASM programs rely heavily on `INT 21H` (MS-DOS system services) for input, output, and program termination:

- **Program Termination**:
  ```assembly
  MOV AH, 4CH   ; DOS function: Terminate Process
  MOV AL, 00H   ; Return code (0 = success)
  INT 21H
  ```
- **Display String**:
  ```assembly
  MOV AH, 09H   ; DOS function: Write string to standard output
  LEA DX, MSG   ; DX must point to '$' terminated string
  INT 21H
  ```
- **Read Character**:
  ```assembly
  MOV AH, 01H   ; DOS function: Read character from standard input (with echo)
  INT 21H       ; Character is returned in AL
  ```

---

## 📂 Assembly Program Explanations

Here are the logical breakdowns of the standalone MASM programs available in this repository:

* **[EQ.ASM](../../MASM/EQ.ASM)**:
  - **Purpose**: Checks two strings or variables for equality.
  - **Logic**: Declares two static strings/variables in the `.DATA` segment. Compares them element by element. If they are equal, displays an "Equal" message using `INT 21H` / `AH=09H`. If they mismatch, it displays a "Not Equal" message.

* **[FILEWRITE.ASM](../../MASM/FILEWRITE.ASM)**:
  - **Purpose**: Creates and writes data to a file on disk using DOS file handles.
  - **Logic**:
    1. **Create File**: `MOV AH, 3CH`, `CX=00H` (Normal attributes), and `DX` pointing to ASCIIZ filename. Returns file handle in `AX`.
    2. **Write to File**: `MOV AH, 40H`, `BX` = file handle, `CX` = number of bytes to write, and `DX` pointing to data buffer.
    3. **Close File**: `MOV AH, 3EH`, `BX` = file handle.
    4. Handles any errors by checking the Carry Flag (`JC`).

* **[I.ASM](../../MASM/I.ASM)**:
  - **Purpose**: General purpose program. Often used for basic I/O test loops or interrupt testing.

* **[OWN.ASM](../../MASM/OWN.ASM)**:
  - **Purpose**: A custom standalone MASM assembly program implementing specific operations (e.g., student grade analysis or a menu-driven application).
