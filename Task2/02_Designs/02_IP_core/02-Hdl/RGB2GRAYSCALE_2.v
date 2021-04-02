module RGB2GRAYSCALE_2 (R, G, B, Grayscale, clk, Valid_in, Valid_out, rst);
    output reg Valid_out;
    output [7:0] Grayscale;

    input  [7:0]    R,
                    G,
                    B;
    input           clk,
                    rst,
                    Valid_in;

    wire [15:0] red,
				green,
				blue;
    
    reg [15:0] temp;
    reg [15:0] shift_1;
    reg [15:0] shift_2;
    reg [15:0] shift_3;
    reg [15:0] shift_4;
    reg [15:0] shift_5;
    reg [15:0] shift_6;

    assign red   	 = {R[7:0],8'd0};
	assign green 	 = {G[7:0],8'd0};
	assign blue		 = {B[7:0],8'd0};
    assign Grayscale = temp[15:8];

    
    always @( posedge clk or posedge rst) begin
        if(rst == 1)
        begin
            shift_1 <= 0;
            shift_2 <= 0;
            shift_3 <= 0;
            shift_4 <= 0;
            shift_5 <= 0;
            shift_6 <= 0;   
        end
        else
        begin
            shift_1 <= red      >> 2;
            shift_2 <= red      >> 5;
            shift_3 <= green    >> 1;
            shift_4 <= green    >> 4;
            shift_5 <= blue     >> 4;
            shift_6 <= blue     >> 5;
        end 
    end

    reg [15:0] add_1;
    reg [15:0] add_2;
    reg [15:0] add_3;

    always @( posedge clk or posedge rst) begin
        if(rst == 1)
        begin
            add_1 <= 0;
            add_2 <= 0;
            add_3 <= 0;
        end
        else
        begin
            add_1 <= shift_1 + shift_2;
            add_2 <= shift_3 + shift_4;
            add_3 <= shift_5 + shift_6;
        end 
    end

    reg [15:0] add_1_1;
    reg [15:0] add_2_1;

    always @( posedge clk or posedge rst) begin
        if(rst == 1)
        begin
            add_1_1 <= 0;
            add_2_1 <= 0;
        end
        else
        begin
            add_1_1 <= add_1 + add_2;
            add_2_1 <= add_3;
        end 
    end

    always @( posedge clk) begin
        if  (Valid_in == 0)
        begin
            Valid_out <= 0;
        end
        else
        begin
            temp <= add_1_1 + add_2_1;
            Valid_out <= 1;
        end
    end
    
endmodule

// module RGB2GRAYSCALE_2 (R, G, B, Grayscale, clk, Valid_in, Valid_out);
//     output reg Valid_out;
//     output [7:0] Grayscale;

//     input  [7:0]    R,
//                     G,
//                     B;
//     input           clk,
//                     Valid_in;

//     wire [15:0] red,
// 				green,
// 				blue;
    
//     reg [15:0] temp;
//     reg [15:0] shift_1;
//     reg [15:0] shift_2;
//     reg [15:0] shift_3;
//     reg [15:0] shift_4;
//     reg [15:0] shift_5;
//     reg [15:0] shift_6;

//     assign red   	 = {R[7:0],8'd0};
// 	assign green 	 = {G[7:0],8'd0};
// 	assign blue		 = {B[7:0],8'd0};
//     assign Grayscale = temp[15:8];

    
//     always @( posedge clk) begin
//         if(Valid_in == 0)
//         begin
//             Valid_out = 0;
//             shift_1 <= red  ;
//             shift_2 <= red  ;
//             shift_3 <= green;
//             shift_4 <= green;
//             shift_5 <= blue ;
//             shift_6 <= blue ;
// 		end
//         else
//         begin
//             Valid_out = 1;
//             shift_1 <= red      >> 2;
//             shift_2 <= red      >> 5;
//             shift_3 <= green    >> 1;
//             shift_4 <= green    >> 4;
//             shift_5 <= blue     >> 4;
//             shift_6 <= blue     >> 5;  
//         end
//     end

//     reg [15:0] add_1;
//     reg [15:0] add_2;
//     reg [15:0] add_3;

//     always @( posedge clk) begin
//         add_1 <= shift_1 + shift_2;
//         add_2 <= shift_3 + shift_4;
//         add_3 <= shift_5 + shift_6;
//     end

//     reg [15:0] add_1_1;
//     reg [15:0] add_2_1;

//     always @( posedge clk) begin
//         add_1_1 <= add_1 + add_2;
//         add_2_1 <= add_3;
//     end

//     always @( posedge clk) begin
//         temp <= add_1_1 + add_2_1;
//     end
    
// endmodule





    