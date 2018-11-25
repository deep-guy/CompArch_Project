module DMCache(address, missCount, hitCount, clk);

reg[8:0] cache [255:0][63:0];
reg [17:0] tagArray [255:0];
input [31:0] address;
input clk;
output reg [31:0] missCount = 0, hitCount = 0;
reg[17:0] tag;
reg[7:0] index;
reg[6:0] i;
reg[31:0] addressCopy;


always @(address)
begin
    index = address[13:6];
    tag = address[31:14];
    if (tagArray[index] == tag) begin
        hitCount = hitCount + 1;
        $display ("Cache hit!! %d", hitCount);
    end
    else begin
        missCount = missCount + 1;
        $display ("Cache Miss %d", missCount);
        addressCopy = address;
        addressCopy[5:0] = 0;
        tagArray[index] = tag;
        for (i = 0; i < 64; i = i + 1) begin
            cache[index][i] = addressCopy + i;
            // $display("address: %d", cache[index][i]);
        end
    end 
end

endmodule