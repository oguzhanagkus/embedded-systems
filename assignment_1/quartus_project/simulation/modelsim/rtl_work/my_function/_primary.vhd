library verilog;
use verilog.vl_types.all;
entity my_function is
    port(
        x               : in     vl_logic_vector(7 downto 0);
        y               : in     vl_logic_vector(7 downto 0);
        result          : out    vl_logic_vector(11 downto 0)
    );
end my_function;
