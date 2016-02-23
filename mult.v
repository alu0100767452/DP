module mult(output wire [7:0] producto, input wire clk, start, input wire [3:0] multiplicador, multiplicando, output wire fin);

wire CargaQ, CargaA, CargaM, ResetA, ResetQm1, DesplazaA, DesplazaQ;
wire [3:0] EntA, EntQ, SalA, EntM, SalM, SalQ;
wire [7:0] SalAQ;
wire q0, qm1;
wire suma, resta;

assign SalAQ = SalA + SalQ;
assign producto = SalAQ;
assign /*multiplicador =*/ EntQ = multiplicador;
assign /*multiplicando =*/ EntM = multiplicando;

sum4 sum4(EntA,,, SalA, EntM, 1'b0, suma, resta);
regA A(EntA, CargaA, DesplazaA, clk, ResetA, SalA);
regM M(clk, ,CargaM, multiplicando, SalM);
regQ Q(multiplicador, CargaQ, DesplazaQ, clk,,1'b0, SalQ);
uc UC(clk, start, q0, qm1, CargaQ, CargaA, CargaM, ResetQm1, suma, resta, DesplazaA, DesplazaQ, ResetA, fin);



endmodule


