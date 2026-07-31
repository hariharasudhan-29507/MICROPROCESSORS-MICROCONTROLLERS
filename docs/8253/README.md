# Intel 8253 Programmable Interval Timer Documentation

The Intel 8253 is a Programmable Interval Timer (PIT) designed to solve the timing/counting requirements in microcomputer systems. It features three independent 16-bit down counters.

---

## 🏗️ Pin and Block Diagram Concepts

The 8253 chip contains:
- **Data Bus Buffer**: Tri-state, bi-directional 8-bit buffer used to interface with the microprocessor system data bus.
- **Read/Write Logic**: Accepts control signals from the CPU (like `RD`, `WR`, `CS`, `A0`, `A1`) to select registers or counters.
- **Control Word Register**: An 8-bit write-only register used to configure the operating modes of the three counters.
- **Counter 0, Counter 1, Counter 2**: Three identical, independent 16-bit counters. Each counter has:
  - `CLK`: Clock input pin.
  - `GATE`: Gate input pin (controls counting).
  - `OUT`: Output pin.

### Counter and Address Selection Table
The combinations of signals `A1` and `A0` select different registers:

| A1 | A0 | Selection |
|----|----|-----------|
| 0  | 0  | Counter 0 |
| 0  | 1  | Counter 1 |
| 1  | 0  | Counter 2 |
| 1  | 1  | Control Word Register |

---

## 🗃️ Control Word Format

The Control Word defines how each counter behaves. It is written to the Control Word Register (when $A1, A0 = 1, 1$):

| SC1 | SC0 | RL1 | RL0 | M2 | M1 | M0 | BCD |
|:---:|:---:|:---:|:---:|:--:|:--:|:--:|:---:|

* **Select Counter (SC1, SC0)**:
  - `00`: Counter 0
  - `01`: Counter 1
  - `10`: Counter 2
  - `11`: Read-Back Command (8254 only)

* **Read/Load (RL1, RL0)**:
  - `00`: Counter Latch Command
  - `01`: Read/Load Least Significant Byte (LSB) only
  - `10`: Read/Load Most Significant Byte (MSB) only
  - `11`: Read/Load LSB first, then MSB

* **Mode (M2, M1, M0)**:
  - `000` (Mode 0): Interrupt on Terminal Count
  - `001` (Mode 1): Hardware Retriggerable One-Shot
  - `010` (Mode 2): Rate Generator
  - `011` (Mode 3): Square Wave Mode
  - `100` (Mode 4): Software Triggered Strobe
  - `101` (Mode 5): Hardware Triggered Strobe

* **BCD**:
  - `0`: Binary Counter (16-bit)
  - `1`: Binary Coded Decimal (BCD) Counter (4 Decades)

---

## 📂 Assembly Program Explanations

Here are the logical breakdowns of the 8253 timer programs available in this repository:

* **[MODE0.ASM](../../8253/Timer/MODE0.ASM)**:
  - **Purpose**: Configures Counter 0 in Mode 0 (Interrupt on Terminal Count).
  - **Logic**:
    1. Writes a control word specifying Counter 0, RL=LSB/MSB (or LSB-only), Mode 0, Binary count.
    2. Writes the initial count value to Counter 0's address.
    3. Once loaded, `OUT` goes low. The counter starts decrementing on each clock cycle. When it reaches 0, `OUT` goes high and remains high until a new count is loaded.

* **[MODE2.ASM](../../8253/Timer/MODE2.ASM)**:
  - **Purpose**: Configures the timer in Mode 2 (Rate Generator / Divide-by-N Counter).
  - **Logic**:
    1. Writes control word to select Counter 0, Mode 2.
    2. Loads the count value `N`.
    3. The counter decrements. At 0, `OUT` outputs a low pulse for exactly one clock cycle, then reloads the count automatically and repeats. This produces periodic narrow pulses.

* **[MODE3.ASM](../../8253/Timer/MODE3.ASM)**:
  - **Purpose**: Configures the timer in Mode 3 (Square Wave Generator).
  - **Logic**:
    1. Writes control word for Counter 0, Mode 3.
    2. Loads count `N`.
    3. The timer outputs a square wave on `OUT` where `OUT` is high for half the duration ($N/2$ cycles) and low for the other half ($N/2$ cycles), continuously repeating.
