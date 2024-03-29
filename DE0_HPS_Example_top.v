
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module DE0_HPS_Example_top(

   //////////// ADC //////////
   output  wire                ADC_CONVST,
   output  wire                ADC_SCK,
   output  wire                ADC_SDI,
   input   wire                ADC_SDO,

   //////////// CLOCK //////////
   input   wire                FPGA_CLK1_50,
   input   wire                FPGA_CLK2_50,
   input   wire                FPGA_CLK3_50,

   //////////// HPS //////////
   inout   wire                HPS_CONV_USB_N,
   output  wire    [14:0]      HPS_DDR3_ADDR,
   output  wire     [2:0]      HPS_DDR3_BA,
   output  wire                HPS_DDR3_CAS_N,
   output  wire                HPS_DDR3_CK_N,
   output  wire                HPS_DDR3_CK_P,
   output  wire                HPS_DDR3_CKE,
   output  wire                HPS_DDR3_CS_N,
   output  wire     [3:0]      HPS_DDR3_DM,
   inout   wire    [31:0]      HPS_DDR3_DQ,
   inout   wire     [3:0]      HPS_DDR3_DQS_N,
   inout   wire     [3:0]      HPS_DDR3_DQS_P,
   output  wire                HPS_DDR3_ODT,
   output  wire                HPS_DDR3_RAS_N,
   output  wire                HPS_DDR3_RESET_N,
   input   wire                HPS_DDR3_RZQ,
   output  wire                HPS_DDR3_WE_N,
   output  wire                HPS_ENET_GTX_CLK,
   inout   wire                HPS_ENET_INT_N,
   output  wire                HPS_ENET_MDC,
   inout   wire                HPS_ENET_MDIO,
   input   wire                HPS_ENET_RX_CLK,
   input   wire     [3:0]      HPS_ENET_RX_DATA,
   input   wire                HPS_ENET_RX_DV,
   output  wire     [3:0]      HPS_ENET_TX_DATA,
   output  wire                HPS_ENET_TX_EN,
   inout   wire                HPS_GSENSOR_INT,
   inout   wire                HPS_I2C0_SCLK,
   inout   wire                HPS_I2C0_SDAT,
   inout   wire                HPS_I2C1_SCLK,
   inout   wire                HPS_I2C1_SDAT,
   inout   wire                HPS_KEY,
   inout   wire                HPS_LED,
   inout   wire                HPS_LTC_GPIO,
   output  wire                HPS_SD_CLK,
   inout   wire                HPS_SD_CMD,
   inout   wire     [3:0]      HPS_SD_DATA,
   output  wire                HPS_SPIM_CLK,
   input   wire                HPS_SPIM_MISO,
   output  wire                HPS_SPIM_MOSI,
   inout   wire                HPS_SPIM_SS,
   input   wire                HPS_UART_RX,
   output  wire                HPS_UART_TX,
   input   wire                HPS_USB_CLKOUT,
   inout   wire     [7:0]      HPS_USB_DATA,
   input   wire                HPS_USB_DIR,
   input   wire                HPS_USB_NXT,
   output  wire                HPS_USB_STP,

   //////////// KEY //////////
   input   wire     [1:0]      KEY,

   //////////// LED //////////
   output  wire     [7:0]      LED,


   /////// SWITCHES  ////////
   input   wire     [3:0]      SW

);



//=======================================================
//  REG/WIRE declarations
//=======================================================

// internal reset
wire reset;
wire h2f_reset;

wire warm_reset_hs_ack;
wire warm_reset_hs_req;


//=======================================================
//  Structural coding
//=======================================================


// the ADCs are not used at the moment
assign ADC_CONVST  = 1'b1;
assign ADC_SCK     = 1'b1;
assign ADC_SDI     = 1'b1;

assign warm_reset_hs_ack = warm_reset_hs_req;
assign hps_warm_reset    = warm_reset_hs_req;
assign hps_debug_reset   = 1'b0;

// A warm-reset on the hps-side shall also reset the FPGA part
assign reset = hps_warm_reset;

DE0_HPS_Example u0 (
        .clk_clk                         ( FPGA_CLK1_50        ), //   clk.clk
        .reset_reset_n                   ( ~reset              ), //   reset.reset_n
        .memory_mem_a                    ( HPS_DDR3_ADDR       ), //   memory.mem_a               
        .memory_mem_ba                   ( HPS_DDR3_BA         ), //   mem_ba              
        .memory_mem_ck                   ( HPS_DDR3_CK_P       ), //   mem_ck           
        .memory_mem_ck_n                 ( HPS_DDR3_CK_N       ), //   mem_ck_n         
        .memory_mem_cke                  ( HPS_DDR3_CKE        ), //   mem_cke         
        .memory_mem_cs_n                 ( HPS_DDR3_CS_N       ), //   mem_cs_n        
        .memory_mem_ras_n                ( HPS_DDR3_RAS_N      ), //   mem_ras_n        
        .memory_mem_cas_n                ( HPS_DDR3_CAS_N      ), //   mem_cas_n       
        .memory_mem_we_n                 ( HPS_DDR3_WE_N       ), //   mem_we_n         
        .memory_mem_reset_n              ( HPS_DDR3_RESET_N    ), //   mem_reset_n      
        .memory_mem_dq                   ( HPS_DDR3_DQ         ), //   mem_dq           
        .memory_mem_dqs                  ( HPS_DDR3_DQS_P      ), //   mem_dqs          
        .memory_mem_dqs_n                ( HPS_DDR3_DQS_N      ), //   mem_dqs_n        
        .memory_mem_odt                  ( HPS_DDR3_ODT        ), //   mem_odt          
        .memory_mem_dm                   ( HPS_DDR3_DM         ), //   mem_dm              
        .memory_oct_rzqin                ( HPS_DDR3_RZQ        ), //   oct_rzqin           
        .h2f_reset_reset_n               ( h2f_reset           ), //   h2f_reset.reset_n

        .hps_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK    ), //   hps_io.hps_io_emac1_inst_TX_CLK
        .hps_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ), //   hps_io_emac1_inst_TXD0
        .hps_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ), //   hps_io_emac1_inst_TXD1
        .hps_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ), //   hps_io_emac1_inst_TXD2
        .hps_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ), //   hps_io_emac1_inst_TXD3
        .hps_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ), //   hps_io_emac1_inst_RXD0
        .hps_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ), //   hps_io_emac1_inst_RXD1
        .hps_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ), //   hps_io_emac1_inst_RXD2
        .hps_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ), //   hps_io_emac1_inst_RXD3
        .hps_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO       ), //   hps_io_emac1_inst_MDIO
        .hps_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC        ), //   hps_io_emac1_inst_MDC
        .hps_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV      ), //   hps_io_emac1_inst_RX_CTL
        .hps_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN      ), //   hps_io_emac1_inst_TX_CTL
        .hps_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK     ), //   hps_io_emac1_inst_RX_CLK

        .hps_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK          ), //    hps_io_sdio_inst_CLK
        .hps_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD          ), //    hps_io_sdio_inst_CMD
        .hps_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]      ), //    hps_io_sdio_inst_D0
        .hps_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]      ), //    hps_io_sdio_inst_D1
        .hps_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]      ), //    hps_io_sdio_inst_D2
        .hps_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]      ), //    hps_io_sdio_inst_D3

        .hps_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]     ), //    hps_io_usb1_inst_D0
        .hps_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]     ), //    hps_io_usb1_inst_D1
        .hps_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]     ), //    hps_io_usb1_inst_D2
        .hps_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]     ), //    hps_io_usb1_inst_D3
        .hps_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]     ), //    hps_io_usb1_inst_D4
        .hps_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]     ), //    hps_io_usb1_inst_D5
        .hps_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]     ), //    hps_io_usb1_inst_D6
        .hps_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]     ), //    hps_io_usb1_inst_D7
        .hps_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT      ), //    hps_io_usb1_inst_CLK
        .hps_io_hps_io_usb1_inst_STP     ( HPS_USB_STP         ), //    hps_io_usb1_inst_STP
        .hps_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR         ), //    hps_io_usb1_inst_DIR
        .hps_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT         ), //    hps_io_usb1_inst_NXT

        .hps_io_hps_io_spim1_inst_CLK    ( HPS_SPIM_CLK        ), //    hps_io_spim0_inst_CLK
        .hps_io_hps_io_spim1_inst_MOSI   ( HPS_SPIM_MOSI       ), //    hps_io_spim0_inst_MOSI
        .hps_io_hps_io_spim1_inst_MISO   ( HPS_SPIM_MISO       ), //    hps_io_spim0_inst_MISO
        .hps_io_hps_io_spim1_inst_SS0    ( HPS_SPIM_SS         ), //    hps_io_spim0_inst_SS0

        .hps_io_hps_io_uart0_inst_RX     ( HPS_UART_RX         ), //    hps_io_uart0_inst_RX
        .hps_io_hps_io_uart0_inst_TX     ( HPS_UART_TX         ), //    hps_io_uart0_inst_TX

        .hps_io_hps_io_i2c0_inst_SDA     ( HPS_I2C0_SDAT       ), //    hps_io_i2c0_inst_SDA
        .hps_io_hps_io_i2c0_inst_SCL     ( HPS_I2C0_SCLK       ), //    hps_io_i2c0_inst_SCL
        .hps_io_hps_io_i2c1_inst_SDA     ( HPS_I2C1_SDAT       ), //    hps_io_i2c1_inst_SDA
        .hps_io_hps_io_i2c1_inst_SCL     ( HPS_I2C1_SCLK       ), //    hps_io_i2c1_inst_SCL

        .hps_io_hps_io_gpio_inst_GPIO09  ( HPS_CONV_USB_N      ), //    hps_io_gpio_inst_GPIO09
        .hps_io_hps_io_gpio_inst_GPIO35  ( HPS_ENET_INT_N      ), //    hps_io_gpio_inst_GPIO35
        .hps_io_hps_io_gpio_inst_GPIO40  ( HPS_LTC_GPIO        ), //    hps_io_gpio_inst_GPIO40
        .hps_io_hps_io_gpio_inst_GPIO53  ( HPS_LED             ), //    hps_io_gpio_inst_GPIO53
        .hps_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY             ), //    hps_io_gpio_inst_GPIO54
        .hps_io_hps_io_gpio_inst_GPIO61  ( HPS_GSENSOR_INT     ), //    hps_io_gpio_inst_GPIO61


        .led_out_export                  ( LED                 ), //    led_out.export
        .sw_in_export                    ( SW                  ), //    sw_in.export
        .pb_in_export                    ( KEY                 ), //    pb_in.export

        .warm_reset_handshake_h2f_pending_rst_req_n ( ~warm_reset_hs_req ), // h2f_pending_rst_req_n
        .warm_reset_handshake_f2h_pending_rst_ack_n ( ~warm_reset_hs_ack )  // .f2h_pending_rst_ack_n

    );

endmodule
