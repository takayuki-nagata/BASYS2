library IEEE;
use ieee.std_logic_1164.all;

entity CA4DigSSeg14BitDriver is
	port (
		CLK  :  in std_logic;
		RST  :  in std_logic;
		BCD  :  in std_logic_vector (13 downto 0);
		AN   : out std_logic_vector ( 3 downto 0);
		LED  : out std_logic_vector ( 6 downto 0)
	);
end CA4DigSSeg14BitDriver;

architecture Behavioral of CA4DigSSeg14BitDriver is
	component SSeg4DigSelector
		Port (
			CLK  :  in std_logic;
			RST  :  in std_logic;
			DIG0 :  in std_logic_vector (3 downto 0);
			DIG1 :  in std_logic_vector (3 downto 0);
			DIG2 :  in std_logic_vector (3 downto 0);
			DIG3 :  in std_logic_vector (3 downto 0);
			AN   : out std_logic_vector (3 downto 0);
			DIG  : out std_logic_vector (3 downto 0)
		);
	end component;
	component Spritter14BitTo4Dig
		Port (
			BCD  : in std_logic_vector (13 downto 0);
			DIG0 : out std_logic_vector ( 3 downto 0);
			DIG1 : out std_logic_vector ( 3 downto 0);
			DIG2 : out std_logic_vector ( 3 downto 0);
			DIG3 : out std_logic_vector ( 3 downto 0)
		);
	end component;
	component SSegDecoder
		Port (
			DIG :  in std_logic_vector (3 downto 0);
			LED : out std_logic_vector (6 downto 0)
		);
	end component;
	signal DIG0 : std_logic_vector (3 downto 0);
	signal DIG1 : std_logic_vector (3 downto 0);
	signal DIG2 : std_logic_vector (3 downto 0);
	signal DIG3 : std_logic_vector (3 downto 0);
	signal DIG  : std_logic_vector (3 downto 0);
begin
	Spritter: Spritter14BitTo4Dig port map(
		BCD  => BCD,
		DIG0 => DIG0,
		DIG1 => DIG1,
		DIG2 => DIG2,
		DIG3 => DIG3
	);
	Selector: SSeg4DigSelector port map(
		CLK  => CLK,
		RST  => RST,
		DIG0 => DIG0,
		DIG1 => DIG1,
		DIG2 => DIG2,
		DIG3 => DIG3,
		AN   => AN,
		DIG  => DIG
	);
	Decoder: SSegDecoder port map(
		DIG => DIG,
		LED => LED
	);
end Behavioral;

