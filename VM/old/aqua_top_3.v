//////////////////////////////////////////////////////////////////////////////
// Papilio Pro - cleaned version
// I2C LCD + LED + 7seg
//////////////////////////////////////////////////////////////////////////////

module aqua_top (
    input  wire CLK,

    input  wire RX,
    output wire TX,

    output wire AN0, AN1, AN2, AN3,
    output wire SG_A, SG_B, SG_C, SG_D, SG_E, SG_F, SG_G, SG_DP,

    output wire DISP_RST,
    inout  wire DISP_SDA,
    inout  wire DISP_SCL,

    output wire LED1,

    output wire [12:0] SDRAM_ADDR,
    inout  wire [15:0] SDRAM_DATA,
    output wire SDRAM_DQML,
    output wire SDRAM_DQMH,
    output wire [1:0] SDRAM_BA,
    output wire SDRAM_nWE,
    output wire SDRAM_nCAS,
    output wire SDRAM_nRAS,
    output wire SDRAM_CS,
    output wire SDRAM_CLK,
    output wire SDRAM_CKE
);

//////////////////////////////////////////////////////////////////////////////
// LED 0.5s
//////////////////////////////////////////////////////////////////////////////

reg [23:0] cnt = 0;
reg led = 0;

localparam HALF = 16_000_000;

always @(posedge CLK) begin
    if (cnt == HALF-1) begin
        cnt <= 0;
        led <= ~led;
    end else begin
        cnt <= cnt + 1;
    end
end

assign LED1 = led;

//////////////////////////////////////////////////////////////////////////////
// 7seg (simple)
//////////////////////////////////////////////////////////////////////////////

reg [1:0] digit_sel = 0;
reg [3:0] digit;

always @(posedge CLK) begin
    if (cnt == 0)
        digit_sel <= digit_sel + 1;
end

always @(*) begin
    case (digit_sel)
        0: digit = 0;
        1: digit = 1;
        2: digit = 2;
        3: digit = 3;
    endcase
end

reg [6:0] seg;

always @(*) begin
    case (digit)
        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        default: seg = 7'b1111111;
    endcase
end

assign AN0 = (digit_sel==0)?0:1;
assign AN1 = (digit_sel==1)?0:1;
assign AN2 = (digit_sel==2)?0:1;
assign AN3 = (digit_sel==3)?0:1;

assign {SG_G,SG_F,SG_E,SG_D,SG_C,SG_B,SG_A} = seg;
assign SG_DP = 1'b1;

assign TX = 1'b1;

//////////////////////////////////////////////////////////////////////////////
// I2Ci2c_master
//////////////////////////////////////////////////////////////////////////////

assign DISP_RST = 1'b1;

//====================
// I2C
//====================
wire scl;
wire sda;

assign DISP_SCL = scl;
assign DISP_SDA = sda;

//====================
// i2c_master
//====================
reg start;
reg [7:0] tx_data;
wire busy;

localparam DEV = 8'h7C;

i2c_master i2c0(
    .clk(CLK),
    .rst(1'b0),
    .start(start),
    .dev(DEV),
    .data(tx_data),
    .busy(busy),
    .scl(scl),
    .sda(sda)
);

//====================
// ROM
//====================
reg [7:0] rom [0:27];

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

//====================
// FSM
//====================
reg [5:0] ptr = 0;
reg [2:0] state = 0;

reg start_req = 0;

always @(posedge CLK) begin
    case(state)

    0: begin
        tx_data <= rom[ptr];
        start_req <= 1;
        state <= 1;
    end

    1: begin
        // startをレベルで出す
        if(start_req)
            start <= 1;
        else
            start <= 0;

        // i2c_masterが拾ったらbusyが立つ
        if(busy) begin
            start_req <= 0;
            state <= 2;
        end
    end

    2: begin
        if(!busy) begin
            if(ptr < 27) begin
                ptr <= ptr + 1;
                state <= 0;
            end else begin
                state <= 3;
            end
        end
		start_req <= 0;
    end

    3: begin
        start <= 0;
		state <= 3;
		start_req <= 0;
    end

    endcase
end
//////////////////////////////////////////////////////////////////////////////
// SDRAM idle
//////////////////////////////////////////////////////////////////////////////

assign SDRAM_ADDR = 0;
assign SDRAM_DATA = 16'hzzzz;
assign SDRAM_DQML = 1;
assign SDRAM_DQMH = 1;
assign SDRAM_BA = 0;
assign SDRAM_nWE = 1;
assign SDRAM_nCAS = 1;
assign SDRAM_nRAS = 1;
assign SDRAM_CS = 1;
assign SDRAM_CLK = 0;
assign SDRAM_CKE = 0;

endmodule


module i2c_master(
    input  wire clk,
    input  wire rst,
    input  wire start,
    input  wire [7:0] dev,
    input  wire [7:0] data,
    output reg  busy,
    output wire scl,
    inout  wire sda
);

// open drain
reg scl_r=1;
reg sda_r=1;
reg sda_oe=0;

assign scl = (scl_r==0)?0:1'bz;
assign sda = (sda_oe && sda_r==0)?0:1'bz;

// 10kHz
reg [11:0] div=0;
reg tick=0;

always @(posedge clk) begin
    if(div==1599) begin
        div<=0;
        tick<=1;
    end else begin
        div<=div+1;
        tick<=0;
    end
end

reg [3:0] state=0;
reg [7:0] sh;
reg [2:0] bit_cnt;

always @(posedge clk) begin
    if(rst) begin
        state<=0;
        busy<=0;
        scl_r<=1;
        sda_r<=1;
        sda_oe<=0;
    end else if(tick) begin

        case(state)

        0: begin
            scl_r<=1; sda_oe<=1; sda_r<=1; busy<=0;
            if(start) begin busy<=1; state<=1; end
        end

        1: begin sda_r<=0; state<=2; end

        2: begin scl_r<=0; sh<=dev; bit_cnt<=7; state<=3; busy<=1;end

        3: begin sda_r<=sh[bit_cnt]; scl_r<=1; state<=4; busy<=1;end

        4: begin
            scl_r<=0;
            if(bit_cnt==0) state<=5;
            else begin bit_cnt<=bit_cnt-1; state<=3; end
			busy<=1;
        end

        5: begin sda_oe<=0; scl_r<=1; state<=6; busy<=1;end
        6: begin scl_r<=0; sda_oe<=1; state<=7; busy<=1;end

        7: begin sh<=data; bit_cnt<=7; state<=8; busy<=1;end

        8: begin sda_r<=sh[bit_cnt]; scl_r<=1; state<=9; busy<=1;end

        9: begin
            scl_r<=0;
            if(bit_cnt==0) state<=10;
            else begin bit_cnt<=bit_cnt-1; state<=8; end
			busy<=1;
        end

        10: begin sda_oe<=0; scl_r<=1; state<=11; busy<=1;end
        11: begin scl_r<=0; sda_oe<=1; state<=12; busy<=1;end

        12: begin sda_r<=0; scl_r<=1; state<=13; busy<=1;end
        13: begin sda_r<=1; state<=0; busy<=1;end

        endcase
    end
end

endmodule