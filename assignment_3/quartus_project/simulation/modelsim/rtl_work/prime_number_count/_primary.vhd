library verilog;
use verilog.vl_types.all;
entity prime_number_count is
    generic(
        N               : integer := 1000
    );
    port(
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end prime_number_count;
