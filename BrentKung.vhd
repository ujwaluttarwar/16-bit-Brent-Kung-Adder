-------------------------------------------------------------
-------------------------- Level 1 --------------------------
-------------------------------------------------------------
library  ieee;
use  ieee.std_logic_1164.all;
-- ENTITY
entity G1_P1 is
    port (a, b: in STD_LOGIC_VECTOR(15 downto 0);
        C0: in std_logic;
        G1,P1: out STD_LOGIC_VECTOR(15 downto 0));
end G1_P1;
-- ARCHITECTURE
architecture behavioral of G1_P1 is
    begin
        G1(0)<=(a(0) and b(0)) or ((a(0) xor b(0)) and C0) after 102 ps; 
        G1(15 downto 1)<= (a(15 downto 1) and b(15 downto 1)) after 62 ps;
        P1 <= (a xor b) after 102 ps; 
end behavioral;

-------------------------------------------------------------
-------------------------- Level 2 --------------------------
-------------------------------------------------------------
library  ieee;
use  ieee.std_logic_1164.all;
-- ENTITY
entity  G2_P2 is
    port (
        G1,P1: in STD_LOGIC_VECTOR (15 downto 0);
        G2: out STD_LOGIC_VECTOR (7 downto 0);
        P2: out STD_LOGIC_VECTOR (7 downto 0));
end G2_P2;
-- ARCHITECTURE
architecture behavioral of G2_P2 is
    begin
        GENERATOR: for i in 0 to 7 generate
           G2(i) <= G1(2*i+1) or (P1(2*i+1) and G1(2*i) )after 92 ps;
           P2(i) <= (P1(2*i+1) and P1(2*i) )after 62 ps;
        end generate GENERATOR;
end behavioral;
     
-------------------------------------------------------------
-------------------------- Level 3 --------------------------
-------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-- ENTITY
entity  G3_P3 is
port (
        G2,P2: in STD_LOGIC_VECTOR (7 downto 0);
        G3: out STD_LOGIC_VECTOR (3 downto 0);
        P3: out STD_LOGIC_VECTOR (3 downto 0));
end G3_P3;
-- ARCHITECTURE
architecture behavioral of G3_P3 is
    begin
        GENERATOR: for i in 0 to 3 generate
            G3(i) <= G2(2*i+1) or (P2(2*i+1) and G2(2*i) )after 92 ps;
            P3(i) <= (P2(2*i+1) and P2(2*i) )after 62 ps;
        end generate GENERATOR;
end behavioral;
    
-------------------------------------------------------------
-------------------------- Level 4 --------------------------
-------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-- ENTITY
entity  G4_P4 is
    port (
        G3,P3: in STD_LOGIC_VECTOR (3 downto 0);
        G4: out STD_LOGIC_VECTOR (1 downto 0);
        P4: out STD_LOGIC_VECTOR (1 downto 0));
end G4_P4;
-- ARCHITECTURE
architecture behavioral of G4_P4 is
    begin
        GENERATOR: for i in 0 to 1 generate
            G4(i) <= G3(2*i+1) or (P3(2*i+1) and G3(2*i) )after 92 ps;
           P4(i) <= (P3(2*i+1) and P3(2*i) )after 62 ps;
    end generate GENERATOR;
end behavioral;
 
-------------------------------------------------------------
-------------------------- Level 5 --------------------------
-------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
-- ENTITY
entity  G5_P5 is
port (
        G4,P4: in STD_LOGIC_VECTOR (1 downto 0);
        G5: out std_logic;
        P5: out std_logic);
end G5_P5;
-- ARCHITECTURE
architecture behavioral of G5_P5 is
    begin
        G5 <= G4(1) or (P4(1) and G4(0))after 92 ps; 
        P5 <= (P4(1) and P4(0))after 62 ps ;
end behavioral;


-------------------------------------------------------------
------------------------ Main Circuit -----------------------
-------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity BrentKung is
    port(
        a, b : in STD_LOGIC_VECTOR(15 downto 0);
        C0 : in std_logic;
        Sum : out STD_LOGIC_VECTOR(15 downto 0);
        Carry : out std_logic);
end entity BrentKung;

architecture structural of BrentKung is
    signal G1, P1 : STD_LOGIC_VECTOR(15 downto 0);
    signal G2, P2 : STD_LOGIC_VECTOR(7 downto 0);
    signal G3, P3 : STD_LOGIC_VECTOR(3 downto 0);
    signal G4, P4 : STD_LOGIC_VECTOR(1 downto 0);
    signal G5, P5 : std_logic;
    signal C : STD_LOGIC_VECTOR(16 downto 0);
        
    component G1_P1 is -- level_1
        port (a, b: in STD_LOGIC_VECTOR(15 downto 0);
               C0:in std_logic;
               G1,P1: out STD_LOGIC_VECTOR(15 downto 0));
    end component G1_P1;
     
    component  G2_P2 is -- level_2
        port (G1,P1: in STD_LOGIC_VECTOR (15 downto 0);
                G2: out STD_LOGIC_VECTOR (7 downto 0);
                P2: out STD_LOGIC_VECTOR (7 downto 0));
    end component G2_P2;
     
    component  G3_P3 is -- level_3
        port (G2,P2: in STD_LOGIC_VECTOR (7 downto 0); 
                G3: out STD_LOGIC_VECTOR (3 downto 0);
                P3: out STD_LOGIC_VECTOR (3 downto 0));
    end component G3_P3;
     
    component  G4_P4 is -- level_4
        port (G3,P3: in STD_LOGIC_VECTOR (3 downto 0);
                G4: out STD_LOGIC_VECTOR (1 downto 0);
                P4: out STD_LOGIC_VECTOR (1 downto 0));
    end component G4_P4;
     
    component  G5_P5 is -- level_5
        port (G4,P4: in STD_LOGIC_VECTOR (1 downto 0);
                G5: out std_logic;
                P5: out std_logic);
    end component G5_P5;
     
     
    begin
    cir1:G1_P1
       port map (a, b, C0, G1, P1);
    cir2:G2_P2
       port map (G1, P1, G2, P2);
    cir3:G3_P3
       port map (G2, P2, G3, P3);
    cir4:G4_P4
       port map (G3, P3, G4, P4);
    cir5:G5_P5
       port map (G4, P4, G5, P5);


    C(0) <= C0;
    C(1) <= G1(0); 
    C(2) <= G2(0); 
    C(3) <= G1(2) or (P1(2) and C(2))after 92 ps; 
    C(4) <= G3(0); 
    C(5) <= G1(4) or (P1(4) and C(4))after 92 ps; 
    C(6) <= G2(2) or (P2(2) and C(4))after 92 ps; 
    C(7) <= G1(6) or (P1(6) and C(6))after 92 ps; 
    C(8) <= G4(0); 
    C(9) <= G1(8) or (P1(8) and C(8))after 92 ps; 
    C(10) <= G2(4) or (P2(4) and C(8))after 92 ps; 
    C(11) <= G1(10) or (P1(10) and C(10))after 92 ps; 
    C(12) <= G3(2) or (P3(2) and C(8))after 92 ps; 
    C(13) <= G1(12) or (P1(12) and C(12))after 92 ps; 
    C(14) <= G2(6) or (P2(6) and C(12))after 92 ps; 
    C(15) <= G1(14) or (P1(14) and C(14))after 92 ps; 
    C(16) <= G5; 
    
    Sum <= (C(15 downto 0) xor P1) after 102 ps;
    Carry <= C(16);
end architecture structural;