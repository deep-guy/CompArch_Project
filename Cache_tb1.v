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

        file = $fopenr("input_files/swim_modified.trace");
        //file = $fopenr("input_files/gzip_modified.trace");
        //file = $fopenr("input_files/gcc_modified.trace");
        //file = $fopenr("input_files/mcf_modified.trace");
        //file = $fopenr("input_files/twolf_modified.trace");
        while(1) begin
            tmp = $fscanf(file, "%h\n", address);
            #10;

            if($feof(file)) begin
              $display ("Total Hits:    %d", hitCount);
              $display ("Total Misses: %d", missCount);
              $fclose(file);
              $finish;
            end
        end

    end

    always begin
        clk = ~clk;
        #5;
    end


endmodule
