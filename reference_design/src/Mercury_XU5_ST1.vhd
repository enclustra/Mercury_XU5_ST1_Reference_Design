----------------------------------------------------------------------------------------------------
-- Copyright (c) 2024 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- libraries
----------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

----------------------------------------------------------------------------------------------------
-- entity declaration
----------------------------------------------------------------------------------------------------
entity Mercury_XU5_ST1 is
  generic (
    BG_WIDTH : natural
  );
  
  port (
    
    -- Anios 0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK_N                      : inout   std_logic;
    IO0_CLK_P                      : inout   std_logic;
    
    -- BUTTONS
    BTN1_N                         : in      std_logic;
    
    -- Clock Generator CLK1
    CLK_REF0_N                     : in      std_logic; -- Available on G1, No_MGT_routing modules
    CLK_REF0_P                     : in      std_logic; -- Available on G1, No_MGT_routing modules
    
    -- Clock Generator CLK0
    CLK_USR_N                      : in      std_logic;
    CLK_USR_P                      : in      std_logic;
    
    -- Display Port
    DP_HPD                         : in      std_logic;
    DP_AUX_IN                      : in      std_logic;
    DP_AUX_OE                      : out     std_logic;
    DP_AUX_OUT                     : out     std_logic;
    
    -- FMC HPC Connector
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_DP0_C2M_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP0_C2M_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP0_M2C_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP0_M2C_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP1_C2M_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP1_C2M_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP1_M2C_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP1_M2C_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP2_C2M_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP2_C2M_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP2_M2C_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP2_M2C_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP3_C2M_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP3_C2M_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP3_M2C_N                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_DP3_M2C_P                  : inout   std_logic; -- Available on G1, No_MGT_routing modules
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    
    -- HDMI
    HDMI_HPD                       : in      std_logic;
    
    -- I2C FPGA
    I2C_SCL_FPGA                   : inout   std_logic;
    I2C_SDA_FPGA                   : inout   std_logic;
    
    -- I2C_MIPI_SEL
    I2C_MIPI_SEL                   : inout   std_logic;
    
    -- I2C PL
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IO2
    IO2_D2_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IO2_D3_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    
    -- IO3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    IO3_D4_P                       : inout   std_logic;
    IO3_D5_N                       : inout   std_logic;
    IO3_D6_P                       : inout   std_logic;
    IO3_D7_N                       : inout   std_logic;
    
    -- IO4
    IO4_D0_P                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IO4_D1_N                       : inout   std_logic; -- Available on G1, No_MGT_routing modules
    IO4_D2_P                       : inout   std_logic;
    IO4_D3_N                       : inout   std_logic;
    IO4_D4_P                       : inout   std_logic;
    IO4_D5_N                       : inout   std_logic;
    IO4_D6_P                       : inout   std_logic;
    IO4_D7_N                       : inout   std_logic;
    
    -- LED
    LED1_N_PL                      : out     std_logic;
    LED2_N_PL                      : out     std_logic;
    LED3_N_PL                      : out     std_logic;
    
    -- Oscillator 100 MHz
    CLK_100_CAL                    : in      std_logic;
    
    -- PL 100 MHz Oscillator
    CLK100_PL_N                    : in      std_logic;
    CLK100_PL_P                    : in      std_logic;
    
    -- PL DDR4 Memory
    DDR4PL_ACT_N                   : out     std_logic;
    DDR4PL_RST_N                   : out     std_logic;
    DDR4PL_BA                      : out     std_logic_vector(1 downto 0);
    DDR4PL_BG                      : out     std_logic_vector(1 downto 0);
    DDR4PL_CKE                     : out     std_logic_vector(0 downto 0);
    DDR4PL_DQ                      : inout   std_logic_vector(15 downto 0);
    DDR4PL_ODT                     : out     std_logic_vector(0 downto 0);
    DDR4PL_A                       : out     std_logic_vector(16 downto 0);
    DDR4PL_CK_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CK_P                    : out     std_logic_vector(0 downto 0);
    DDR4PL_CS_N                    : out     std_logic_vector(0 downto 0);
    DDR4PL_DM                      : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_N                   : inout   std_logic_vector(1 downto 0);
    DDR4PL_DQS_P                   : inout   std_logic_vector(1 downto 0);
    
    -- PL Gigabit Ethernet
    ETH1_MDC                       : out     std_logic;
    ETH1_RXCLK                     : in      std_logic;
    ETH1_TXCLK                     : out     std_logic;
    ETH1_MDIO                      : inout   std_logic;
    ETH1_INT_N                     : in      std_logic;
    ETH1_RESET_N                   : out     std_logic;
    ETH1_RXCTL                     : in      std_logic;
    ETH1_TXCTL                     : out     std_logic;
    ETH1_RXD                       : in      std_logic_vector(3 downto 0);
    ETH1_TXD                       : out     std_logic_vector(3 downto 0)
  );
end Mercury_XU5_ST1;

architecture rtl of Mercury_XU5_ST1 is

  ----------------------------------------------------------------------------------------------------
  -- component declarations
  ----------------------------------------------------------------------------------------------------
  component Mercury_XU5 is
    port (
      DP_AUX_OUT          : out    std_logic;
      DP_AUX_OE           : out    std_logic;
      DP_AUX_IN           : in     std_logic;
      DP_HPD              : in     std_logic;
      Clk100              : out    std_logic;
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      IIC_FPGA_sda_i      : in     std_logic;
      IIC_FPGA_sda_o      : out    std_logic;
      IIC_FPGA_sda_t      : out    std_logic;
      IIC_FPGA_scl_i      : in     std_logic;
      IIC_FPGA_scl_o      : out    std_logic;
      IIC_FPGA_scl_t      : out    std_logic;
      LED_N_PL            : out    std_logic_vector(1 downto 0);
      C0_SYS_CLK_clk_n    : in     std_logic;
      C0_SYS_CLK_clk_p    : in     std_logic;
      C0_DDR4_act_n       : out    std_logic;
      C0_DDR4_reset_n     : out    std_logic;
      C0_DDR4_ba          : out    std_logic_vector(1 downto 0);
      C0_DDR4_bg          : out    std_logic_vector(BG_WIDTH-1 downto 0);
      C0_DDR4_cke         : out    std_logic_vector(0 downto 0);
      C0_DDR4_dq          : inout  std_logic_vector(15 downto 0);
      C0_DDR4_odt         : out    std_logic_vector(0 downto 0);
      C0_DDR4_adr         : out    std_logic_vector(16 downto 0);
      C0_DDR4_ck_c        : out    std_logic_vector(0 downto 0);
      C0_DDR4_ck_t        : out    std_logic_vector(0 downto 0);
      C0_DDR4_cs_n        : out    std_logic_vector(0 downto 0);
      C0_DDR4_dm_n        : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_c       : inout  std_logic_vector(1 downto 0);
      C0_DDR4_dqs_t       : inout  std_logic_vector(1 downto 0);
      MDIO_mdc            : out    std_logic;
      MDIO_mdio_i         : in     std_logic;
      MDIO_mdio_o         : out    std_logic;
      MDIO_mdio_t         : out    std_logic;
      ETH_CLK125          : out    std_logic;
      ETH_CLK125_90       : out    std_logic;
      ETH_CLK25           : out    std_logic;
      ETH_CLK10           : out    std_logic;
      ETH_resetn          : out    std_logic;
      GMII_col            : in     std_logic;
      GMII_crs            : in     std_logic;
      GMII_rx_clk         : in     std_logic;
      GMII_rx_dv          : in     std_logic;
      GMII_rx_er          : in     std_logic;
      GMII_rxd            : in     std_logic_vector(7 downto 0);
      GMII_speed_mode     : out    std_logic_vector(2 downto 0);
      GMII_tx_clk         : in     std_logic;
      GMII_tx_en          : out    std_logic;
      GMII_tx_er          : out    std_logic;
      GMII_txd            : out    std_logic_vector(7 downto 0)
    );
    
  end component Mercury_XU5;
  component IBUFDS is
      port (
        O : out STD_LOGIC;
        I : in STD_LOGIC;
        IB : in STD_LOGIC
      );
    end component IBUFDS;
  
  
  component IOBUF is
    port (
      I : in STD_LOGIC;
      O : out STD_LOGIC;
      T : in STD_LOGIC;
      IO : inout STD_LOGIC
    );
  end component IOBUF;
  
  component Mercury_XU5_GMII2RGMII is
  port (
    Clk125          : in  std_logic;
    Clk125_90       : in  std_logic;
    Clk25           : in  std_logic;
    Clk10           : in  std_logic;
    Resetn          : in  std_logic;
  
    GMII_col        : out std_logic;
    GMII_crs        : out std_logic;
    GMII_rx_clk     : out std_logic;
    GMII_rx_dv      : out std_logic;
    GMII_rx_er      : out std_logic;
    GMII_rxd        : out std_logic_vector(7 downto 0);
    GMII_speed_mode : in  std_logic_vector(2 downto 0);
    GMII_tx_clk     : out std_logic;
    GMII_tx_en      : in  std_logic;
    GMII_tx_er      : in  std_logic;
    GMII_txd        : in  std_logic_vector(7 downto 0);
  
    RGMII_rxd       : in  std_logic_vector(3 downto 0);
    RGMII_rxclk     : in  std_logic;
    RGMII_rxctl     : in  std_logic;
    RGMII_txd       : out std_logic_vector(3 downto 0);
    RGMII_txclk     : out std_logic;
    RGMII_txctl     : out std_logic;
  
    Speed1000En     : out std_logic;
    Speed100En      : out std_logic;
    Speed10En       : out std_logic
  );
  end component Mercury_XU5_GMII2RGMII;

  ----------------------------------------------------------------------------------------------------
  -- signal declarations
  ----------------------------------------------------------------------------------------------------
  signal Clk100           : std_logic;
  signal Clk50            : std_logic;
  signal Rst_N            : std_logic;
  signal IIC_FPGA_sda_i   : std_logic;
  signal IIC_FPGA_sda_o   : std_logic;
  signal IIC_FPGA_sda_t   : std_logic;
  signal IIC_FPGA_scl_i   : std_logic;
  signal IIC_FPGA_scl_o   : std_logic;
  signal IIC_FPGA_scl_t   : std_logic;
  signal LED_N_PL         : std_logic_vector(1 downto 0);
  signal MDIO_mdio_i      : std_logic;
  signal MDIO_mdio_o      : std_logic;
  signal MDIO_mdio_t      : std_logic;
  signal ETH_CLK125       : std_logic;
  signal ETH_CLK125_90    : std_logic;
  signal ETH_CLK25        : std_logic;
  signal ETH_CLK10        : std_logic;
  signal ETH_resetn       : std_logic;
  signal GMII_col         : std_logic;
  signal GMII_crs         : std_logic;
  signal GMII_rx_clk      : std_logic;
  signal GMII_rx_dv       : std_logic;
  signal GMII_rx_er       : std_logic;
  signal GMII_rxd         : std_logic_vector(7 downto 0);
  signal GMII_speed_mode  : std_logic_vector(2 downto 0);
  signal GMII_tx_clk      : std_logic;
  signal GMII_tx_en       : std_logic;
  signal GMII_tx_er       : std_logic;
  signal GMII_txd         : std_logic_vector(7 downto 0);
  signal dp_aux_data_oe_n : std_logic;
  signal LedCount         : unsigned(23 downto 0);
  
  ----------------------------------------------------------------------------------------------------
  -- attribute declarations
  ----------------------------------------------------------------------------------------------------

begin
  
  ----------------------------------------------------------------------------------------------------
  -- processor system instance
  ----------------------------------------------------------------------------------------------------
  Mercury_XU5_i: component Mercury_XU5
    port map (
      DP_AUX_OUT           => DP_AUX_OUT,
      DP_AUX_OE            => dp_aux_data_oe_n,
      DP_AUX_IN            => DP_AUX_IN,
      DP_HPD               => DP_HPD,
      Clk100               => Clk100,
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      IIC_FPGA_sda_i       => IIC_FPGA_sda_i,
      IIC_FPGA_sda_o       => IIC_FPGA_sda_o,
      IIC_FPGA_sda_t       => IIC_FPGA_sda_t,
      IIC_FPGA_scl_i       => IIC_FPGA_scl_i,
      IIC_FPGA_scl_o       => IIC_FPGA_scl_o,
      IIC_FPGA_scl_t       => IIC_FPGA_scl_t,
      LED_N_PL             => LED_N_PL,
      C0_SYS_CLK_clk_n     => CLK100_PL_N,
      C0_SYS_CLK_clk_p     => CLK100_PL_P,
      C0_DDR4_act_n        => DDR4PL_ACT_N,
      C0_DDR4_reset_n      => DDR4PL_RST_N,
      C0_DDR4_ba           => DDR4PL_BA,
      C0_DDR4_bg           => DDR4PL_BG (BG_WIDTH-1 downto 0),
      C0_DDR4_cke          => DDR4PL_CKE,
      C0_DDR4_dq           => DDR4PL_DQ,
      C0_DDR4_odt          => DDR4PL_ODT,
      C0_DDR4_adr          => DDR4PL_A,
      C0_DDR4_ck_c         => DDR4PL_CK_N,
      C0_DDR4_ck_t         => DDR4PL_CK_P,
      C0_DDR4_cs_n         => DDR4PL_CS_N,
      C0_DDR4_dm_n         => DDR4PL_DM,
      C0_DDR4_dqs_c        => DDR4PL_DQS_N,
      C0_DDR4_dqs_t        => DDR4PL_DQS_P,
      MDIO_mdc             => ETH1_MDC,
      MDIO_mdio_i          => MDIO_mdio_i,
      MDIO_mdio_o          => MDIO_mdio_o,
      MDIO_mdio_t          => MDIO_mdio_t,
      ETH_CLK125           => ETH_CLK125,
      ETH_CLK125_90        => ETH_CLK125_90,
      ETH_CLK25            => ETH_CLK25,
      ETH_CLK10            => ETH_CLK10,
      ETH_resetn           => ETH_resetn,
      GMII_col             => GMII_col,
      GMII_crs             => GMII_crs,
      GMII_rx_clk          => GMII_rx_clk,
      GMII_rx_dv           => GMII_rx_dv,
      GMII_rx_er           => GMII_rx_er,
      GMII_rxd             => GMII_rxd,
      GMII_speed_mode      => GMII_speed_mode,
      GMII_tx_clk          => GMII_tx_clk,
      GMII_tx_en           => GMII_tx_en,
      GMII_tx_er           => GMII_tx_er,
      GMII_txd             => GMII_txd
    );
  
  CLK_USR_buf: component IBUFDS
  port map (
  	O => open,
  	I => CLK_USR_P,
  	IB => CLK_USR_N
  );
  
  DP_AUX_OE <= not dp_aux_data_oe_n;
  
  IIC_FPGA_scl_iobuf: component IOBUF
    port map (
      I => IIC_FPGA_scl_o,
      IO => I2C_SCL_FPGA,
      O => IIC_FPGA_scl_i,
      T => IIC_FPGA_scl_t
    );
  
  IIC_FPGA_sda_iobuf: component IOBUF
    port map (
      I => IIC_FPGA_sda_o,
      IO => I2C_SDA_FPGA,
      O => IIC_FPGA_sda_i,
      T => IIC_FPGA_sda_t
    );
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  LED1_N_PL <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  LED2_N_PL <= '0' when LED_N_PL(0) = '0' else 'Z';
  LED3_N_PL <= '0' when LED_N_PL(1) = '0' else 'Z';
  
  MDIO_mdio_iobuf: component IOBUF
    port map (
      I => MDIO_mdio_o,
      IO => ETH1_MDIO,
      O => MDIO_mdio_i,
      T => MDIO_mdio_t
    );
  
  i_gmii2rgmii : Mercury_XU5_GMII2RGMII
    port map (
      Clk125          => ETH_CLK125,
      Clk125_90       => ETH_CLK125_90,
      Clk25           => ETH_Clk25,
      Clk10           => ETH_Clk10,
      Resetn          => ETH_resetn,
  
      GMII_col        => GMII_col,
      GMII_crs        => GMII_crs,
      GMII_rx_clk     => GMII_rx_clk,
      GMII_rx_dv      => GMII_rx_dv,
      GMII_rx_er      => GMII_rx_er,
      GMII_rxd        => GMII_rxd,
      GMII_speed_mode => GMII_speed_mode,
      GMII_tx_clk     => GMII_tx_clk,
      GMII_tx_en      => GMII_tx_en,
      GMII_tx_er      => GMII_tx_er,
      GMII_txd        => GMII_txd,
  
      RGMII_rxd       => ETH1_RXD,
      RGMII_rxclk     => ETH1_RXCLK,
      RGMII_rxctl     => ETH1_RXCTL,
      RGMII_txd       => ETH1_TXD,
      RGMII_txclk     => ETH1_TXCLK,
      RGMII_txctl     => ETH1_TXCTL,
  
      Speed1000En     => open,
      Speed100En      => open,
      Speed10En       => open
    );
  
  ETH1_RESET_N        <= ETH_resetn;
end rtl;
