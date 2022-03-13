library verilog;
use verilog.vl_types.all;
entity vending is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        sensor_1        : in     vl_logic;
        sensor_2        : in     vl_logic;
        sensor_3        : in     vl_logic;
        motor_1         : out    vl_logic;
        motor_2         : out    vl_logic;
        motor_3         : out    vl_logic
    );
end vending;
