module Temp (red, green, blue, grayscale, clk);

    output [7:0] grayscale;
    input clk;
    input  [15:0]   red,
                  green,
                   blue;

    wire [15:0] out_writedata1_reg_1,
				out_writedata2_reg_1,
				out_writedata3_reg_1,
				out_writedata4_reg_1,
				out_writedata5_reg_1,
				out_writedata6_reg_1;
	wire [15:0] out_writedata1_reg_2,
				out_writedata2_reg_2,
				out_writedata3_reg_2,
				out_writedata4_reg_2,
				out_writedata5_reg_2,
				out_writedata6_reg_2;
	wire [15:0] out_writedata1_reg_3,
				out_writedata2_reg_3,
				out_writedata3_reg_3;
	wire [15:0] out_writedata1_reg_4,
				out_writedata2_reg_4;
    wire [15:0] temp;

    assign grayscale = temp [15:8];

	Reg reg_1  (.ReadData1(out_writedata1_reg_1), 
				.ReadData2(out_writedata2_reg_1), 
				.ReadData3(out_writedata3_reg_1), 
				.ReadData4(out_writedata4_reg_1), 
				.ReadData5(out_writedata5_reg_1), 
				.ReadData6(out_writedata6_reg_1), 
				.WriteData1(red  ), 
				.WriteData2(red  ), 
				.WriteData3(green), 
				.WriteData4(green), 
				.WriteData5(blue ), 
				.WriteData6(blue ), 
				.ReadWriteEn(1), 
				.clk(clk)
				);
				
	Reg reg_2  (.ReadData1(out_writedata1_reg_2), 
				.ReadData2(out_writedata2_reg_2), 
				.ReadData3(out_writedata3_reg_2), 
				.ReadData4(out_writedata4_reg_2), 
				.ReadData5(out_writedata5_reg_2), 
				.ReadData6(out_writedata6_reg_2), 
				.WriteData1(out_writedata1_reg_1 >> 2), 
				.WriteData2(out_writedata2_reg_1 >> 5), 
				.WriteData3(out_writedata3_reg_1 >> 1), 
				.WriteData4(out_writedata4_reg_1 >> 4), 
				.WriteData5(out_writedata5_reg_1 >> 4), 
				.WriteData6(out_writedata6_reg_1 >> 5), 
				.ReadWriteEn(1), 
				.clk(clk)
				);  
				
	Reg reg_3  (.ReadData1(out_writedata1_reg_3), 
				.ReadData2(out_writedata2_reg_3), 
				.ReadData3(out_writedata3_reg_3), 
				.ReadData4(), 
				.ReadData5(), 
				.ReadData6(), 
				.WriteData1(out_writedata1_reg_2 + out_writedata2_reg_2), 
				.WriteData2(out_writedata3_reg_2 + out_writedata4_reg_2), 
				.WriteData3(out_writedata5_reg_2 + out_writedata6_reg_2), 
				.WriteData4(16'b0), 
				.WriteData5(16'b0), 
				.WriteData6(16'b0), 
				.ReadWriteEn(1), 
				.clk(clk)
				);

	Reg reg_4  (.ReadData1(out_writedata1_reg_4), 
				.ReadData2(out_writedata2_reg_4), 
				.ReadData3(), 
				.ReadData4(), 
				.ReadData5(), 
				.ReadData6(), 
				.WriteData1(out_writedata1_reg_3 + out_writedata2_reg_3), 
				.WriteData2(out_writedata3_reg_3                       ), 
				.WriteData3(16'b0), 
				.WriteData4(16'b0), 
				.WriteData5(16'b0), 
				.WriteData6(16'b0), 
				.ReadWriteEn(1), 
				.clk(clk)
				);					

	Reg reg_5  (.ReadData1(temp), 
				.ReadData2(), 
				.ReadData3(), 
				.ReadData4(), 
				.ReadData5(), 
				.ReadData6(), 
				.WriteData1(out_writedata1_reg_4 + out_writedata2_reg_4), 
				.WriteData2(16'b0), 
				.WriteData3(16'b0), 
				.WriteData4(16'b0), 
				.WriteData5(16'b0), 
				.WriteData6(16'b0), 
				.ReadWriteEn(1), 
				.clk(clk)
				);


endmodule