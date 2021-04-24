`timescale 1ns / 1ps

module Control_Unit(input [31:0] instr, 
                    output reg branch,
                    output reg jump,
                    output reg memwr, 
                    output reg regwr,
                    output reg mem_to_reg,
                    output reg [3:0] ALUctr,
                    output reg [4:0] rs,
                    output reg [4:0] rt,
                    output reg [4:0] rd,
                    output reg [31:0] imm,
                    output reg alu_src,
                    output reg regdst,
                    output reg [4:0] shamt,
                    output reg [15:0] beq_off,
                    output reg [25:0] target_addr,
                    output reg shift_ctrl,
	                output reg sign_ctrl,
	                output reg save_PC);
	
	always @(instr)
		begin
			memwr=1'b0;
			regwr=1'b0;
			mem_to_reg=1'bz;
			alu_src=1'bz;
			regdst=1'bz;
			rs=5'd0;
			rt=5'd0;
			rd=5'd0;
			imm=32'd0;
			ALUctr=4'd15;
			branch=1'b0;
			jump=1'b0;
			shamt=5'dz;
			beq_off=16'd0;
			target_addr=26'd0;
            shift_ctrl = 1'b0;
			sign_ctrl =1'b0;
			save_PC = 1'b0;

        //R TYPE INSTRS    
        if(instr[31:26]==6'b000000 && instr[5:0]==6'b100000)//ADD
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;
            
                ALUctr=4'b0000;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0]==6'b100010)//SUB
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0001;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0]==6'b101010)//SLT
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b1101;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
                sign_ctrl =1'b1;
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0]==6'b100100)//AND
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0010;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0]==6'b100101)//OR
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0011;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b100111)//NOR
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0110;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b100111)//XOR
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0100;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000000)//SLL
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b1000;
                rs=5'd0;
                rt=instr[20:16];
                shamt=instr[10:6];
                rd=instr[15:11];
                shift_ctrl=1'b1;
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000100)//SLLV
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0101;
                rt=instr[20:16];
                rs=instr[25:21];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000011)//SRA
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0111;
                rt=instr[20:16];
                shamt=instr[10:6];
                rs={{26{1'b0}},{instr[10:6]}};
                rd=instr[15:11];
                shift_ctrl=1'b1;
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000111)//SRAV
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0111;
                rs=instr[25:21];
                rt=instr[20:16];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000010)//SRL
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b1001;
                rs=5'd0;
                rt=instr[20:16];
                rd=instr[15:11];
                shamt=instr[10:6];
                shift_ctrl=1'b1;
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b000110)//SRLV
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b0111;
                rt=instr[20:16];
                rs=instr[25:21];
                rd=instr[15:11];
            end
            
        else if(instr[31:26]==6'b000000 && instr[5:0] == 6'b101011)//SLTU
            begin
                alu_src=1'b0;
                memwr=1'b0;
                regwr=1'b1;
                mem_to_reg=1'b0;
                regdst=1'b1;

                ALUctr=4'b1111;
                rt=instr[20:16];
                rs=instr[25:21];
                rd=instr[15:11];
                sign_ctrl =1'b1;
            end
					
				
		//I TYPE INSTRS
		else if(instr[31:26]==6'b001000)//ADDI
			begin
				regdst=1'b0;
				ALUctr=4'b0000;
				rs=instr[25:21];
				imm={{16{instr[15]}},instr[15:0]}; //sign extend
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
			end
		
		else if(instr[31:26]==6'b001100)//ANDI
			begin
				regdst=1'b0;
				ALUctr=4'b0010;
				rs=instr[25:21];
				imm={{16{1'b0}},instr[15:0]}; //zero extend
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
			end
		
		else if(instr[31:26]==6'b001010)//SLTI
			begin
				regdst=1'b0;
				ALUctr=4'b1101;
				rs=instr[25:21];
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
                sign_ctrl=1'b1;
			end
			
		else if(instr[31:26]==6'b001010)//SLTIU
			begin
				regdst=1'b0;
				ALUctr=4'b1111;
				rs=instr[25:21];
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
			end
			
		else if(instr[31:26]==6'b001101)//ORI
			begin
				regdst=1'b0;
				ALUctr=4'b0011;
				rs=instr[25:21];
				imm={{16{1'b0}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
			end
			
		else if(instr[31:26]==6'b001101)//XORI
			begin
				regdst=1'b0;
				ALUctr=4'b0100;
				rs=instr[25:21];
				imm={{16{1'b0}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
			end
			
		else if(instr[31:26] == 6'b000111)//BGTZ
			begin
				rs=instr[25:21];
				rt=instr[20:16];
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				ALUctr=4'b1010;
			end
			
		else if(instr[31:26] == 6'b000110)//BLEZ
			begin
				rs=instr[25:21];
				rt=instr[20:16];
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				ALUctr=4'b1011;
			end
			
		else if(instr[31:26] == 6'b000101)//BNE
			begin
				rs=instr[25:21];
				rt=instr[20:16];
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				ALUctr=4'b1100;
			end
			
		else if(instr[31:26]==6'b100011)//LW
			begin
				regdst=1'b0;
				ALUctr=4'b0000;
				rs=instr[25:21];
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b1;
			end
			
		else if(instr[31:26]==6'b101011)//SW
			begin
				regdst=1'bz;
				ALUctr=4'b0000;
				rs=instr[25:21];
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				memwr=1'b1;
				regwr=1'b0;
				mem_to_reg=1'bz;
			end
		
		else if(instr[31:26]==6'b000100)//BEQ
			begin
				rs=instr[25:21];
				rt=instr[20:16];
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				ALUctr=4'b0001;
			end

        //J TYPE INSTRS	
        else if(instr[31:26]==6'b000010)//JUMP
			begin
				jump=1'b1;
				target_addr[25:0] = instr[25:0];
			end

		else if(instr[31:26]==6'b000011)//JAL
			begin
                save_PC=1'b1;
				jump=1'b1;
				target_addr[25:0] = instr[25:0];
			end
	end
endmodule
