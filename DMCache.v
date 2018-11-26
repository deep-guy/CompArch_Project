module DMCache(address, missCount, hitCount, clk);

reg[31:0] cache [255:0][15:0];
reg [19:0] tagArray [255:0];
input [31:0] address;
input clk;
output reg [31:0] missCount = 0, hitCount = 0;
reg[19:0] tag;
reg[7:0] index;
reg[4:0] i;
reg[31:0] addressCopy;


always @(posedge clk)
begin
    index = address[11:4];
    tag = address[31:12];
    if (tagArray[index] == tag) begin
        hitCount = hitCount + 1;
        $display ("Cache hit!! %d", hitCount);
    end
    else begin
        missCount = missCount + 1;
        $display ("Cache Miss %d", missCount);
        addressCopy = address;
        addressCopy[3:0] = 0;
        tagArray[index] = tag;
        for (i = 0; i < 16; i = i + 1) begin
            cache[index][i] = addressCopy + i;
            // $display("address: %d", cache[index][i]);
        end
    end 
end

endmodule