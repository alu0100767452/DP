module regM(input wire clk, ResetM, CargaM, input wire [3:0] entM, output wire [3:0] q);
//Registro A de 4 bits, soporta Carga de entA y reseteo

ffdc ffa0(clk, ResetM, CargaM, entM[0], q[0]);
ffdc ffa1(clk, ResetM, CargaM, entM[1], q[1]);
ffdc ffa2(clk, ResetM, CargaM, entM[2], q[2]);
ffdc ffa3(clk, ResetM, CargaM, entM[3], q[3]);

endmodule

