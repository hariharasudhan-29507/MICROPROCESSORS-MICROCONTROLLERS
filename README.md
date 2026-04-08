# 🖥️ Microprocessors & Microcontrollers — Assembly Programs

A comprehensive collection of **8086 Microprocessor**, **8051 Microcontroller**, **8253 Timer**, **8255 PPI**, and **MASM** assembly-language programs written as part of the *Microprocessors and Microcontrollers* lab course.

---

## 📋 Description

This repository contains well-organized assembly programs covering fundamental to intermediate concepts in microprocessor and microcontroller programming. Topics include arithmetic operations, array manipulation, string processing, interfacing with peripheral chips (ADC, DAC, timers, PPI), stepper motor control, and general MASM programming.

All programs are written in Intel x86/8051 assembly and can be assembled and run using standard tools such as **MASM**, **TASM**, **EMU8086**, or hardware kits.

---

## 🗂️ Repository Structure

```
MICROPROCESSORS-MICROCONTROLLERS/
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

## 📁 Folder Details & File Links

### 🔷 8086 — Intel 8086 Microprocessor

Programs written for the 16-bit Intel 8086 microprocessor covering a wide range of lab experiments.

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

### 🔶 8051 — Intel 8051 Microcontroller

Programs for the 8-bit Intel 8051 microcontroller, focusing on basic arithmetic and data manipulation.

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

### 🕐 8253 — Programmable Interval Timer

Programs to configure and use the Intel 8253 timer chip in various modes.

#### ➤ Timer Modes
| File | Description |
|------|-------------|
| [MODE0.ASM](8253/Timer/MODE0.ASM) | Mode 0 — Interrupt on Terminal Count |
| [MODE2.ASM](8253/Timer/MODE2.ASM) | Mode 2 — Rate Generator |
| [MODE3.ASM](8253/Timer/MODE3.ASM) | Mode 3 — Square Wave Generator |

---

### 🔌 8255 — Programmable Peripheral Interface

Programs for interfacing with the Intel 8255 PPI chip.

| File | Description |
|------|-------------|
| [HAI.ASM](8255/HAI.ASM) | Basic I/O using 8255 |
| [SINGLE.ASM](8255/SINGLE.ASM) | Single port operation |

---

### 🛠️ MASM — General MASM Programs

Standalone assembly programs written using the Microsoft Macro Assembler (MASM).

| File | Description |
|------|-------------|
| [EQ.ASM](MASM/EQ.ASM) | Equality check program |
| [FILEWRITE.ASM](MASM/FILEWRITE.ASM) | File write using DOS interrupts |
| [I.ASM](MASM/I.ASM) | General purpose program |
| [OWN.ASM](MASM/OWN.ASM) | Custom MASM program |

---

## 🛠️ Tools & Prerequisites

- **Assembler:** MASM / TASM / EMU8086
- **Simulator:** EMU8086, Proteus, or real hardware kit
- **OS:** MS-DOS / DOSBox (for 8086 programs)
- **Microcontroller Kit:** 8051 trainer kit (for 8051 programs)

---

## 👨‍💻 Author

### Hariharasudhan A

I am a passionate Computer Science and Engineering student at Mepco Schlenk Engineering College. I have a strong interest in low-level programming, embedded systems, and microprocessor architecture. This repository documents my hands-on learning journey through assembly language programming for various microprocessors and microcontrollers.

**Skills:** Assembly Language · Embedded Systems · 8086/8051 Architecture · Digital Electronics · C/C++

📧 **Reach me:** [sudanayyappan_bcs28@mepcoeng.ac.in](mailto:sudanayyappan_bcs28@mepcoeng.ac.in)

---

> ⭐ If you find this repository helpful, feel free to star it and share it with others learning assembly programming!
