with STM32G431_USART;
with STM32G431_SPI;
with STM32G431_I2C;
with STM32G431xx.USART;
with STM32G431xx.SPI;
with STM32G431xx.I2C;
with Clock_Tree;

package Instances is

   package Console is new STM32G431_USART
     (Periph     => STM32G431xx.USART.USART2_Periph'Access,
      Get_Clock  => Clock_Tree.Get_USART2_Clock,
      RCC_Enable => Clock_Tree.Enable_USART2,
      RCC_Reset  => Clock_Tree.Reset_USART2);

   package Spi_1 is new STM32G431_SPI
     (Periph     => STM32G431xx.SPI.SPI1_Periph'Access,
      Get_Clock  => Clock_Tree.Get_SPI1_Clock,
      RCC_Enable => Clock_Tree.Enable_SPI1,
      RCC_Reset  => Clock_Tree.Reset_SPI1);

   package I2C_1 is new STM32G431_I2C
     (Periph     => STM32G431xx.I2C.I2C2_Periph'Access,
      Get_Clock  => Clock_Tree.Get_I2C2_Clock,
      RCC_Enable => Clock_Tree.Enable_I2C2,
      RCC_Reset  => Clock_Tree.Reset_I2C2);

end Instances;