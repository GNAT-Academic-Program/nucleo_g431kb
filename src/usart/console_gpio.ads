--  Console_GPIO — USART2 GPIO configuration for NUCLEO-G431KB.
--  TX=PA2 (AF7), RX=PA3 (AF7) — wired to ST-LINK VCP/USB.

package Console_GPIO is

   procedure Configure;
   --  Configure PA2 and PA3 for USART2 alternate function.

end Console_GPIO;
