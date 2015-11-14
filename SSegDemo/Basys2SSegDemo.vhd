library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Basys2SSegDemo is
	port (
		CLK  :  in std_logic;
		SW   :  in std_logic_vector (7 downto 0);
		AN   : out std_logic_vector ( 3 downto 0);
		SEG  : out std_logic_vector ( 6 downto 0)
	);
end Basys2SSegDemo;

architecture Behavioral of Basys2SSegDemo is
	component CA4DigSSeg14BitDriver is
		port (
			CLK  :  in std_logic;
			RST  :  in std_logic;
			BCD  :  in std_logic_vector (13 downto 0);
			AN   : out std_logic_vector ( 3 downto 0);
			LED  : out std_logic_vector ( 6 downto 0)
		);
	end component;
begin
	Driver: CA4DigSSeg14BitDriver port map(
		CLK => CLK,
		RST => '0',
		BCD(13 downto 8) => "000000",
		BCD(7 downto 0) => SW,
		AN => AN,
		LED => SEG
	);
end Behavioral;

