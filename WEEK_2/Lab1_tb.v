`timescale 1ns/1ps

module Lab1_tb ();
    reg [7:0] RED,
              BLUE,
              GREEN;
    reg CLK, 
        RESET;
    wire [7:0] GRAYSCALE;
    
    reg [7:0] mem [0:524288];
    integer i,
            write_data;

    initial begin
        CLK <= 0;
        RESET <= 1;
        #120
        
        RESET <= 0;
        $readmemb("data.txt", mem);
        write_data = $fopen("write_mem.txt");
        for (i=0; i < 90000; i=i+1)
        begin
            RED   = mem[0 + i];
            GREEN = mem[90000 + i];
            BLUE  = mem[180000 + i];
            #80

            $fdisplay(write_data, "%b", GRAYSCALE);
        end

        $fclose(write_data);
        $finish;
    end

    always @(CLK)
        #40 CLK <= ~CLK;

    rgb2grayscale dut 
        (.grayscale(GRAYSCALE), 
        .R(RED), 
        .G(GREEN), 
        .B(BLUE), 
        .clk(CLK), 
        .rst(RESET));
endmodule