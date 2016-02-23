module ComplementoA2(input wire sumar, restar, input wire [3:0] entM, output reg [3:0] complement);

    wire [3:0] aux;

    always @*
    begin
	    if (restar)
	    begin
		    //not not1(aux, entM);
            //not n0(aux[0], entM[0]);
            //not n1(aux[1], entM[1]);
            //not n2(aux[2], entM[2]);
            //not n3(aux[3], entM[3]);
		    //assign complement = aux + 4'b0001;
	    end
        if (sumar)
		    assign complement = entM;
    end


endmodule
