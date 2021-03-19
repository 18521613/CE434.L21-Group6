module rgb2grayscale(grayscale, R, G, B, clk, rst);
    output reg [7:0] grayscale;
    input [7:0] R,
                G,
                B;
    input clk;
    input rst;

    always @ (posedge clk)
    begin
        if(rst)
            grayscale <= 0;
        else
            grayscale <= (R >> 2) + (R >> 5) + (G >> 1) + (G >> 4) + (B >> 4) + (B >> 5);
    end
endmodule
