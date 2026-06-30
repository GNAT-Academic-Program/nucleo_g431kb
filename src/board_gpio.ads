--  Board_GPIO — complete GPIO pin map for NUCLEO-G431KB.
--  Every pin used on this board is declared here.
--  One file, full picture — no scavenging through peripheral files.

with Gpio;
with STM32G431_GPIO;

package Board_GPIO is

   --  LD2 — green user LED, active-high
   Led : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 8);   --  PB8

   --  USART2 — ST-LINK VCP (USB console), AF7
   Console_TX : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 2);   --  PA2
   Console_RX : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 3);   --  PA3

   --  SPI1 — AF5
   SPI1_SCK  : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 5);   --  PA5
   SPI1_MISO : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 6);   --  PA6
   SPI1_MOSI : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 7);   --  PA7
   SPI1_CS   : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 4);   --  PA4 (software-managed)

   --  I2C2 — AF4, open-drain
   I2C2_SDA : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 8);   --  PA8
   I2C2_SCL : constant Gpio.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 9);   --  PA9

end Board_GPIO;
