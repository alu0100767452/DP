//Testbench Multiplicador Booth

`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulación y el paso de simulación

module mult_tb; //Declaracion de modulo del testbench


//declaracion de señales
reg [3:0] valorQ;
reg [3:0] valorM; //las señales de entrada al modulo a testear mimodulo. Se han declarado reg porque queremos inicializarlas
reg clk, start;

wire [7:0] Producto; //señales de salida, se declaran como wire porque sus valores se fijan por el modulo a testear
wire fin;

//Señal del reloj
initial
  begin
      clk = 1'b0;
  end

always
  begin
    clk = !clk;
    #20;
  end


//Pulso de start
initial
  begin
    start = 1'b1;
    #20;
    start = 1'b0;
  end

//Instancia del modulo Mult
mult mbooth(Producto, clk, start, ValorQ, ValorM, fin);

initial
begin
  $monitor("TIEMPO=%0d VALOR_Q=%b VALOR_M=%b START=%b CLK=%b PRODUCTO=%d FIN=%b", $time, valorQ, valorM, start, clk, Producto, fin);      
  $dumpfile("cuenta1_tb.vcd");
  $dumpvars;

  //Variables de test
  valorQ = 4'b0011;
  valorM = 4'b0010;
  #300;

  $finish;  //fin simulacion

end

endmodule



