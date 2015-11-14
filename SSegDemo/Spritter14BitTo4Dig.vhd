library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Spritter14BitTo4Dig is
    Port (
		BCD  : in std_logic_vector (13 downto 0);
		DIG0 : out std_logic_vector ( 3 downto 0);
		DIG1 : out std_logic_vector ( 3 downto 0);
		DIG2 : out std_logic_vector ( 3 downto 0);
		DIG3 : out std_logic_vector ( 3 downto 0)
	);
end Spritter14BitTo4Dig;

architecture Behavioral of Spritter14BitTo4Dig is
begin
	process(BCD)
		variable TMP : integer range 0 to 16383;
		variable D0  : integer range 0 to 15;
		variable D1  : integer range 0 to 15;
		variable D2  : integer range 0 to 15;
		variable D3  : integer range 0 to 15;
	begin
		TMP := conv_integer(BCD);
		
		if(TMP >= 10000) then
			TMP := TMP - 10000;
		end if;
		
		if(TMP >= 9000) then
			D3 := 9;
		elsif(TMP >= 8000) then
			D3 := 8;
		elsif(TMP >= 7000) then
			D3 := 7;
		elsif(TMP >= 6000) then
			D3 := 6;
		elsif(TMP >= 5000) then
			D3 := 5;
		elsif(TMP >= 4000) then
			D3 := 4;
		elsif(TMP >= 3000) then
			D3 := 3;
		elsif(TMP >= 2000) then
			D3 := 2;
		elsif(TMP >= 1000) then
			D3 := 1;
		else
			D3 := 0;
		end if;
		
		TMP := TMP - (D3 * 1000);
		if(TMP >= 900) then
			D2 := 9;
		elsif(TMP >= 800) then
			D2 := 8;
		elsif(TMP >= 700) then
			D2 := 7;
		elsif(TMP >= 600) then
			D2 := 6;
		elsif(TMP >= 500) then
			D2 := 5;
		elsif(TMP >= 400) then
			D2 := 4;
		elsif(TMP >= 300) then
			D2 := 3;
		elsif(TMP >= 200) then
			D2 := 2;
		elsif(TMP >= 100) then
			D2 := 1;
		else
			D2 := 0;
		end if;
		
		TMP := TMP - (D2 * 100);
		if(TMP >= 90) then
			D1 := 9;
		elsif(TMP >= 80) then
			D1 := 8;
		elsif(TMP >= 70) then
			D1 := 7;
		elsif(TMP >= 60) then
			D1 := 6;
		elsif(TMP >= 50) then
			D1 := 5;
		elsif(TMP >= 40) then
			D1 := 4;
		elsif(TMP >= 30) then
			D1 := 3;
		elsif(TMP >= 20) then
			D1 := 2;
		elsif(TMP >= 10) then
			D1 := 1;
		else
			D1 := 0;
		end if;
		
		TMP := TMP - (D1 * 10);
		D0 := TMP;
		
		DIG0 <= conv_std_logic_vector(D0, 4);
		DIG1 <= conv_std_logic_vector(D1, 4);
		DIG2 <= conv_std_logic_vector(D2, 4);
		DIG3 <= conv_std_logic_vector(D3, 4);
	end process;
end Behavioral;