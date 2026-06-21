module digital_clock(
input tick,
input reset,

output reg [5:0] second,
output reg [5:0] minute,
output reg [4:0] hour
);

always @(posedge tick or posedge reset)
begin
    if(reset)
    begin
        second <= 0;
        minute <= 0;
        hour <= 0;
    end

    else
    begin

        if(second == 59)
        begin
            second <= 0;

            if(minute == 59)
            begin
                minute <= 0;

                if(hour == 23)
                    hour <= 0;
                else
                    hour <= hour + 1;
            end
            else
                minute <= minute + 1;
        end
        else
            second <= second + 1;

    end
end

endmodule
