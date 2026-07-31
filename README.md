# Microprocessors & Microcontrollers — Assembly Programs

A comprehensive collection of **8086 Microprocessor**, **8051 Microcontroller**, **8253 Timer**, **8255 PPI**, and **MASM** assembly-language programs written as part of the *Microprocessors and Microcontrollers* lab course.

---

## 📖 Table of Contents

- [Description](#description)
- [🗂️ Repository Structure](#️-repository-structure)
- [📚 Microcontroller & Microprocessor Documentation](#-microcontroller--microprocessor-documentation)
- [Folder Details & File Links](#folder-details--file-links)
  - [8086 — Intel 8086 Microprocessor](#8086--intel-8086-microprocessor)
  - [8051 — Intel 8051 Microcontroller](#8051--intel-8051-microcontroller)
  - [8253 — Programmable Interval Timer](#8253--programmable-interval-timer)
  - [8255 — Programmable Peripheral Interface](#8255--programmable-peripheral-interface)
  - [MASM — General MASM Programs](#masm--general-masm-programs)
- [🛠️ How to Compile & Run](#️-how-to-compile--run)
  - [For 8086 and MASM Programs](#for-8086-and-masm-programs)
  - [For 8051 Microcontroller Programs](#for-8051-microcontroller-programs)
- [Author](#author)

---

## Description

This repository contains well-organized assembly programs covering fundamental to intermediate concepts in microprocessor and microcontroller programming. Topics include arithmetic operations, array manipulation, string processing, interfacing with peripheral chips (ADC, DAC, timers, PPI), stepper motor control, and general MASM programming.

---

## 🗂️ Repository Structure

```
MICROPROCESSORS-MICROCONTROLLERS/
│
├── docs/                        # Comprehensive documentation for each platform
│   ├── 8086/                    # 8086 Microprocessor documentation
│   ├── 8051/                    # 8051 Microcontroller documentation
│   ├── 8253/                    # 8253 Timer documentation
│   ├── 8255/                    # 8255 PPI documentation
│   └── MASM/                    # General MASM documentation & tools
│
├── 8086/                        # Intel 8086 Microprocessor programs
│   ├── Basic Arithmetic/        # Add, Subtract, Multiply, Divide
│   ├── Array/                   # Sorting, Odd/Even separation, Searching
│   ├── String/                  # String comparison, occurrence count, shift
│   ├── ADC/                     # Analog-to-Digital Converter interfacing
│   ├── DAC/                     # Digital-to-Analog Converter waveform generation
│   └── Stepper Motor Control/   # Stepper motor interface programs
│
├── 8051/                        # Intel 8051 Microcontroller programs
│   └── Basic Arithmetic/        # 8-bit and 16-bit arithmetic operations
│
├── 8253/                        # Intel 8253 Programmable Interval Timer
│   └── Timer/                   # Timer mode programs (Mode 0, 2, 3)
│
├── 8255/                        # Intel 8255 Programmable Peripheral Interface
│   ├── HAI.ASM
│   └── SINGLE.ASM
│
└── MASM/                        # General MASM programs
    ├── EQ.ASM
    ├── FILEWRITE.ASM
    ├── I.ASM
    └── OWN.ASM
```

---

## 📚 Microcontroller & Microprocessor Documentation

For thorough explanations on architectures, pin configurations, instruction sets, register mappings, and detailed line-by-line analyses of the code, please refer to the subdirectories under the `docs/` folder:

* 📄 **[Intel 8086 Microprocessor Docs](docs/8086/README.md)**
* 📄 **[Intel 8051 Microcontroller Docs](docs/8051/README.md)**
* 📄 **[Intel 8253 Programmable Interval Timer Docs](docs/8253/README.md)**
* 📄 **[Intel 8255 Programmable Peripheral Interface Docs](docs/8255/README.md)**
* 📄 **[General MASM Assembly Docs](docs/MASM/README.md)**

---

## Folder Details & File Links

### 8086 — Intel 8086 Microprocessor

Programs written for the 16-bit Intel 8086 microprocessor covering a wide range of lab experiments. Detailed documentation is available at [Intel 8086 Microprocessor Docs](docs/8086/README.md).

#### ➤ Basic Arithmetic
| File | Description |
|------|-------------|
| [ADD1.ASM](8086/Basic%20Arithmetic/ADD1.ASM) | 16-bit addition |
| [SUB.ASM](8086/Basic%20Arithmetic/SUB.ASM) | 16-bit subtraction |
| [MUL.ASM](8086/Basic%20Arithmetic/MUL.ASM) | 16-bit multiplication |
| [DIV.ASM](8086/Basic%20Arithmetic/DIV.ASM) | 16-bit division |
| [OWN.ASM](8086/Basic%20Arithmetic/OWN.ASM) | Custom arithmetic program |

#### ➤ Array Operations
| File | Description |
|------|-------------|
| [ASCE.ASM](8086/Array/ASCE.ASM) | Ascending order sort |
| [ODEV.ASM](8086/Array/ODEV.ASM) | Odd and even number separation |
| [SEARCH.ASM](8086/Array/SEARCH.ASM) | Linear search in an array |

#### ➤ String Operations
| File | Description |
|------|-------------|
| [COMP.ASM](8086/String/COMP.ASM) | String comparison |
| [OCC.ASM](8086/String/OCC.ASM) | Count occurrences of a character |
| [SRVL.ASM](8086/String/SRVL.ASM) | Shift/Reverse left operation |

#### ➤ ADC — Analog-to-Digital Converter
| File | Description |
|------|-------------|
| [adc.asm](8086/ADC/adc.asm) | ADC interfacing with 8086 |

#### ➤ DAC — Digital-to-Analog Converter
| File | Description |
|------|-------------|
| [SIN.ASM](8086/DAC/SIN.ASM) | Sine wave generation |
| [SQUARE.ASM](8086/DAC/SQUARE.ASM) | Square wave generation |
| [STAIR.ASM](8086/DAC/STAIR.ASM) | Staircase wave generation |
| [TRI.ASM](8086/DAC/TRI.ASM) | Triangular wave generation |
| [STEPPER.ASM](8086/DAC/STEPPER.ASM) | Stepper motor via DAC |

#### ➤ Stepper Motor Control
| File | Description |
|------|-------------|
| [STEPPER.ASM](8086/Stepper%20Motor%20Control/STEPPER.ASM) | Full-step stepper motor control |
| [STEPPER45.ASM](8086/Stepper%20Motor%20Control/STEPPER45.ASM) | 45° step stepper motor control |

---

### 8051 — Intel 8051 Microcontroller

Programs for the 8-bit Intel 8051 microcontroller, focusing on basic arithmetic and data manipulation. Detailed documentation is available at [Intel 8051 Microcontroller Docs](docs/8051/README.md).

#### ➤ Basic Arithmetic
| File | Description |
|------|-------------|
| [8BIT_ADD.ASM](8051/Basic%20Arithmetic/8BIT_ADD.ASM) | 8-bit addition |
| [8BIT_SUB.ASM](8051/Basic%20Arithmetic/8BIT_SUB.ASM) | 8-bit subtraction |
| [8BIT_MUL.ASM](8051/Basic%20Arithmetic/8BIT_MUL.ASM) | 8-bit multiplication |
| [8BIT_DIV.ASM](8051/Basic%20Arithmetic/8BIT_DIV.ASM) | 8-bit division |
| [16_BIT_ADD.ASM](8051/Basic%20Arithmetic/16_BIT_ADD.ASM) | 16-bit addition |
| [16_BIT_SUB.ASM](8051/Basic%20Arithmetic/16_BIT_SUB.ASM) | 16-bit subtraction |
| [OWN.ASM](8051/Basic%20Arithmetic/OWN.ASM) | Custom arithmetic program |

---

### 8253 — Programmable Interval Timer

Programs to configure and use the Intel 8253 timer chip in various modes. Detailed documentation is available at [Intel 8253 Programmable Interval Timer Docs](docs/8253/README.md).

#### ➤ Timer Modes
| File | Description |
|------|-------------|
| [MODE0.ASM](8253/Timer/MODE0.ASM) | Mode 0 — Interrupt on Terminal Count |
| [MODE2.ASM](8253/Timer/MODE2.ASM) | Mode 2 — Rate Generator |
| [MODE3.ASM](8253/Timer/MODE3.ASM) | Mode 3 — Square Wave Generator |

---

### 8255 — Programmable Peripheral Interface

Programs for interfacing with the Intel 8255 PPI chip. Detailed documentation is available at [Intel 8255 Programmable Peripheral Interface Docs](docs/8255/README.md).

| File | Description |
|------|-------------|
| [HAI.ASM](8255/HAI.ASM) | Basic I/O using 8255 |
| [SINGLE.ASM](8255/SINGLE.ASM) | Single port operation |

---

### MASM — General MASM Programs

Standalone assembly programs written using the Microsoft Macro Assembler (MASM). Detailed documentation is available at [General MASM Assembly Docs](docs/MASM/README.md).

| File | Description |
|------|-------------|
| [EQ.ASM](MASM/EQ.ASM) | Equality check program |
| [FILEWRITE.ASM](MASM/FILEWRITE.ASM) | File write using DOS interrupts |
| [I.ASM](MASM/I.ASM) | General purpose program |
| [OWN.ASM](MASM/OWN.ASM) | Custom MASM program |

---

## 🛠️ How to Compile & Run

### For 8086 and MASM Programs

To run the `.ASM` programs for the 8086 microprocessor or MASM on modern Windows/macOS/Linux operating systems, you will need a DOS emulator such as **DOSBox** along with the **MASM** assembler utilities (`MASM.EXE` and `LINK.EXE`).

1. **Download and Install DOSBox**:
   Get DOSBox from [dosbox.com](https://www.dosbox.com/).
2. **Setup the Work Environment**:
   - Create a directory, e.g., `C:\DOSBox` on your host machine.
   - Place your `.ASM` files along with `MASM.EXE` and `LINK.EXE` (and optionally `DEBUG.EXE`) inside that directory.
3. **Mount the Directory inside DOSBox**:
   Launch DOSBox and type:
   ```cmd
   mount c c:\DOSBox
   c:
   ```
4. **Assemble the Program**:
   ```cmd
   masm filename.asm;
   ```
   *(The semicolon `;` tells MASM to skip the prompts for listing and object filenames and use defaults).*
5. **Link the Object File**:
   ```cmd
   link filename.obj;
   ```
6. **Execute the Program**:
   ```cmd
   filename.exe
   ```
7. **Debug the Program** (To inspect registers or memory):
   ```cmd
   debug filename.exe
   ```
   Inside debug, you can use commands like:
   - `t` (trace/step)
   - `g` (go/run)
   - `d` (dump memory)
   - `r` (view registers)
   - `q` (quit)

### For 8051 Microcontroller Programs

8051 programs can be simulated/compiled using standard IDEs like **Keil µVision** (for 8051 C51 compiler/assembler) or **EdSim51** (a popular, visual 8051 simulator).

#### Using Keil µVision:
1. **Create a New Project**:
   Open Keil, select `Project -> New uVision Project...`, name it, and select your 8051 target device (e.g., *Atmel AT89C51*).
2. **Add Source Code**:
   - Right-click `Source Group 1` in the project explorer and choose `Add New Item to Group...`.
   - Choose **Assembly File (.s / .asm)** and type your code.
3. **Configure Project Settings**:
   Right-click Target 1, go to `Options for Target`, and under the `Output` tab, check **Create HEX File** if you plan to burn the code onto a physical chip.
4. **Build and Debug**:
   - Press `F7` to build (translate and link).
   - Click the **Start/Stop Debug Session** button (`Ctrl+F5`) to simulate step-by-step, inspecting variables, internal RAM, SFR registers, and ports.

#### Using EdSim51 Simulator:
1. Open the EdSim51 simulator.
2. Paste the `.ASM` program code into the editor window.
3. Click **Assemble**.
4. Use the **Step** or **Run** buttons to execute instructions and observe internal memory (`RAM`), Special Function Registers (`SFR`), and simulated peripherals (such as LEDs, switches, and DAC).

---

## Author

### Hariharasudhan A

I am a passionate Computer Science and Engineering student at Mepco Schlenk Engineering College. This repository documents my hands-on learning journey through assembly language programming for various microprocessors and microcontrollers.

**Skills:** Assembly Language · 8086/8051 Architecture · Digital Electronics · C/C++

📧 **Reach me:** [sudanayyappan_bcs28@mepcoeng.ac.in](mailto:sudanayyappan_bcs28@mepcoeng.ac.in)

---

> ⭐ If you find this repository helpful, feel free to star it and share it with others learning assembly programming!
