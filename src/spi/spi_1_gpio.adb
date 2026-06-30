with Gpio;
with Gpio_Types;
with Board_GPIO;

package body SPI_1_GPIO is

   procedure Configure is
      Spi_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Alternate,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.Low,
         AF         => 5);

      Cs_Cfg : constant Gpio_Types.Gpio_Config :=
        (Mode       => Gpio_Types.Output,
         Pull       => Gpio_Types.None,
         Drive      => Gpio_Types.Push_Pull,
         Speed      => Gpio_Types.Very_High_Speed,
         Init_State => Gpio_Types.High);
   begin
      Gpio.Configure (Board_GPIO.SPI1_SCK, Spi_Cfg);
      Gpio.Configure (Board_GPIO.SPI1_MISO, Spi_Cfg);
      Gpio.Configure (Board_GPIO.SPI1_MOSI, Spi_Cfg);
      Gpio.Configure (Board_GPIO.SPI1_CS, Cs_Cfg);
   end Configure;

end SPI_1_GPIO;
