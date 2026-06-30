with Gpio_Types;
with Usart_Types;
with I2C_Types;
with Spi_Types;
with Board_GPIO;
with MT;

with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);

with Console_GPIO;
with SPI_1_GPIO;
with I2C_1_GPIO;

package body Board is

   use type MT.Bit;

   --  -------------------------------------------------------------------
   --  GPIO initialization (per-bus; private to this body)
   --  -------------------------------------------------------------------

   procedure Init_Led_Gpio is
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Output,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Low_Speed,
         Init_State => Gpio_Types.Low);
   begin
      Gpio.Configure (Board_GPIO.Led, Cfg);
   end Init_Led_Gpio;

   --  -------------------------------------------------------------------
   --  Public entry point
   --  -------------------------------------------------------------------

   procedure Initialize is
   begin
      Init_Led_Gpio;

      Console_GPIO.Configure;
      Console.Open
        ((Baud      => Usart_Types.B115200,
          Data_Bits => Usart_Types.Data_8,
          Parity    => Usart_Types.None,
          Stop_Bits => Usart_Types.Stop_1,
          Flow      => Usart_Types.None));

      I2C_1_GPIO.Configure;
      I2C_1.Open ((Speed => I2C_Types.Standard_Mode,
                   Role  => I2C_Types.Master_Only));

      SPI_1_GPIO.Configure;
      Spi_1.Open ((Mode      => Spi_Types.Mode_0,
                   Data_Size => Spi_Types.Data_8,
                   Bit_Order => Spi_Types.MSB_First,
                   Frequency => Spi_Types.F_1M));
   end Initialize;

end Board;
