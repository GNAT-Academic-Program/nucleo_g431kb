# nucleo_g431kb

Board Support Package for the STM32 Nucleo-G431KB development board.

## Overview

`nucleo_g431kb` provides board-level abstractions and pin definitions for the STM32 Nucleo-G431KB board. It instantiates the STM32G431 HAL with board-specific configurations and provides convenient access to onboard peripherals.

## Features

- Board-specific pin definitions
- Onboard LED support
- Debug output via USART
- Pre-configured peripheral instances
- Last chance handler for runtime errors

## Board Specifications

- **MCU:** STM32G431KBT6
- **Core:** ARM Cortex-M4F @ 170 MHz
- **Flash:** 128 KB
- **RAM:** 32 KB
- **Form Factor:** Arduino Nano compatible

## Pinout

```
          +--[USB]--+
          |         |
  PA9   1 +         + 1   VIN
  PA10  2 +         + 2   GND
  RST   3 +  NUCLEO + 3   RST
  GND   4 + G431KB  + 4   5V
  PA12  5 +         + 5   PA2
  PB0   6 +         + 6   PA7
  PB7   7 +         + 7   PA6
  PA15  8 +         + 8   PA5
  PB6   9 +         + 9   PA4
  PF0  10 +         + 10  PA3
  PF1  11 +         + 11  PA1
  PA8  12 +         + 12  PA0
  PA11 13 +         + 13  AVDD
  PB5  14 +         + 14  3V3
  PB4  15 +         + 15  PB3
          +---------+
```

## Usage

### In Application Code

```ada
with Board;
with Gpio;

procedure Main is
begin
   Board.Initialize;
   
   loop
      Gpio.Toggle (Board.Led);
      delay 0.5;
   end loop;
end Main;
```

### Debug Output

```ada
with Debug;

Debug.Put_Line ("System initialized");
```

## Integration

Add to your `alire.toml`:

```toml
[[depends-on]]
nucleo_g431kb = "^0.1.0"
```

## Dependencies

- `stm32g431` - STM32G431 HAL
- `gpio_generic` - Generic GPIO interface
- `debug_generic` - Generic debug output

## License

MIT OR Apache-2.0 WITH LLVM-exception
