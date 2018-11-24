module DMCache(address, missCount, hitCount, clk);

reg[31:0] cache [255:0][15:0];
reg [19:0] tagArray [255:0];
input [31:0] address;
input clk;
output reg [31:0] missCount = 0, hitCount = 0;
reg[19:0] tag;
reg[7:0] index;
reg[4:0] i;


always @(address)
begin
    index = address[11:4];
    tag = address[31:12];
    if (tagArray[index] == tag) begin
        hitCount = hitCount + 1;
        $display ("Cache hit!!\n");
    end
    else begin
        missCount = missCount + 1;
        $display ("Cache Miss :(\n");
        tagArray[index] = tag;
        for (i = 0; i < 16; i = i + 1) begin
            cache[index][i] = address;
        end
    end 
end

endmodule