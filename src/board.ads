with STM32G431_GPIO;
with STM32G431_USART;
with STM32G431_I2C;

package Board is

   --  LED on NUCLEO-G431KB is PB8 
   LED : STM32G431_GPIO.Pin := STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 8);
   procedure Init_Led_Gpio;

   --  USART2: TX=PA2, RX=PA15 on KB
   CONSOLE : STM32G431_USART.Device :=
      STM32G431_USART.Make_Device (STM32G431_USART.USART_2);
   procedure Init_Console_Gpio;

   --  I2C1: SCL=PA15, SDA=PB7 — same as KB
   I2C_1 : aliased STM32G431_I2C.Device :=
      STM32G431_I2C.Make_Device (STM32G431_I2C.I2C_2);  --  was I2C_1
   procedure Init_I2C_Gpio;

end Board;