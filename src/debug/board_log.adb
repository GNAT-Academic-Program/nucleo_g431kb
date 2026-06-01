with Board;
with Instances;

package body Board_Log is
   procedure Write (Buf : Storage_Array) is
      Written : Storage_Offset;
   begin
      if not Instances.Console.Is_Enabled (Board.CONSOLE_DEV) then
         raise Program_Error with "Board_Log: console not initialized";
      end if;
      Board.Console.Write (Board.CONSOLE_DEV, Buf, Written);
   end Write;
end Board_Log;