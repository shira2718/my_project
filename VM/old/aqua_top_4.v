//////////////////////////////////////////////////////////////////////////////
// Papilio Pro 
// LED1 (P112)  0.5 
// : 32MHz (P94)
//////////////////////////////////////////////////////////////////////////////

module aqua_top (
    //  (32MHz)
    input  wire       CLK,

    // UART ()
    input  wire       RX,
    output wire       TX,

    // Wing A, B, C  ()
	
	output wire AN0, AN1, AN2, AN3,
	output wire SG_A, SG_B, SG_C, SG_D, SG_E, SG_F, SG_G, SG_DP,
	
	
//    output wire [15:0] A,
//    inout  wire [15:0] B,
//    inout  wire [15:0] C,

    // SDRAM (  )
    output wire [12:0] SDRAM_ADDR,
    inout  wire [15:0] SDRAM_DATA,
    output wire        SDRAM_DQML,
    output wire        SDRAM_DQMH,
    output wire [1:0]  SDRAM_BA,
    output wire        SDRAM_nWE,
    output wire        SDRAM_nCAS,
    output wire        SDRAM_nRAS,
    output wire        SDRAM_CS,
    output wire        SDRAM_CLK,
    output wire        SDRAM_CKE,
	
    // I2C LCD
    inout  wire DISP_SDA,
    inout  wire DISP_SCL,
    output wire DISP_RST,

    // LED
    output wire        LED1

);
	// 1kHz
//	reg [15:0] scan_cnt = 0;
	reg [1:0]  digit_sel = 0;

//	always @(posedge CLK) begin
//		scan_cnt <= scan_cnt + 1;
//		digit_sel <= scan_cnt[15:14]; // 
//	end

    //========================================================================
    // 0.5 (32MHz  16,000,000 cycles = 0.5)
    // 2^24 = 16,777,216 
    //========================================================================
    reg [23:0] counter = 24'd0;
    reg        led_reg  = 1'b0;

    //  (0.5 = 32e6 / 2 = 16,000,000)
    localparam HALF_SEC = 24'd16_000_000;  // 16,000,000

    always @(posedge CLK) begin
        if (counter == HALF_SEC - 1) begin
            counter <= 24'd0;
            led_reg <= ~led_reg;           // 
				digit_sel <= digit_sel + 1'b1;
        end else begin
            counter <= counter + 1'b1;
        end
    end

    assign LED1 = led_reg;
	
	
	
	//========================================================================
	// 7
	//========================================================================


	//  0,1,2,3
	reg [3:0] digit;

	always @(*) begin
		case (digit_sel)
			2'd0: digit = 4'd0;
			2'd1: digit = 4'd1;
			2'd2: digit = 4'd2;
			2'd3: digit = 4'd3;
		endcase
	end

	// 7Low
	reg [6:0] seg;

	always @(*) begin
		case (digit)
			4'd0: seg = 7'b1000000;
			4'd1: seg = 7'b1111001;
			4'd2: seg = 7'b0100100;
			4'd3: seg = 7'b0110000;
			4'd4: seg = 7'b0011001;
			4'd5: seg = 7'b0010010;
			4'd6: seg = 7'b0000010;
			4'd7: seg = 7'b1111000;
			4'd8: seg = 7'b0000000;
			4'd9: seg = 7'b0010000;
			default: seg = 7'b1111111;
		endcase
	end

	//========================================================================
	// 
	//========================================================================

	// Low
	assign AN0 = (digit_sel == 2'd0) ? 1'b0 : 1'b1;
	assign AN1 = (digit_sel == 2'd1) ? 1'b0 : 1'b1;
	assign AN2 = (digit_sel == 2'd2) ? 1'b0 : 1'b1;
	assign AN3 = (digit_sel == 2'd3) ? 1'b0 : 1'b1;

	// 
	assign SG_A = seg[0];
	assign SG_B = seg[1];
	assign SG_C = seg[2];
	assign SG_D = seg[3];
	assign SG_E = seg[4];
	assign SG_F = seg[5];
	assign SG_G = seg[6];

	// 
	assign SG_DP = 1'b1;


    //========================================================================
    //  ( / )
    //========================================================================
    assign TX = 1'b1;               // UART TX 


    // SDRAM 
    assign SDRAM_ADDR = 13'd0;
    assign SDRAM_DQML = 1'b1;
    assign SDRAM_DQMH = 1'b1;
    assign SDRAM_BA   = 2'b0;
    assign SDRAM_nWE  = 1'b1;
    assign SDRAM_nCAS = 1'b1;
    assign SDRAM_nRAS = 1'b1;
    assign SDRAM_CS   = 1'b1;
    assign SDRAM_CLK  = 1'b0;
    assign SDRAM_CKE  = 1'b0;
    assign SDRAM_DATA = 16'hzzzz;   // High-Z

    // JTAG TDO High-Z ()
    assign JTAG_TDO = 1'bz;

    // : , Low, MOSI Low
    assign FLASH_CS = 1'b1;
    assign FLASH_CK = 1'b0;
    assign FLASH_SI = 1'b0;
    // FLASH_SO 
	
    //============================================================
    // I2C AQM0802A (WAIT修正版)
    //============================================================

    assign DISP_RST = 1'b1;

    // オープンドレイン
    reg scl_out = 1, scl_oe = 0;
    reg sda_out = 1, sda_oe = 0;

    assign DISP_SCL = scl_oe ? scl_out : 1'bz;
    assign DISP_SDA = sda_oe ? sda_out : 1'bz;

    //============================================================
    // 26.3us以上WAIT（安全側：約60us）
    //============================================================
    localparam WAIT_TIME = 16'd2000; // 約62.5us @32MHz

    reg [15:0] wait_cnt = 0;
    reg        waiting  = 0;

    //============================================================
    // 低速クロック
    //============================================================
    reg [15:0] div = 0;
    always @(posedge CLK) div <= div + 1;
    wire tick = (div == 0);

    //============================================================
    // 送信ROM
    //============================================================
    reg [7:0] rom [0:31];
    initial begin
        rom[0]=8'h00; rom[1]=8'h38;
        rom[2]=8'h00; rom[3]=8'h39;
        rom[4]=8'h00; rom[5]=8'h14;
        rom[6]=8'h00; rom[7]=8'h70;
        rom[8]=8'h00; rom[9]=8'h56;
        rom[10]=8'h00; rom[11]=8'h6C;
        rom[12]=8'h00; rom[13]=8'h38;
        rom[14]=8'h00; rom[15]=8'h0C;
        rom[16]=8'h00; rom[17]=8'h01;

        rom[18]=8'h40; rom[19]=8'h48;
        rom[20]=8'h40; rom[21]=8'h45;
        rom[22]=8'h40; rom[23]=8'h4C;
        rom[24]=8'h40; rom[25]=8'h4C;
        rom[26]=8'h40; rom[27]=8'h4F;
    end

    reg [5:0] rom_ptr = 0;
    reg [7:0] byte_data;
    reg [3:0] bit_cnt;
    reg [3:0] state = 0;

    //============================================================
    // FSM
    //============================================================
    always @(posedge CLK) begin
        if (tick) begin

            //====================================================
            // WAIT処理
            //====================================================
            if (waiting) begin
                if (wait_cnt == 0) begin
                    waiting <= 0;
                end else begin
                    wait_cnt <= wait_cnt - 1;
                end
  //              return;
            end

            case (state)

                // IDLE
                0: begin
                    scl_oe <= 0;
                    sda_oe <= 0;
                    state <= 1;
                end

                // START
                1: begin
                    sda_oe <= 1;
                    sda_out <= 0;
                    state <= 2;
                end

                // ADDRESS
                2: begin
                    byte_data <= 8'h7C;
                    bit_cnt <= 7;
                    state <= 3;
                end

                // SEND BIT
                3: begin
                    scl_oe <= 1; scl_out <= 0;
                    sda_out <= byte_data[bit_cnt];
                    state <= 4;
                end

                4: begin
                    scl_oe <= 0;
                    state <= 5;
                end

                5: begin
                    scl_oe <= 1; scl_out <= 0;
                    if (bit_cnt == 0)
                        state <= 6;
                    else begin
                        bit_cnt <= bit_cnt - 1;
                        state <= 3;
                    end
                end

                // ACK skip
                6: begin
                    scl_oe <= 0;
                    state <= 7;
                end

                // DATA load
                7: begin
                    byte_data <= rom[rom_ptr];
                    bit_cnt <= 7;
                    state <= 8;
                end

                // DATA send
                8: begin
                    scl_oe <= 1; scl_out <= 0;
                    sda_out <= byte_data[bit_cnt];
                    state <= 9;
                end

                9: begin
                    scl_oe <= 0;
                    state <= 10;
                end

                10: begin
                    scl_oe <= 1; scl_out <= 0;
                    if (bit_cnt == 0)
                        state <= 11;
                    else begin
                        bit_cnt <= bit_cnt - 1;
                        state <= 8;
                    end
                end

                // ACK skip
                11: begin
                    scl_oe <= 0;
                    state <= 12;
                end

                // STOP
                12: begin
                    sda_out <= 0;
                    scl_oe <= 0;
                    state <= 13;
                end

                13: begin
                    sda_oe <= 0;

                    // ★ここが重要（26.3us以上WAIT）
                    wait_cnt <= WAIT_TIME;
                    waiting  <= 1;
                    state <= 14;
                end

                // WAIT完了後
				14: begin
					if (rom_ptr < 27) begin
						rom_ptr <= rom_ptr + 1;
						state <= 0;
					end else begin
						state <= 15; // 停止状態へ
					end
				end

				// 追加
				15: begin
					// 完全停止
					scl_oe <= 0;
					sda_oe <= 0;
				end

            endcase
        end
    end

endmodule