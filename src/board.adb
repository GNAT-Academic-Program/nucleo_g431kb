with Gpio;
with Gpio_Types;
with STM32G431_GPIO;
with STM32G431_I2C;

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

      PA2  : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 2);   --  USART2 TX
      PA15 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 15);  --  USART2 RX (KB)
   begin
      Gpio.Configure (PA2,  Cfg);
      Gpio.Configure (PA15, Cfg);
   end Init_Console_Gpio;

   procedure Init_I2C_Gpio is
      Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.Pull_Up,
         Drive      => Gpio_Types.Open_Drain,
         Speed      => Gpio_Types.Low_Speed,
         Init_State => Gpio_Types.High,
         AF         => 4);

      PA9 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 9);   --  I2C2 SCL
      PA8 : constant STM32G431_GPIO.Pin :=
        STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 8);   --  I2C2 SDA
   begin
      Gpio.Configure (PA9, Cfg);
      Gpio.Configure (PA8, Cfg);
   end Init_I2C_Gpio;

end Board;