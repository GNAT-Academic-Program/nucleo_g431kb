with STM32G431_GPIO;
with STM32G431_USART;
with STM32G431_I2C;
with STM32G431_SPI;

package Board is

   --  LED: PB8
   LED : STM32G431_GPIO.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.B, 8);
   procedure Init_Led_Gpio;

   --  USART2: TX=PA2 (AF7), RX=PA3 (AF7)
   --  Connected to ST-Link virtual COM port via USB.
   CONSOLE : STM32G431_USART.Device :=
      STM32G431_USART.Make_Device (STM32G431_USART.USART_2);
   procedure Init_Console_Gpio;

   --  I2C2: SCL=PB10 (AF4), SDA=PB11 (AF4)
   I2C : aliased STM32G431_I2C.Device :=
     STM32G431_I2C.Make_Device (STM32G431_I2C.I2C_2);
   procedure Init_I2C_Gpio;

   --  SPI1: SCK=PA5 (AF5), MISO=PA6 (AF5), MOSI=PA7 (AF5)
   --  CS=PA4 (software managed GPIO output, init high)
   SPI1_Dev : aliased STM32G431_SPI.Device :=
     STM32G431_SPI.Make_Device (STM32G431_SPI.SPI_1);
   SPI1_CS : STM32G431_GPIO.Pin :=
     STM32G431_GPIO.Make_Pin (STM32G431_GPIO.A, 4);
   procedure Init_SPI1_Gpio;

end Board;
