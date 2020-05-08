module controller2 (Clock,reset,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,c0,c1,c2,c3,c4,c5,c7,c8,c9,c10,c11,c12,c13,c14,c15);
	input Clock,reset,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10;
	output reg c0,c1,c2,c3,c4,c5,c7,c8,c9,c10,c11,c12,c13,c14,c15;
	reg[4:0] state,nextstate;
	parameter A=5'b0, B=5'b1, C=5'b10, D=5'b11, E=5'b100, F=5'b110, G=5'b101, H=5'b111, I=5'b1000, I1=5'b1001, I2= 5'b1010, I3=5'b1011, J1=5'b1100,
	J2=5'b1101, J3=5'b1110, K1=5'b1111, K2=5'b10000, K3=5'b10001, K4=5'b10010, K5=5'b10011;
	always @ (posedge Clock, negedge reset)
		if (reset ==1'b0) state <= A;
			else state <= nextstate;
	always @ (state)
		case(state)
			A: begin nextstate = B;c0=1'b1;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			B: begin nextstate = C;c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			C: begin nextstate = D;c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			D: begin nextstate = E;c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			E: begin if(d5 == 1'b1) nextstate =F; //INC
							else if(d6 ==1'b1) nextstate =G; //CLR
							else if(d7 ==1'b1) nextstate =H; //JMP
							else if (d0==1'b1) nextstate = I; //LDAs
							else if (d1==1'b1) nextstate=J1; //STAs
							else if (d2==1'b1) nextstate=K1;//ADDs
						c0=1'b0;c1=1'b0;c2=1'b1;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b1;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			
			
			F: begin nextstate = B;	 c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b1;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			G: begin nextstate = B;	 c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b1;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			H: begin nextstate = B;	 c0=1'b0;c1=1'b1;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			
			//LDA 
			I: begin nextstate = I1;  c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			I1: begin nextstate = I2; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // LDAs
			I2: begin nextstate = I3; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			I3: begin nextstate = B;  c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b1;c12=1'b0;c13=1'b0;c14=1'b0;end
			
			//STA
			J1: begin nextstate = J2; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // STAs
			J2: begin nextstate = J3; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b1;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // STAs
			J3: begin nextstate = B;  c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b1;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // STAs
			
			
			//ADD
			K1: begin nextstate = K2; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // ADDs
			K2: begin nextstate = K3; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // ADDs
			K3: begin nextstate = K4; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b1;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end // ADDs
			K4: begin nextstate = K5; c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b1;end // ADDs
			K5: begin nextstate = B;  c0=1'b0;c1=1'b0;c2=1'b0;c3=1'b1;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b1;c11=1'b1;c12=1'b0;c13=1'b0;c14=1'b0;end // ADDs
			
			//default: begin nextstate=A; c0=1'b1;c1=1'b0;c2=1'b0;c3=1'b0;c4=1'b0;c5=1'b0;c7=1'b0;c8=1'b0;c9=1'b0;c10=1'b0;c11=1'b0;c12=1'b0;c13=1'b0;c14=1'b0;end
			
		endcase
endmodule
						
	