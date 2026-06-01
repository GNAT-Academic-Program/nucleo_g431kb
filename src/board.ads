with Instances;

with Gpio;
with STM32G431_GPIO;

with Usart_Interface;
with Spi_Interface;
with I2C_Interface;

package Board is

   --  -------------------------------------------------------------------
   --  Buses (vendor-neutral facades over MCU-level instances)
   --
   --  Naming reflects the silicon wiring on the NUCLEO-G431KB, not the
   --  application role. What's on each bus is the application's choice.
   --  -------------------------------------------------------------------

   --  Console: USART2 TX=PA2 (AF7), RX=PA3 (AF7) — wired to ST-Link VCP
   package Console is new Usart_Interface
     (Device_T       => Instances.Console.Device,
      Driver_Init    => Instances.Console.Init,
      Driver_Enable  => Instances.Console.Enable,
      Driver_Disable => Instances.Console.Disable,
      Driver_Reset   => Instances.Console.Reset,
      Driver_Tx_Push => Instances.Console.Tx_Push,
      Driver_Rx_Pop  => Instances.Console.Rx_Pop);

   --  SPI1: SCK=PA5 (AF5), MISO=PA6 (AF5), MOSI=PA7 (AF5)
   --  CS lines are software-managed GPIO; see Spi_1_Cs below.
   package Spi_1 is new Spi_Interface
     (Device_T        => Instances.Spi_1.Device,
      Driver_Init     => Instances.Spi_1.Init,
      Driver_Enable   => Instances.Spi_1.Enable,
      Driver_Disable  => Instances.Spi_1.Disable,
      Driver_Reset    => Instances.Spi_1.Reset,
      Driver_Transfer => Instances.Spi_1.Transfer);

   --  I2C1: SCL=PB6 (AF4), SDA=PB7 (AF4)
   package I2C_1 is new I2C_Interface
     (Device_T           => Instances.I2C_1.Device,
      Driver_Init        => Instances.I2C_1.Init,
      Driver_Enable      => Instances.I2C_1.Enable,
      Driver_Disable     => Instances.I2C_1.Disable,
      Driver_Reset       => Instances.I2C_1.Reset,
      Driver_Recover     => Instances.I2C_1.Recover,
      Driver_Probe       => Instances.I2C_1.Probe,
      Driver_Begin_Write => Instances.I2C_1.Begin_Write,
      Driver_Begin_Read  => Instances.I2C_1.Begin_Read,
      Driver_Send        => Instances.I2C_1.Send,
      Driver_Recv        => Instances.I2C_1.Recv);

   --  -------------------------------------------------------------------
   --  Singletons (mutable; one per bus). Created from the MCU-level
   --  instances (Instances.*.Make_Device), not from the facades — the
   --  facades don't expose Make_Device.
   --  -------------------------------------------------------------------

   Console_Dev : aliased Board.Console.Device := Instances.Console.Make_Device;
   Spi_1_Dev   : aliased Board.Spi_1.Device   := Instances.Spi_1.Make_Device;
   I2C_1_Dev   : aliased Board.I2C_1.Device   := Instances.I2C_1.Make_Device;

   --  -------------------------------------------------------------------
   --  GPIO pins (board-specific assignments)
   --  -------------------------------------------------------------------

   Led      : Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 8);
   Spi_1_Cs : Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 4);

   procedure Initialize;

end Board;