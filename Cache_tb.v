module cache_tb();

    wire[31:0] hitCount, missCount;
    reg clk;
    reg[31:0] address;

    DMCache uut (
        .hitCount(hitCount),
        .missCount(missCount),
        .clk(clk),
        .address(address)
    );

    initial begin
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;
        address = 858;
        clk = 1;
        #50;
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;
        address = 2233;
        clk = 1;
        #50;
        clk = 0;
        #50;
        clk = 1;
        #50;
        clk = 0;
        #50;
        address = 858;
        clk = 1;
        #50;
    end
endmodule
