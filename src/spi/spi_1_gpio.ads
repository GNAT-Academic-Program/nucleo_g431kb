--  SPI_1_GPIO — SPI1 GPIO configuration for NUCLEO-G431KB.
--  SCK=PA5 (AF5), MISO=PA6 (AF5), MOSI=PA7 (AF5), CS=PA4 (software-managed).

package SPI_1_GPIO is

   procedure Configure;
   --  Configure PA5, PA6, PA7 for SPI1 alternate function and PA4 as CS output.

end SPI_1_GPIO;
