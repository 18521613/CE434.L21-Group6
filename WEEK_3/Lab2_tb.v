`timescale 1ns/1ps

module Lab2_tb ();
    reg [7:0] RED,
              BLUE,
              GREEN;
    reg VALID_IN;
    reg CLK;
    wire [7:0]  GRAYSCALE;
    wire VALID_OUT;
    
    reg [7:0] mem [0:524288];
    
    integer          i,
            write_data;

    initial begin
        CLK <= 0;
        #120
        
        $readmemb("data.txt", mem);
        write_data = $fopen("write_mem.txt");

        for (i=0; i < 90000; i=i+1)
        begin
            RED   <= mem[0 + i];
            GREEN <= mem[90000 + i];
            BLUE  <= mem[180000 + i];
            #80
            if((RED == 8'bxxxxxxxx) || (GREEN == 8'bxxxxxxxx) || (BLUE == 8'bxxxxxxxx))
            begin
                RED   <= 8'b0;
                GREEN <= 8'b0;
                BLUE  <= 8'b0;
                VALID_IN = 1'b0;
            end
            else
            begin
                VALID_IN = 1;
            end
        
            if(i > 4)
            begin
       	        $fdisplay(write_data, "%b", GRAYSCALE);
            end
        end

        for (i=0; i < 5; i=i+1)
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
        .Valid_out(VALID_OUT)
        );
endmodule
