--  I2C_1_GPIO — I2C2 GPIO configuration for NUCLEO-G431KB.
--  SDA=PA8 (AF4), SCL=PA9 (AF4) — open-drain.

package I2C_1_GPIO is

   procedure Configure;
   --  Configure PA8 and PA9 for I2C2 alternate function (open-drain).

end I2C_1_GPIO;
