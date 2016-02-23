module ComplementoA2(input wire sumar, restar, input wire [3:0] entM, output wire [4:0] complement);

    wire [3:0] aux;

	if (restar)
	begin
		not not1(aux, valor);
		complement = aux + 4'b0001;
	end

	if (sumar)
		complement = valor;

endmodule
