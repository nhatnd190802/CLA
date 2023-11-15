module CLA#(
	parameter DWIDTH = 8)(
	input  wire	[(DWIDTH - 1):0] a,
	input  wire	[(DWIDTH - 1):0] b,
	input  wire		   			 cin,
	output wire [(DWIDTH - 1):0] sum,
	output wire        			 cout
	);
	
	wire [ DWIDTH     :0] c;
	wire [(DWIDTH - 1):0] g, p, s;
	
	assign c[0] = cin;
	assign sum  = s;
	assign cout = c[DWIDTH];

	generate
		for (genvar i = 0; i < DWIDTH; i = i + 1) begin
			assign g[i] 	= a[i] & b[i];
			assign p[i] 	= a[i] | b[i];
			assign c[i + 1] = g[i] | (p[i] & c[i]);
		end
	endgenerate
	
	generate
		for (genvar i = 0; i < DWIDTH; i = i + 1) begin
			full_adder_cell FA(.a(a[i]), .b(b[i]), . cin(c[i]), .sum(s[i]), . cout());
		end
	endgenerate
	
endmodule
