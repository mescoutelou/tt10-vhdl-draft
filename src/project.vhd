--
-- File: project.vhd
-- Created Date: 2025-04-11 09:52:50 am
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2025-04-11 10:00:36 am
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@ims-bordeaux.com
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2025 ENSEIRB-MATMECA
-- -----
-- Description: 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tt_um_draft is
	port (
		clk : in std_logic;
		rst_n : in std_logic;
		ena : in std_logic;
		ui_in : in std_logic_vector(7 downto 0);
		uo_out : out std_logic_vector(7 downto 0);
		uio_in : in std_logic_vector(7 downto 0);
		uio_out : out std_logic_vector(7 downto 0);
		uio_oe : out std_logic_vector(7 downto 0);
	);
end entity tt_um_draft;

architecture tt_um_draft_arch of tt_um_draft is
  signal _unused : std_logic_vector(3 downto 0);

  component Alu is
  	generic (
  		G_N_BIT: integer
  	);
  	port (
  		i_s1 : in std_logic_vector(G_N_BIT - 1 downto 0);
  		i_s2 : in std_logic_vector(G_N_BIT - 1 downto 0);
  		o_res : out std_logic_vector(G_N_BIT - 1 downto 0);
  	);
  end component;

	begin
    m_Alu: Alu 
      generic map (
        G_N_BIT => 7
      )
      port map (
        i_s1 => ui_in,
        i_s2 => uio_in,
        o_res => uo_out
      );

    uio_out <= "00000000";
    uio_oe <= "00000000";
    _unused <= ena & clk & rst_n & '1';
end tt_um_draft_arch;