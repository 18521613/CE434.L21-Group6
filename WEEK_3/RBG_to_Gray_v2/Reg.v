module Reg( ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, WriteData1, WriteData2, WriteData3, WriteData4, WriteData5, WriteData6, ReadWriteEn, clk);
	
	output [15:0] ReadData1;
	output [15:0] ReadData2;
	output [15:0] ReadData3;
	output [15:0] ReadData4;
	output [15:0] ReadData5;
	output [15:0] ReadData6;
	
	input clk;
	input ReadWriteEn;
	input [15:0]WriteData1;
	input [15:0]WriteData2;
	input [15:0]WriteData3;
	input [15:0]WriteData4;
	input [15:0]WriteData5;
	input [15:0]WriteData6;
	
	reg [15:0] RD1;
	reg [15:0] RD2;
	reg [15:0] RD3;
	reg [15:0] RD4;
	reg [15:0] RD5;
	reg [15:0] RD6;
	
	assign ReadData1 = RD1;
	assign ReadData2 = RD2;
	assign ReadData3 = RD3;
	assign ReadData4 = RD4;
	assign ReadData5 = RD5;
	assign ReadData6 = RD6;
	
	
	
	
	always @(posedge clk) begin
		if (!ReadWriteEn)
		begin	
		RD1 <= 0;
		RD2 <= 0;
		RD3 <= 0; 
		RD4 <= 0; 
		RD5 <= 0; 
		RD6 <= 0;
		end
		else
		begin
		RD1 <= WriteData1;
		RD2 <= WriteData2;
		RD3 <= WriteData3; 
		RD4 <= WriteData4; 
		RD5 <= WriteData5; 
		RD6 <= WriteData6;
		end
	end

endmodule