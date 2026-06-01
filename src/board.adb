with Gpio_Types;
with Usart_Types;
with STM32G431_GPIO;

with Debug;

with STM32G431xx; with STM32G431xx.GPIO;

with Last_Chance_Handler;
pragma Unreferenced (Last_Chance_Handler);

package body Board is

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
      Gpio.Configure (Led, Cfg);
   end Init_Led_Gpio;

   procedure Init_Console_Gpio is
      --  USART2 TX/RX on PA2/PA3, AF7. Pull-up biases idle-high when
      --  the ST-Link is disconnected.
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.Pull_Up,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.High,
         AF         => 7);

      PA2 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 2);
      PA3 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 3);
   begin
      Gpio.Configure (PA2, Cfg);
      Gpio.Configure (PA3, Cfg);
   end Init_Console_Gpio;

   procedure Init_I2C_2_Gpio is

      Input_Cfg : constant Gpio_Types.Gpio_Config :=
         (Mode => Gpio_Types.Input,
         Pull => Gpio_Types.Pull_Up);

      Af_Cfg : constant Gpio_Types.Gpio_Config :=
         (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.Pull_Up,
         Drive      => Gpio_Types.Open_Drain,
         Speed      => Gpio_Types.Low_Speed,
         Init_State => Gpio_Types.High,
         AF         => 4);

      PA8 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 8);
      PA9 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 9);

   begin
      --  Float-with-pullup probe: real bus pullups should hold both high.
      Gpio.Configure (PA8, Input_Cfg);
      Gpio.Configure (PA9, Input_Cfg);
      Debug.Put_Line ("Pre-AF: SCL=" & Gpio.Read (PA9)'Image
                     & " SDA=" & Gpio.Read (PA8)'Image);

      Gpio.Configure (PA8, Af_Cfg);  --  I2C2_SDA, AF4
      Gpio.Configure (PA9, Af_Cfg);  --  I2C2_SCL, AF4
   end Init_I2C_2_Gpio;

   procedure Init_Spi_1_Gpio is
      --  SPI1 SCK/MISO/MOSI on PA5/PA6/PA7, AF5. CPOL=0 default.
      --  Init_State is consumed by Output mode only; ignored here for
      --  Alternate pins but kept for record completeness.
      Spi_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.Low,
         AF         => 5);

      --  CS is software-managed Output, idle-high (deselected).
      Cs_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Output,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.High);

      PA5 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 5);
      PA6 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 6);
      PA7 : constant Gpio.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 7);
   begin
      Gpio.Configure (PA5, Spi_Cfg);
      Gpio.Configure (PA6, Spi_Cfg);
      Gpio.Configure (PA7, Spi_Cfg);
      Gpio.Configure (Spi_1_Cs, Cs_Cfg);
   end Init_Spi_1_Gpio;

   --  -------------------------------------------------------------------
   --  Public entry point
   --  -------------------------------------------------------------------

   procedure Initialize is
   begin
      Init_Led_Gpio;
      Init_Console_Gpio;

      Console.Open
     (Console_Dev,
      (Baud      => Usart_Types.B115200,
       Data_Bits => Usart_Types.Data_8,
       Parity    => Usart_Types.None,
       Stop_Bits => Usart_Types.Stop_1,
       Flow      => Usart_Types.None));

      Init_I2C_2_Gpio;
      Init_Spi_1_Gpio;
   end Initialize;

end Board;