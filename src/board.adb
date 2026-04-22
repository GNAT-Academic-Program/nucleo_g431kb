with Gpio;
with Gpio_Types;
with STM32G431_GPIO;

package body Board is

   procedure Init_Led_Gpio is
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Output,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Low_Speed,
         Init_State => Gpio_Types.Low);
   begin
      Gpio.Configure (P => LED, Cfg => Cfg);
   end Init_Led_Gpio;

   procedure Init_Console_Gpio is
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.Pull_Up,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.Low,
         AF         => 7);

      PA2 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 2);  --  USART2 TX
      PA3 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 3);  --  USART2 RX
   begin
      Gpio.Configure (PA2, Cfg);
      Gpio.Configure (PA3, Cfg);
   end Init_Console_Gpio;

   procedure Init_I2C_Gpio is
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.Pull_Up,
         Drive      => Gpio_Types.Open_Drain,
         Speed      => Gpio_Types.Low_Speed,
         Init_State => Gpio_Types.High,
         AF         => 4);

      PB10 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 10);  --  I2C2 SCL
      PB11 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 11);  --  I2C2 SDA
   begin
      Gpio.Configure (PB10, Cfg);
      Gpio.Configure (PB11, Cfg);
   end Init_I2C_Gpio;

   procedure Init_SPI1_Gpio is
      Spi_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.Low,
         AF         => 5);

      CS_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Output,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.High);

      PA5 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 5);  --  SPI1 SCK
      PA6 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 6);  --  SPI1 MISO
      PA7 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 7);  --  SPI1 MOSI
   begin
      Gpio.Configure (PA5, Spi_Cfg);
      Gpio.Configure (PA6, Spi_Cfg);
      Gpio.Configure (PA7, Spi_Cfg);
      Gpio.Configure (SPI1_CS, CS_Cfg);
   end Init_SPI1_Gpio;

end Board;
