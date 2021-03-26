module RGB2GRAYSCALE(grayscale, R, G, B, clk, Valid_in, Valid_out);
    output  reg [7:0] grayscale;
	output  reg	      Valid_out;

	input 	Valid_in;
    input   [7:0] R,
                  G,
                  B;
    input clk;
//  input rst;

	wire [15:0] red,
				green,
				blue;

	wire [7:0] temp;
	assign red   	= {R[7:0],8'd0};
	assign green 	= {G[7:0],8'd0};
	assign blue		= {B[7:0],8'd0};

	Temp inst_1 (.red(red), 
				 .green(green), 
				 .blue(blue), 
				 .grayscale(temp),
				 .clk(clk)
				);
		
//	assign grayscale = out_writedata1_reg_5 [15:8];
	
	always @ (posedge clk)
	begin
		if(Valid_in == 0)
			begin
				grayscale <= 8'd0 ;
				Valid_out <= 0;
			end
		else
		if(temp == 8'bxxxxxxxx )
			begin
				Valid_out <= 0;
				grayscale <= 8'd0;
			end

		else 
			begin
				Valid_out <= 1;
				grayscale <= temp;
			end
	end
	
endmodule
