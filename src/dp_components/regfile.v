module RegFile (
    input clk, rst,
    input write_enable,
    input [4:0] read_addr1, read_addr2, write_addr,
    input [31:0] write_data,
    output [31:0] read_data1, read_data2
);
    reg [31:0] register_file [0:31];
    // integer i;
    // initial
    // begin
    //     for(i=1; i<=32; i+=1) begin
    //         register_file[i-1] = 0;
    //     end    
    // end

    // reset registers
    integer i;
    always @(posedge clk) 
    begin
        if(rst)
        begin
            for(i=0; i<=31; i+=1)
            begin
                register_file[i] <= 0;
            end
        end
    end

    // write register
    always @(negedge clk) 
    begin
        if(write_enable)
        begin
            register_file[write_addr] <= write_data;
        end
    end

    // read register, notice that the register of address 0 is alway 0 and it should not be modified
    assign read_data1 = (read_addr1!=0) ? register_file[read_addr1] : 0;
    assign read_data2 = (read_addr2!=0) ? register_file[read_addr2] : 0;

endmodule