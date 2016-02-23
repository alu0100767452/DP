module uc(input wire clk, start, q0, qm1, output wire CargaQ, CargaA, CargaM, CargaQm1 ,suma, resta, desplazaA, desplazaQ, resetA, fin);

reg [3:0] state, nextstate;

//Codificación de estados

parameter S0 =  4'b0000;
parameter S1 =  4'b0001;
parameter S2 =  4'b0010;
parameter S3 =  4'b0011;
parameter S4 =  4'b0100;
parameter S5 =  4'b0101;
parameter S6 =  4'b0110;
parameter S7 =  4'b0111;
parameter S8 =  4'b1000;
parameter S9 =  4'b1001;
parameter S10 = 4'b1010;
parameter S11 = 4'b1011;
parameter S12 = 4'b1100;
parameter S13 = 4'b1101;
parameter S14 = 4'b1110;


always @ (posedge clk, posedge start)
    if(start)
        state <= S0;
    else
        state <= nextstate;


always @(*)
    case(state)
        S0: nextstate = S1;
        S1: nextstate = S2;
        S2: nextstate = S3;
        S3: nextstate = S4;
        S4: nextstate = S5;
        S5: nextstate = S6;
        S6: nextstate = S7;
        S7: nextstate = S8;
        S8: nextstate = S9;
        S9: nextstate = S10;
        S10: nextstate = S11;
        S11: nextstate = S12;
        S12: nextstate = S13;
        S13: nextstate = S14;
        S14: nextstate = S14;
        default: nextstate = S0;
    endcase

//Funcion de Salida

assign CargaQ = (state == S0)? 1:0; 
assign CargaM = (state == S0)? 1:0;
assign CargaA = ((state == S0) | suma | resta)? 1:0;
assign resetA = (state == S0)? 1:0;
assign CargaQm1 = (state == S0)? 1:0;
assign suma = (((q0==0)&(qm1==1))|(state == S1)|(state == S3)|(state == S5)|(state == S7)|(state == S9)|(state == S11)|(state == S13))? 1:0;
assign resta = (((q0==1)&(qm1==0))|(state == S1)|(state == S3)|(state == S5)|(state == S7)|(state == S9)|(state == S11)|(state == S13))? 1:0;
assign desplazaA = ((state == S2)|(state == S4)|(state == S6)|(state == S8)|(state == S10)|(state == S12)|(state == S14))? 1:0;
assign desplazaQ = ((state == S2)|(state == S4)|(state == S6)|(state == S8)|(state == S10)|(state == S12)|(state == S14))? 1:0;
assign fin = (state == S14)? 1:0;





endmodule
