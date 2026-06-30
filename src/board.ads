with Instances;
with Board_GPIO;

with Gpio;

package Board is

   --  -------------------------------------------------------------------
   --  Buses (vendor-neutral facades over MCU-level instances)
   --
   --  Naming reflects the silicon wiring on the NUCLEO-G431KB, not the
   --  application role. What's on each bus is the application's choice.
   --  -------------------------------------------------------------------

   --  Console: USART2 TX=PA2 (AF7), RX=PA3 (AF7) — wired to ST-Link VCP
   package Console renames Instances.Console;

   --  SPI1: SCK=PA5 (AF5), MISO=PA6 (AF5), MOSI=PA7 (AF5)
   --  CS lines are software-managed GPIO; see Spi_1_Cs below.
   package Spi_1 renames Instances.Spi_1;

   --  I2C1: SCL=PB6 (AF4), SDA=PB7 (AF4)
   package I2C_1 renames Instances.I2C_1;

   --  -------------------------------------------------------------------
   --  GPIO pins (board-specific assignments)
   --  -------------------------------------------------------------------

   Led      : Gpio.Pin renames Board_GPIO.Led;
   Spi_1_Cs : Gpio.Pin renames Board_GPIO.SPI1_CS;

   procedure Initialize;

end Board;