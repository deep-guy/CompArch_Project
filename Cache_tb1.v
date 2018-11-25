module cache_tb();

    wire[31:0] hitCount, missCount;
    reg clk;
    reg[31:0] address;
    integer file;
    integer tmp;

    DMCache uut (
        .hitCount(hitCount),
        .missCount(missCount),
        .clk(clk),
        .address(address)
    );

    initial begin
        clk = 0; #5
        clk = 1; #5

        file = $fopen("input_files/swim_modified.trace", "r");
        while(! $feof(file)) begin
          tmp = $fscanf(file, "%h\n", address);
          #10;
        end
        $fclose(file);
        #1000 $finish;
    end

    always begin
        clk = ~clk;
        #5;
    end


endmodule
