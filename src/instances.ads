with STM32G431_USART;
with STM32G431_SPI;
with STM32G431_I2C;
with STM32G431xx.USART;
with STM32G431xx.SPI;
with STM32G431xx.I2C;
with Clock_Tree;
with Usart_Interface;
with Spi_Interface;
with I2C_Interface;

package Instances is

   --  Console: USART2, wired to the ST-LINK VCP (USB) on the NUCLEO-G431KB.
   package USART_2 is new STM32G431_USART
     (Periph     => STM32G431xx.USART.USART2_Periph'Access,
      Get_Clock  => Clock_Tree.Get_USART2_Clock,
      RCC_Enable => Clock_Tree.Enable_USART2,
      RCC_Reset  => Clock_Tree.Reset_USART2);

   package Console is new Usart_Interface
     (Driver_Init    => USART_2.Init,
      Driver_Enable  => USART_2.Enable,
      Driver_Disable => USART_2.Disable,
      Driver_Reset   => USART_2.Reset,
      Driver_Tx_Push => USART_2.Tx_Push,
      Driver_Rx_Pop  => USART_2.Rx_Pop);

   --  SPI1: Arduino header (SCK=PA5, MISO=PA6, MOSI=PA7, AF5).
   package SPI_1_HW is new STM32G431_SPI
     (Periph     => STM32G431xx.SPI.SPI1_Periph'Access,
      Get_Clock  => Clock_Tree.Get_SPI1_Clock,
      RCC_Enable => Clock_Tree.Enable_SPI1,
      RCC_Reset  => Clock_Tree.Reset_SPI1);

   package Spi_1 is new Spi_Interface
     (Driver_Init     => SPI_1_HW.Init,
      Driver_Enable   => SPI_1_HW.Enable,
      Driver_Disable  => SPI_1_HW.Disable,
      Driver_Reset    => SPI_1_HW.Reset,
      Driver_Transfer => SPI_1_HW.Transfer);

   --  I2C2: (SDA=PA8, SCL=PA9, AF4).
   package I2C_2_HW is new STM32G431_I2C
     (Periph     => STM32G431xx.I2C.I2C2_Periph'Access,
      Get_Clock  => Clock_Tree.Get_I2C2_Clock,
      RCC_Enable => Clock_Tree.Enable_I2C2,
      RCC_Reset  => Clock_Tree.Reset_I2C2);

   package I2C_1 is new I2C_Interface
     (Driver_Init        => I2C_2_HW.Init,
      Driver_Enable      => I2C_2_HW.Enable,
      Driver_Disable     => I2C_2_HW.Disable,
      Driver_Reset       => I2C_2_HW.Reset,
      Driver_Recover     => I2C_2_HW.Recover,
      Driver_Probe       => I2C_2_HW.Probe,
      Driver_Begin_Write => I2C_2_HW.Begin_Write,
      Driver_Begin_Read  => I2C_2_HW.Begin_Read,
      Driver_Send        => I2C_2_HW.Send,
      Driver_Recv        => I2C_2_HW.Recv);

end Instances;
