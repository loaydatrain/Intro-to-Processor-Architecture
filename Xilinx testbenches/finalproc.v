`timescale 1ns / 1ps

module ALU(input [31:0] reg1,
            input [31:0] reg2,
            input [4:0] shift,
            input [3:0] ALUctr,
            output reg [31:0] op,
            output reg zero,
            output reg overflow);
            
	reg signed [31:0] signed1,signed2;
	always @(*)
		begin
			overflow = 1'b0; //initialise overflow
			zero = 1'bz; //initialise zero
            //signed1, signed2 used for signed operations
			signed1=reg1; 
			signed2=reg2; 
			case(ALUctr)
			4'b0000 : 
                    begin
                        op = signed1 + signed2; //ADD,ADDI
                    end
			4'b0001 :
				begin //set zero signal
				op=signed1-signed2;
				case(op)
					32'd0 : zero = 1'b1;
					default : zero = 1'b0;//SUB
				endcase
				end
			4'b0010 : 
                    begin
                        op = reg2 & reg1;     //AND/I
                    end
			4'b0011 : 
                    begin
                        op = reg2 | reg1;     //OR/I
                    end
			4'b0100 : 
                    begin
                        op = reg2 ^ reg1;     //XOR/I
                    end
			4'b0101 : 
                    begin
                        op = signed1 << signed2;//SLLV (almost same as SLL)
                    end
			4'b0110 : 
                    begin
                        op = ~( reg2 | reg1 );  //NOR
                    end
			4'b0111 : 
                    begin
                        op = signed1 >> signed2;//SRLV,SRA,SRAV (almost samae as SRL)
                    end
			4'b1000 : 
                    begin
                        op = reg1<<shift;//SLL
                    end
			4'b1001 : 
                    begin
                        op = reg1>>shift;//SRL
                    end
			4'b1010 : 
                    begin
                        op = reg1>0;     //BGTZ
                    end
			4'b1011 : 
                    begin
                        op = reg1<=0;    //BLEZ
                    end
			4'b1100 : 
                    begin
                        op = ~(reg2 == reg1); //BNE
                    end
			4'b1101 : 
                    begin
                        op = signed1 < signed2; //SLT,SLTI
                    end
			4'b1110 :
                    begin 
                        op = reg1 >> reg2;  //SRLV
                    end
			4'b1111 : 
                    begin
                        op = reg1 < reg2;   //SLTIU,SLTU
                    end
			default : op=32'b0;
			endcase
		end
endmodule

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
					

        case(instr[31:26])
        //i type instructions
		6'b001000: //addi
			begin
                memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
				imm={{16{instr[15]}},instr[15:0]}; //sign extend
				rt=instr[20:16];
				alu_src=1'b1;
                regdst=1'b0;
				ALUctr=4'b0000;
				rs=instr[25:21];
			end
		
		6'b001100: //andi
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;				
				imm={{16{1'b0}},instr[15:0]}; //zero extend
				rt=instr[20:16];
				alu_src=1'b1;
                regdst=1'b0;
				ALUctr=4'b0010;
				rs=instr[25:21];
			end
		
		6'b001010: //SLTI
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
                sign_ctrl=1'b1;
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
                regdst=1'b0;
				ALUctr=4'b1101;
				rs=instr[25:21];
			end
			
		6'b001010: //SLTIU
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				regdst=1'b0;
				ALUctr=4'b1111;
				rs=instr[25:21];
			end
			
        6'b001101: //ORI
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
				imm={{16{1'b0}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				regdst=1'b0;
				ALUctr=4'b0011;
				rs=instr[25:21];
			end
			
        6'b001101: //XORI
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b0;
				imm={{16{1'b0}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				regdst=1'b0;
				ALUctr=4'b0100;
				rs=instr[25:21];
			end
			
        6'b000111://BGTZ
			begin
				ALUctr=4'b1010;
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
                rs=instr[25:21];
				rt=instr[20:16];
                alu_src = 1'b0;
			end
			
        6'b000110: //BLEZ
			begin
				ALUctr=4'b1011;
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				rs=instr[25:21];
				rt=instr[20:16];
                alu_src = 1'b0;
			end
			
		6'b000101: //BNE
			begin
				ALUctr=4'b1100;
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				rs=instr[25:21];
				rt=instr[20:16];
                alu_src = 1'b0;
			end
			
		6'b100011: //LW
			begin
				memwr=1'b0;
				regwr=1'b1;
				mem_to_reg=1'b1;
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				regdst=1'b0;
				ALUctr=4'b0000;
				rs=instr[25:21];
			end
			
		6'b101011: //SW
			begin
				memwr=1'b1;
				regwr=1'b0;
				mem_to_reg=1'bz;
				imm={{16{instr[15]}},instr[15:0]};
				rt=instr[20:16];
				alu_src=1'b1;
				regdst=1'bz;
				ALUctr=4'b0000;
				rs=instr[25:21];
			end
		
		6'b000100: //BEQ
			begin
                ALUctr=4'b0001;
				branch=1'b1;
				beq_off[15:0]=instr[15:0];
				alu_src = 1'b0;
				rs=instr[25:21];
				rt=instr[20:16];
			end

        //J TYPE INSTRS	
        6'b000010://JUMP
			begin
				target_addr[25:0] = instr[25:0];
				jump=1'b1;
			end

		6'b000011://JAL
			begin
				target_addr[25:0] = instr[25:0];
				jump=1'b1;
                save_PC=1'b1;
			end
        endcase
	end
endmodule

module Processor_pipelined( input clk,
                            output [31:0] instr,
                            output reg [31:0] reg_check,
                            output reg [31:0] data_mem_check,
                            output wire [31:0] Rc);

    reg [31:0] PC;
	reg [31:0] pipeline;
	reg [7:0] instructions [0:127];
	reg [31:0] data [0:31];
	reg [31:0] registers [0:31];

	initial begin
        //initialize pipeling register and program counter
        pipeline = 32'bx;
        PC = 32'b0;

        	instructions[0] = 8'b00100000;
	instructions[1] = 8'b00100000;
	instructions[2] = 8'b01000011;
	instructions[3] = 8'b00000000;

	instructions[4] = 8'b00100010;
	instructions[5] = 8'b00100000;
	instructions[6] = 8'b01000011;    
	instructions[7] = 8'b00000000;

	instructions[8] = 8'b00100100;
	instructions[9] = 8'b00100000;
	instructions[10] = 8'b01000011;
	instructions[11] = 8'b00000000;

	instructions[12] = 8'b00100101;
	instructions[13] = 8'b00100000;
	instructions[14] = 8'b01000011;
	instructions[15] = 8'b00000000;

	instructions[16] = 8'b00101010;
	instructions[17] = 8'b00100000;
	instructions[18] = 8'b01000011;
	instructions[19] = 8'b00000000;

	instructions[20] = 8'b00111110;
	instructions[21] = 8'b00000000;
	instructions[22] = 8'b01000011;
	instructions[23] = 8'b00100000;

	instructions[24] = 8'b00111110;
	instructions[25] = 8'b00000000;
	instructions[26] = 8'b01000011;
	instructions[27] = 8'b00101000;			

	instructions[28] = 8'b00000001;
	instructions[29] = 8'b00000000;
	instructions[30] = 8'b01000011;
	instructions[31] = 8'b10001100;	
			

	instructions[32] = 8'b00000001;
	instructions[33] = 8'b00000000;
	instructions[34] = 8'b01000011;
	instructions[35] = 8'b10101100;	


	instructions[36] = 8'b00111110;
	instructions[37] = 8'b00000000;
	instructions[38] = 8'b01000011;
	instructions[39] = 8'b00101000;				
			

	instructions[40] = 8'b00111110;
	instructions[41] = 8'b00000000;
	instructions[42] = 8'b01000011;
	instructions[43] = 8'b00010000;

	instructions[44] = 8'b00111110;
	instructions[45] = 8'b00000000;
	instructions[46] = 8'b01000011;
	instructions[47] = 8'b00001000;

	registers[0] = 0;
	registers[1] = 1;
	registers[2] = 2;
	registers[3] = 3;
	registers[4] = 4;
	registers[5] = 5;

	data[0] = 0;
	data[1] = 10;
	data[2] = 20;
	data[3] = 30;
	data[4] = 40;

	end

    wire zero;
    wire branch;
    wire jump;
	reg [29:0] PC_temp1;
    reg [29:0] PC_temp2;
	wire [25:0] target_addr;
	wire [15:0] beq_offset;
	wire [29:0] incremPC;
    wire [29:0] jumpPC;
	

	//FETCH UNIT
	assign incremPC = PC[31:2] + 30'd1; //regular pc increment
    assign jumpPC = {PC[31:28],target_addr[25:0]}; //pc in case of jump

	always @(branch or zero or incremPC)
		begin
		if(branch & zero)
			PC_temp1 = PC[31:2] + {{14{beq_offset[15]}},beq_offset[15:0]}; //incase of branch instr
		else
			PC_temp1 = PC[31:2]+30'd1; //normal instr
		end

	always @(jumpPC or PC_temp1 or jump)
		begin
		if(jump)
			PC_temp2=jumpPC; //incase of jump instr
		else
			PC_temp2=PC_temp1; //normal instr
		end

    //finally store instr and update pc
	always @(negedge clk)
		begin
		pipeline={instructions[PC+3],instructions[PC+2],instructions[PC+1],instructions[PC]}; //little endian
		PC [31:0] ={PC_temp2,{2{1'b0}}};
		end

    wire [3:0] ALUctr;
    wire [31:0] Rx,temp_Ra,temp_Rb;
	reg [31:0] Ra,Rb,Rm;
	reg [4:0] Rp;
	wire [4:0] rs,rt,rd;
	wire [31:0] imm;
	wire alu_src;
    wire regdst;
	wire [4:0] shift;
	wire shift_ctrl;
	wire sign_ctrl;
	wire overflow;
	wire save_PC;
	wire regwr;
	wire memwr;
	wire mem_to_reg;
    
    assign instr = pipeline; //load current instr
	Control_Unit C1(instr,branch,jump,memwr,regwr,mem_to_reg,ALUctr,rs,rt,rd,imm,alu_src,regdst,shift,beq_offset,target_addr,shift_ctrl,sign_ctrl,save_PC);
							
	assign temp_Ra = registers[rs];
	assign temp_Rb = registers[rt];
	
	always@(temp_Ra or shift or shift_ctrl)
		begin
			if(shift_ctrl)
				begin
					Ra[31:5] = 27'd0;
					Ra[4:0] = shift;
				end
			else
					Ra = temp_Ra;
		end
    
    always @(temp_Rb or imm or alu_src)
		begin
			Rb = 32'bz;
			if(alu_src)
					Rb = imm;
			else
					Rb = temp_Rb;
		end
					
	ALU A1(Ra,Rb,shift,ALUctr,Rc,zero,overflow);
	
	assign Rx = data[Rc];

    always @(regdst or rt or rd)
		begin
			Rp=5'dz;
			if(regdst)
				Rp =rd;
			else if (~regdst)
				Rp=rt;
		end
	
	always @(mem_to_reg or Rx or Rc)
		begin
			Rm=32'dz;
			if(mem_to_reg) 
				Rm=Rx;
			else
				Rm=Rc;
		end

	always@(negedge clk)
		begin
			if(memwr) //incase of save word
			begin
                data_mem_check = temp_Rb;
                data[Rc] = temp_Rb;
			end
		end	
		
	always@(negedge clk)
		begin
			if( ((regwr) | (alu_src)) & ~(overflow))
				begin
					registers[Rp] = Rm;
					reg_check = Rm;
				end
			else if(jump && save_PC)
				begin
					registers[31] = PC+8;
					reg_check = PC+8;
				end
		end 
endmodule
