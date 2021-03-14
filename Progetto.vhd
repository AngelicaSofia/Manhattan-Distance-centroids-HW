----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2019 09:29:30
-- Design Name: 
-- Module Name: Progetto - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Progetto is
    Port ( i_clk : in STD_LOGIC;
           i_start : in STD_LOGIC;
           i_rst : in STD_LOGIC;
           i_data : in STD_LOGIC_VECTOR (7 downto 0);
           o_address : out STD_LOGIC_VECTOR (15 downto 0);
           o_done : out STD_LOGIC;
           o_en : out STD_LOGIC;
           o_we : out STD_LOGIC;
           o_data : out STD_LOGIC_VECTOR (7 downto 0));
end Progetto;

architecture Behavioral of Progetto is
signal CS : STD_LOGIC_VECTOR (5 downto 0);
signal W: STD_LOGIC;
signal Mask: STD_LOGIC_VECTOR (7 downto 0);
signal R: STD_LOGIC_VECTOR (4 downto 0);
signal X: STD_LOGIC_VECTOR (7 downto 0);
signal Y: STD_LOGIC_VECTOR (7 downto 0);
signal ADS: STD_LOGIC_VECTOR (15 downto 0);
signal Xp: STD_LOGIC_VECTOR (7 downto 0);
signal Min: STD_LOGIC_VECTOR (8 downto 0);
signal D0: STD_LOGIC_VECTOR (8 downto 0);
signal D1: STD_LOGIC_VECTOR (8 downto 0);
signal D2: STD_LOGIC_VECTOR (8 downto 0);
signal D3: STD_LOGIC_VECTOR (8 downto 0);
signal D4: STD_LOGIC_VECTOR (8 downto 0);
signal D5: STD_LOGIC_VECTOR (8 downto 0);
signal D6: STD_LOGIC_VECTOR (8 downto 0);
signal D7: STD_LOGIC_VECTOR (8 downto 0);
signal Flag: STD_LOGIC;

begin
o_address<="0000000000000000";
o_done<='0';
o_en<='0';
o_we<='0';
o_data<="00000000";
CS<="000000";
W<='0';
R<="00000";
Flag<='0';

Processo_reset : process(i_rst)
begin
o_address<="0000000000000000";
o_done<='0';
o_en<='0';
o_we<='0';
o_data<="00000000";
CS<="000000";
W<='0';
R<="00000";
end process;

Stato_iniziale : process(i_clk)
begin
if(i_clk='1' and i_clk'event and i_start='1' and CS="000000") then
o_en<='1';
W<='1';
CS<="000001";
end if;
end process;

Stato_attesa : process(i_clk)
begin
if(i_clk='1' and i_clk'event and W='1') then W<='0'; end if;
end process;

Stato_lettura_Mask : process(i_clk)
begin
if(i_clk='1' and i_clk'event and CS="000001" and W='0') then
Mask<=i_data;
o_address<="0000000000000001";
W<='1';
CS<="000010";
end if;
end process;

Stato_lettura : process(i_clk)
begin
if(i_clk='1' and i_clk'event and CS="000010" and W='0') then
if(R="00000") then
X<=i_data;
o_address<="0000000000000010";
R<="00001";
W<='1';
end if;
if (R="00001") then
Y<=i_data;
o_address<="0000000000000011";
ADS<="0000000000000011";
R<="00010";
W<='1';
end if;
if (R="10011") then
CS<="000011";
end if;
else if(R>"00001" and R<"10011") then
if(R(0)='1') then
Xp<=i_data;
o_address<=+signed(ADS)+1;
ADS<=+signed(ADS)+1;
R<=signed(R)+1;
W<='1';
else

if(R="00011") then
D1<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(6)='1') then
if(Flag='0') then
Min<=D1;
Flag<='1';
else
if(D1<Min) then
Min<=D1;
end if;
end if;
end if;
end if;

if(R="00011") then
D2<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(5)='1') then
if(Flag='0') then
Min<=D2;
Flag<='1';
else
if(D2<Min) then
Min<=D2;
end if;
end if;
end if;
end if;

if(R="00011") then
D3<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(4)='1') then
if(Flag='0') then
Min<=D3;
Flag<='1';
else
if(D3<Min) then
Min<=D3;
end if;
end if;
end if;
end if;

if(R="00011") then
D4<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(3)='1') then
if(Flag='0') then
Min<=D4;
Flag<='1';
else
if(D4<Min) then
Min<=D4;
end if;
end if;
end if;
end if;

if(R="00011") then
D5<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(2)='1') then
if(Flag='0') then
Min<=D5;
Flag<='1';
else
if(D5<Min) then
Min<=D5;
end if;
end if;
end if;
end if;

if(R="00011") then
D6<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(1)='1') then
if(Flag='0') then
Min<=D6;
Flag<='1';
else
if(D6<Min) then
Min<=D6;
end if;
end if;
end if;
end if;

if(R="00011") then
D7<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(0)='1') then
if(Flag='0') then
Min<=D7;
Flag<='1';
else
if(D7<Min) then
Min<=D7;
end if;
end if;
end if;
end if;

if(R="00011") then
D0<=ABS(+signed(Xp)-signed(X))+ABS(signed(i_data)-signed(Y));
if(Mask(7)='1') then
if(Flag='0') then
Min<=D0;
Flag<='1';
else
if(D0<Min) then
Min<=D0;
end if;
end if;
end if;
end if;

--Salvo distanza totale su un segnale, poi confronto enable e vecchio minimo, nel caso lo aggiorno
end if;
end if;
end if;
end process;

Stato_risultati : process(i_clk)
begin
if(i_clk='1' and i_clk'event and CS="000011" and W='0') then
if (Min=D7 and Mask(7)='1')then o_data(0)<= '1'; end if;
if (Min=D6 and Mask(6)='1')then o_data(1)<= '1'; end if;
if (Min=D5 and Mask(5)='1')then o_data(2)<= '1'; end if;
if (Min=D4 and Mask(4)='1')then o_data(3)<= '1'; end if;
if (Min=D3 and Mask(3)='1')then o_data(4)<= '1'; end if;
if (Min=D2 and Mask(2)='1')then o_data(5)<= '1'; end if;
if (Min=D1 and Mask(1)='1')then o_data(6)<= '1'; end if;
if (Min=D0 and Mask(0)='1')then o_data(7)<= '1'; end if;
o_we<='1';
CS<="000100";
W<='1';
end if;
end process;

Stato_mostra : process(i_clk)
begin
if(i_clk='1' and i_clk'event and CS="000100" and W='0') then
o_done<='1';
o_we<='0';
o_en<='0';
end if;
end process;
end Behavioral;
