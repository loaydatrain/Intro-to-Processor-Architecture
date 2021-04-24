`timescale 1ns / 1ps

module ALU(input [31:0] A,
            input [31:0] B,
            input [4:0] shift,
            input [3:0] ALUctr,
            output reg [31:0] op,
            output reg zero,
            output reg overflow);
	        reg signed [31:0] A1,B1;

	always @(*)
		begin
			overflow = 1'b0; //initialise overflow
			zero = 1'bz; //initialise zero
            //A1, B1 used for signed operations
			A1=A; 
			B1=B; 
			case(ALUctr)
			4'b0000 : {overflow,op} = A1 + B1; //ADD,ADDI
			4'b0001 :
				begin //set zero signal
				op=A1-B1;
				case(op)
					32'd0 : zero = 1'b1;
					default : zero = 1'b0;//SUB
				endcase
				end
			4'b0010 : op = A&B;     //AND/I
			4'b0011 : op = A|B;     //OR/I
			4'b0100 : op = A^B;     //XOR/I
			4'b0101 : op = A1 << B1;//SLLV (almost same as SLL)
			4'b0110 : op = ~(A|B);  //NOR
			4'b0111 : op = A1 >> B1;//SRLV,SRA,SRAV (almost samae as SRL)
			4'b1000 : op = A<<shift;//SLL
			4'b1001 : op = A>>shift;//SRL
			4'b1010 : op = A>0;     //BGTZ
			4'b1011 : op = A<=0;    //BLEZ
			4'b1100 : op = ~(A==B); //BNE
			4'b1101 : op = A1 < B1; //SLT,SLTI
			4'b1110 : op = A >> B;  //SRLV
			4'b1111 : op = A < B;   //SLTIU,SLTU
			default : op=32'bz;
			endcase
		end
endmodule
