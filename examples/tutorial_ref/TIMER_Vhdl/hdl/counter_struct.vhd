-- VHDL Entity TIMER_Vhdl.Counter.interface
--
-- Created:
--          by - user.group (host.domain)
--          at - 11:40:31 04/12/2005
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Counter IS
   PORT( 
      clear  : IN     std_logic;
      clk    : IN     std_logic;
      dat_in : IN     std_logic_vector (3 DOWNTO 0);
      hold   : IN     std_logic;
      load   : IN     std_logic;
      high   : OUT    std_logic_vector (3 DOWNTO 0);
      low    : OUT    std_logic_vector (3 DOWNTO 0);
      zero   : OUT    std_logic
   );

-- Declarations

END Counter ;

--
-- VHDL Architecture TIMER_Vhdl.Counter.struct
--
-- Created:
--          by - user.group (host.domain)
--          at - 11:40:33 04/12/2005
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.1
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-- pragma synthesis_off
LIBRARY TIMER_Vhdl;
-- pragma synthesis_on

ARCHITECTURE struct OF Counter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL carry_in : std_logic_vector(3 DOWNTO 0);
   SIGNAL zero1    : std_logic;
   SIGNAL zero2    : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL high_internal : std_logic_vector (3 DOWNTO 0);


   -- Component Declarations
   COMPONENT BCDCounter
   GENERIC (
      prop_delay : time
   );
   PORT (
      carry_in : IN     std_logic_vector (3 DOWNTO 0);
      clear    : IN     std_logic;
      clk      : IN     std_logic;
      cnten    : IN     std_logic;
      dat_in   : IN     std_logic_vector (3 DOWNTO 0);
      load     : IN     std_logic;
      count    : OUT    std_logic_vector (3 DOWNTO 0);
      zero     : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : BCDCounter USE ENTITY TIMER_Vhdl.BCDCounter;
   -- pragma synthesis_on


BEGIN

   -- ModuleWare code(v1.5) for instance 'I2' of 'gnd'
   carry_in <= (OTHERS => '0');

   -- ModuleWare code(v1.5) for instance 'I3' of 'nor'
   zero <= NOT(zero1 OR zero2);

   -- Instance port mappings.
   I0 : BCDCounter
      GENERIC MAP (
         prop_delay => 5 ns
      )
      PORT MAP (
         cnten    => hold,
         clear    => clear,
         clk      => clk,
         load     => load,
         dat_in   => dat_in,
         carry_in => high_internal,
         count    => low,
         zero     => zero1
      );
   I1 : BCDCounter
      GENERIC MAP (
         prop_delay => 5 ns
      )
      PORT MAP (
         cnten    => zero1,
         clear    => clear,
         clk      => clk,
         load     => load,
         dat_in   => dat_in,
         carry_in => carry_in,
         count    => high_internal,
         zero     => zero2
      );

   -- Implicit buffered output assignments
   high <= high_internal;

END struct;