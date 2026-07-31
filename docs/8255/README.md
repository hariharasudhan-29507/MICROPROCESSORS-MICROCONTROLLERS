# Intel 8255 Programmable Peripheral Interface Documentation

The Intel 8255 (or 8255 PPI) is a general-purpose programmable I/O device designed to interface peripheral equipment to microprocessors. It provides 24 parallel I/O pins organized into three 8-bit ports.

---

## 🏗️ Architecture Overview

The 8255 contains three 8-bit ports:
- **Port A (PA7 - PA0)**: One 8-bit data output latch/buffer and one 8-bit data input latch.
- **Port B (PB7 - PB0)**: One 8-bit data input/output latch/buffer.
- **Port C (PC7 - PC0)**: Divided into two 4-bit ports: Port C Upper (PC7 - PC4) and Port C Lower (PC3 - PC0). It is often used for handshake signals or control lines.

### Port and Register Selection Table
The signals `A1` and `A0` are connected to the system address bus to select the ports:

| A1 | A0 | Selection |
|----|----|-----------|
| 0  | 0  | Port A    |
| 0  | 1  | Port B    |
| 1  | 0  | Port C    |
| 1  | 1  | Control Register (Write-only) |

---

## 🗃️ Control Word Formats

The 8255 operates in two primary modes defined by the Control Word written to the Control Register:
1. **Bit Set/Reset (BSR) Mode**: Used to set or reset individual bits of Port C.
2. **I/O Mode**: Configures Ports A, B, and C as inputs or outputs.

### I/O Mode Control Word (Bit 7 = 1)

| D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0 |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| 1  | Mode Selection (Group A) | Port A I/O | Port C Upper I/O | Mode Selection (Group B) | Port B I/O | Port C Lower I/O |

* **D7**: Always `1` for I/O Mode.
* **D6, D5 (Group A Mode)**:
  - `00`: Mode 0 (Basic I/O)
  - `01`: Mode 1 (Strobed I/O)
  - `1X`: Mode 2 (Bi-directional Bus)
* **D4 (Port A)**: `1` = Input, `0` = Output.
* **D3 (Port C Upper)**: `1` = Input, `0` = Output.
* **D2 (Group B Mode)**: `0` = Mode 0 (Basic I/O), `1` = Mode 1 (Strobed I/O).
* **D1 (Port B)**: `1` = Input, `0` = Output.
* **D0 (Port C Lower)**: `1` = Input, `0` = Output.

---

## 📂 Assembly Program Explanations

Here are the logical breakdowns of the 8255 PPI programs available in this repository:

* **[HAI.ASM](../../8255/HAI.ASM)**:
  - **Purpose**: Performs basic I/O test or data transfer using Port A or B.
  - **Logic**:
    1. Configures the control word register (e.g., sends `80H` to configure Ports A, B, and C as outputs).
    2. Writes a specific data pattern to Port A, verifying correct port latching or sending a startup handshake byte.

* **[SINGLE.ASM](../../8255/SINGLE.ASM)**:
  - **Purpose**: Demonstrates single-port operation, such as reading from an input port and writing that data to an output port.
  - **Logic**:
    1. Configures Port A as input and Port B as output (e.g., writes `90H` to Control Register).
    2. Reads an 8-bit status/switch byte from Port A.
    3. Outputs the exact same byte to Port B to control attached LEDs/actuators.
