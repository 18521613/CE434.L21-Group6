`timescale 1ns/1ps

module Lab2_tb ();
    reg [7:0] RED,
              BLUE,
              GREEN;
    reg VALID_IN;
    reg CLK;
    reg RST;
    wire [7:0]  GRAYSCALE;
    wire VALID_OUT;
    
    reg [7:0] mem [0:1229760];
    
    integer          i,
            write_data;

    initial begin
        CLK <= 0;
	    RST <= 0;
        #120
        
        $readmemb("/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/03_Python/data.txt", mem);
        write_data = $fopen("/home/tmt/CE434_L21_Group6/WEEK_3/02_Designs/05_Output/02_Modelsim/write_mem.txt");
        for (i=0; i < 409920; i=i+1)
        begin
            VALID_IN = 1;
            RED   <= mem[0 + i];
            GREEN <= mem[409920 + i];
            BLUE  <= mem[819840 + i];
            #80
    
            if(i > 2)
            begin
       	        $fdisplay(write_data, "%b", GRAYSCALE);
            end
        end
            VALID_IN = 0;

        for (i=0; i < 2; i=i+1)
        begin
           $fdisplay(write_data, "%b", GRAYSCALE); 
        end

	#500 $finish;
         $fclose(write_data);
        
    end

    always @(CLK)
        #40 CLK <= ~CLK;

    RGB2GRAYSCALE_2 dut 
        (.Grayscale(GRAYSCALE), 
        .R(RED), 
        .G(GREEN), 
        .B(BLUE), 
        .clk(CLK),
        .Valid_in(VALID_IN),
        .Valid_out(VALID_OUT),
	    .rst(RST)
        );
endmodule
