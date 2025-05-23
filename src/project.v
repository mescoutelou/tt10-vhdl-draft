/*
 * Copyright (c) 2025 ENSEIRB-MATMECA                                          *
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_draft (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
//  assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in

  Alu #(
    .G_N_BIT(7)
  ) m_alu (
    .i_s1(ui_in),
    .i_s2(uio_in),
    .o_res(uo_out)
  );

  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
