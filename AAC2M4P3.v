module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

reg [1:0]state;
reg current;
reg next;

always@(posedge CLK)
begin
  if(RST == 1)
    begin
      state <= "00";
      Out1 <= 0;  
    end
  else
    begin
      case(state)
      2'b00:
        if (In1==1) 
          begin
            state <= 2'b01;
            Out1 <= 0;
          end
        else
          begin
            state <= 2'b00;
            Out1 <= 0;
          end
      2'b01:
        if (In1==1) 
          begin
            state <= 2'b10;
            Out1 <= 1;
          end
        else
          begin
            state <= 2'b01;
            Out1 <= 0;
          end
      2'b10:
        if (In1==1) 
          begin
            state <= 2'b00;
            Out1 <= 0;
          end
        else
          begin
            state <= 2'b10;
            Out1 <= 1;
          end
        default:
          begin
            state <= 2'b00;
            Out1 <= 0;
          end
      endcase
    end
end
endmodule

  