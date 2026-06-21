`timescale 1ns/1ps

module top_tb;

reg clk;
reg reset;

reg alarm_enable;
reg [4:0] alarm_hour;
reg [5:0] alarm_minute;

wire alarm_out;
wire [5:0] second;
wire [5:0] minute;
wire [4:0] hour;

top DUT(
    .clk(clk),
    .reset(reset),
    .alarm_enable(alarm_enable),
    .alarm_hour(alarm_hour),
    .alarm_minute(alarm_minute),
    .alarm_out(alarm_out),
    .second(second),
    .minute(minute),
    .hour(hour)
);

// Generate VCD file for EPWave
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top_tb);
end

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    alarm_enable = 1;
    alarm_hour   = 0;
    alarm_minute = 1;

    #20;
    reset = 0;

    #80000;
	$finish;
end

endmodule