module top(

input clk,
input reset,

input alarm_enable,
input [4:0] alarm_hour,
input [5:0] alarm_minute,

output alarm_out,

output [5:0] second,
output [5:0] minute,
output [4:0] hour
);

wire tick;

clock_divider #(100)
u1
(
.clk(clk),
.reset(reset),
.tick(tick)
);

digital_clock u2
(
.tick(tick),
.reset(reset),
.second(second),
.minute(minute),
.hour(hour)
);

alarm_comparator u3
(
.minute(minute),
.hour(hour),

.alarm_minute(alarm_minute),
.alarm_hour(alarm_hour),

.alarm_enable(alarm_enable),

.alarm_out(alarm_out)
);

endmodule