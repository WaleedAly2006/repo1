//
// Verilog description for cell uart_top, 
// 06/23/20 09:01:21
//
// Precision RTL Synthesis, 64-bit 2017.2.0.12//


module uart_top ( addr, clk, cs, datin, nrw, rst, sin, datout, int, sout ) ;

    input [2:0]addr ;
    input clk ;
    input cs ;
    input [7:0]datin ;
    input nrw ;
    input rst ;
    input sin ;
    output [7:0]datout ;
    output int ;
    output sout ;

    wire sout_dup_0, clear_flags, enable_write, enable_xmit_clk, start_xmit;
    wire [1:1]U_1_U_0_current_state;
    wire [7:0]U_2_divlsb;
    wire [7:0]U_2_divmsb;
    wire [15:1]U_2_clk_cnt;
    wire [15:0]U_2_rtlc5n88;
    wire [15:0]U_2_rtlcn516;
    wire U_4_done_rcving, U_4_done_xmitting;
    wire [2:0]U_4_rcv_bit_cnt;
    wire [7:0]U_4_recvdt;
    wire [3:0]U_4_status;
    wire [7:0]U_4_xmitdt;
    wire [2:0]U_4_U_0_xmit_bit_cnt;
    wire [5:1]U_4_U_0_xmit_current_state;
    wire [6:1]U_4_U_0_rcv_current_state;
    wire nx21277z19, nx21277z18, nx21277z17, nx21277z16, nx21277z15, nx21277z14, 
         nx21277z13, nx21277z12, nx21277z11, nx21277z10, nx21277z9, nx21277z8, 
         nx21277z7, nx21277z6, nx21277z5, nx512z14, nx512z13, nx512z12, nx512z11, 
         nx512z10, nx512z9, nx512z8, nx512z7, nx512z6, nx512z5, nx512z4, nx512z3, 
         nx512z2, nx65051z2, nx63057z4, nx63057z3;
    wire [2:0]addr_int;
    wire clk_int, cs_int;
    wire [7:0]datin_int;
    wire nrw_int, rst_int, sin_int;
    wire [7:0]datout_dup_0;
    wire int_dup_0, ser_if_data_3_, ser_if_data_2_, ser_if_data_1_, 
         ser_if_data_0_, nx7741z3, U_1_U_0_GND, nx9735z2, nx8738z1, nx9735z1, 
         nx7741z1, nx6744z1, U_2_PWR, nx64054z3, nx17214z1, nx9427z1, nx64054z2, 
         NOT_U_4_read_bit, nx19766z1, nx30972z1, nx29975z1, nx28978z1, nx27981z1, 
         nx26984z1, nx25987z1, nx24990z1, nx23993z1, nx23993z2, nx24990z2, 
         nx25987z2, nx26984z2, nx27981z2, nx28978z2, nx29975z2, 
         U_4_U_1_xmitting_reg_3n3ss1, U_4_U_1_rcving_reg_3n3ss1, 
         U_4_U_1_done_rcving_reg_3n3ss1, nx48030z1, nx14061z1, nx15058z1, 
         nx19046z1, nx16055z1, nx17052z1, nx3309z1, nx1315z1, nx318z1, nx64857z1, 
         nx13064z1, nx18049z1, nx4306z1, nx16055z2, nx318z2, nx3650z1, 
         NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49, 
         NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50, 
         U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2_, nx46356z1, nx47353z1, 
         nx48350z1, nx35193z1, nx36190z1, nx37187z1, nx35948z3, nx19046z7, 
         nx19046z8, nx19046z9, nx17052z3, nx19046z6, nx19046z5, nx19046z4, 
         nx19046z3, nx19046z2, nx17052z2, nx21277z38, nx21277z35, nx21277z32, 
         nx21277z29, nx21277z26, nx21277z23, nx21277z20, nx35948z2, nx35948z4, 
         nx512z15, nx21277z1, NOT_U_1_U_0_GND, nx7741z2, NOT_cs_int, nx64054z4, 
         nx20043z1, nx64857z2, nx63860z1, nx50810z1, nx35948z1;
    wire [1611:0] xmplr_dummy ;




    assign nx512z14 = ~nx512z15 ;
    assign U_1_U_0_GND = 1'b0 ;
    assign U_2_PWR = 1'b1 ;
    arriav_io_ibuf addr_ibuf_2_ (.o (addr_int[2]), .i (addr[2]), .ibar (
                   xmplr_dummy [0]), .dynamicterminationcontrol (xmplr_dummy [1]
                   )) ;
    arriav_io_ibuf addr_ibuf_1_ (.o (addr_int[1]), .i (addr[1]), .ibar (
                   xmplr_dummy [2]), .dynamicterminationcontrol (xmplr_dummy [3]
                   )) ;
    arriav_io_ibuf addr_ibuf_0_ (.o (addr_int[0]), .i (addr[0]), .ibar (
                   xmplr_dummy [4]), .dynamicterminationcontrol (xmplr_dummy [5]
                   )) ;
    arriav_io_ibuf clk_ibuf (.o (clk_int), .i (clk), .ibar (xmplr_dummy [6]), .dynamicterminationcontrol (
                   xmplr_dummy [7])) ;
    arriav_io_ibuf cs_ibuf (.o (cs_int), .i (cs), .ibar (xmplr_dummy [8]), .dynamicterminationcontrol (
                   xmplr_dummy [9])) ;
    arriav_io_ibuf datin_ibuf_7_ (.o (datin_int[7]), .i (datin[7]), .ibar (
                   xmplr_dummy [10]), .dynamicterminationcontrol (
                   xmplr_dummy [11])) ;
    arriav_io_ibuf datin_ibuf_6_ (.o (datin_int[6]), .i (datin[6]), .ibar (
                   xmplr_dummy [12]), .dynamicterminationcontrol (
                   xmplr_dummy [13])) ;
    arriav_io_ibuf datin_ibuf_5_ (.o (datin_int[5]), .i (datin[5]), .ibar (
                   xmplr_dummy [14]), .dynamicterminationcontrol (
                   xmplr_dummy [15])) ;
    arriav_io_ibuf datin_ibuf_4_ (.o (datin_int[4]), .i (datin[4]), .ibar (
                   xmplr_dummy [16]), .dynamicterminationcontrol (
                   xmplr_dummy [17])) ;
    arriav_io_ibuf datin_ibuf_3_ (.o (datin_int[3]), .i (datin[3]), .ibar (
                   xmplr_dummy [18]), .dynamicterminationcontrol (
                   xmplr_dummy [19])) ;
    arriav_io_ibuf datin_ibuf_2_ (.o (datin_int[2]), .i (datin[2]), .ibar (
                   xmplr_dummy [20]), .dynamicterminationcontrol (
                   xmplr_dummy [21])) ;
    arriav_io_ibuf datin_ibuf_1_ (.o (datin_int[1]), .i (datin[1]), .ibar (
                   xmplr_dummy [22]), .dynamicterminationcontrol (
                   xmplr_dummy [23])) ;
    arriav_io_ibuf datin_ibuf_0_ (.o (datin_int[0]), .i (datin[0]), .ibar (
                   xmplr_dummy [24]), .dynamicterminationcontrol (
                   xmplr_dummy [25])) ;
    arriav_io_ibuf nrw_ibuf (.o (nrw_int), .i (nrw), .ibar (xmplr_dummy [26]), .dynamicterminationcontrol (
                   xmplr_dummy [27])) ;
    arriav_io_ibuf rst_ibuf (.o (rst_int), .i (rst), .ibar (xmplr_dummy [28]), .dynamicterminationcontrol (
                   xmplr_dummy [29])) ;
    arriav_io_ibuf sin_ibuf (.o (sin_int), .i (sin), .ibar (xmplr_dummy [30]), .dynamicterminationcontrol (
                   xmplr_dummy [31])) ;
    arriav_io_obuf datout_obuf_7_ (.o (datout[7]), .obar (xmplr_dummy [32]), .i (
                   datout_dup_0[7]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [33]), .seriesterminationcontrol ({
                   xmplr_dummy [34],xmplr_dummy [35],xmplr_dummy [36],
                   xmplr_dummy [37],xmplr_dummy [38],xmplr_dummy [39],
                   xmplr_dummy [40],xmplr_dummy [41],xmplr_dummy [42],
                   xmplr_dummy [43],xmplr_dummy [44],xmplr_dummy [45],
                   xmplr_dummy [46],xmplr_dummy [47],xmplr_dummy [48],
                   xmplr_dummy [49]}), .parallelterminationcontrol ({
                   xmplr_dummy [50],xmplr_dummy [51],xmplr_dummy [52],
                   xmplr_dummy [53],xmplr_dummy [54],xmplr_dummy [55],
                   xmplr_dummy [56],xmplr_dummy [57],xmplr_dummy [58],
                   xmplr_dummy [59],xmplr_dummy [60],xmplr_dummy [61],
                   xmplr_dummy [62],xmplr_dummy [63],xmplr_dummy [64],
                   xmplr_dummy [65]}), .devoe (xmplr_dummy [66])) ;
    arriav_io_obuf datout_obuf_6_ (.o (datout[6]), .obar (xmplr_dummy [67]), .i (
                   datout_dup_0[6]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [68]), .seriesterminationcontrol ({
                   xmplr_dummy [69],xmplr_dummy [70],xmplr_dummy [71],
                   xmplr_dummy [72],xmplr_dummy [73],xmplr_dummy [74],
                   xmplr_dummy [75],xmplr_dummy [76],xmplr_dummy [77],
                   xmplr_dummy [78],xmplr_dummy [79],xmplr_dummy [80],
                   xmplr_dummy [81],xmplr_dummy [82],xmplr_dummy [83],
                   xmplr_dummy [84]}), .parallelterminationcontrol ({
                   xmplr_dummy [85],xmplr_dummy [86],xmplr_dummy [87],
                   xmplr_dummy [88],xmplr_dummy [89],xmplr_dummy [90],
                   xmplr_dummy [91],xmplr_dummy [92],xmplr_dummy [93],
                   xmplr_dummy [94],xmplr_dummy [95],xmplr_dummy [96],
                   xmplr_dummy [97],xmplr_dummy [98],xmplr_dummy [99],
                   xmplr_dummy [100]}), .devoe (xmplr_dummy [101])) ;
    arriav_io_obuf datout_obuf_5_ (.o (datout[5]), .obar (xmplr_dummy [102]), .i (
                   datout_dup_0[5]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [103]), .seriesterminationcontrol ({
                   xmplr_dummy [104],xmplr_dummy [105],xmplr_dummy [106],
                   xmplr_dummy [107],xmplr_dummy [108],xmplr_dummy [109],
                   xmplr_dummy [110],xmplr_dummy [111],xmplr_dummy [112],
                   xmplr_dummy [113],xmplr_dummy [114],xmplr_dummy [115],
                   xmplr_dummy [116],xmplr_dummy [117],xmplr_dummy [118],
                   xmplr_dummy [119]}), .parallelterminationcontrol ({
                   xmplr_dummy [120],xmplr_dummy [121],xmplr_dummy [122],
                   xmplr_dummy [123],xmplr_dummy [124],xmplr_dummy [125],
                   xmplr_dummy [126],xmplr_dummy [127],xmplr_dummy [128],
                   xmplr_dummy [129],xmplr_dummy [130],xmplr_dummy [131],
                   xmplr_dummy [132],xmplr_dummy [133],xmplr_dummy [134],
                   xmplr_dummy [135]}), .devoe (xmplr_dummy [136])) ;
    arriav_io_obuf datout_obuf_4_ (.o (datout[4]), .obar (xmplr_dummy [137]), .i (
                   datout_dup_0[4]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [138]), .seriesterminationcontrol ({
                   xmplr_dummy [139],xmplr_dummy [140],xmplr_dummy [141],
                   xmplr_dummy [142],xmplr_dummy [143],xmplr_dummy [144],
                   xmplr_dummy [145],xmplr_dummy [146],xmplr_dummy [147],
                   xmplr_dummy [148],xmplr_dummy [149],xmplr_dummy [150],
                   xmplr_dummy [151],xmplr_dummy [152],xmplr_dummy [153],
                   xmplr_dummy [154]}), .parallelterminationcontrol ({
                   xmplr_dummy [155],xmplr_dummy [156],xmplr_dummy [157],
                   xmplr_dummy [158],xmplr_dummy [159],xmplr_dummy [160],
                   xmplr_dummy [161],xmplr_dummy [162],xmplr_dummy [163],
                   xmplr_dummy [164],xmplr_dummy [165],xmplr_dummy [166],
                   xmplr_dummy [167],xmplr_dummy [168],xmplr_dummy [169],
                   xmplr_dummy [170]}), .devoe (xmplr_dummy [171])) ;
    arriav_io_obuf datout_obuf_3_ (.o (datout[3]), .obar (xmplr_dummy [172]), .i (
                   datout_dup_0[3]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [173]), .seriesterminationcontrol ({
                   xmplr_dummy [174],xmplr_dummy [175],xmplr_dummy [176],
                   xmplr_dummy [177],xmplr_dummy [178],xmplr_dummy [179],
                   xmplr_dummy [180],xmplr_dummy [181],xmplr_dummy [182],
                   xmplr_dummy [183],xmplr_dummy [184],xmplr_dummy [185],
                   xmplr_dummy [186],xmplr_dummy [187],xmplr_dummy [188],
                   xmplr_dummy [189]}), .parallelterminationcontrol ({
                   xmplr_dummy [190],xmplr_dummy [191],xmplr_dummy [192],
                   xmplr_dummy [193],xmplr_dummy [194],xmplr_dummy [195],
                   xmplr_dummy [196],xmplr_dummy [197],xmplr_dummy [198],
                   xmplr_dummy [199],xmplr_dummy [200],xmplr_dummy [201],
                   xmplr_dummy [202],xmplr_dummy [203],xmplr_dummy [204],
                   xmplr_dummy [205]}), .devoe (xmplr_dummy [206])) ;
    arriav_io_obuf datout_obuf_2_ (.o (datout[2]), .obar (xmplr_dummy [207]), .i (
                   datout_dup_0[2]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [208]), .seriesterminationcontrol ({
                   xmplr_dummy [209],xmplr_dummy [210],xmplr_dummy [211],
                   xmplr_dummy [212],xmplr_dummy [213],xmplr_dummy [214],
                   xmplr_dummy [215],xmplr_dummy [216],xmplr_dummy [217],
                   xmplr_dummy [218],xmplr_dummy [219],xmplr_dummy [220],
                   xmplr_dummy [221],xmplr_dummy [222],xmplr_dummy [223],
                   xmplr_dummy [224]}), .parallelterminationcontrol ({
                   xmplr_dummy [225],xmplr_dummy [226],xmplr_dummy [227],
                   xmplr_dummy [228],xmplr_dummy [229],xmplr_dummy [230],
                   xmplr_dummy [231],xmplr_dummy [232],xmplr_dummy [233],
                   xmplr_dummy [234],xmplr_dummy [235],xmplr_dummy [236],
                   xmplr_dummy [237],xmplr_dummy [238],xmplr_dummy [239],
                   xmplr_dummy [240]}), .devoe (xmplr_dummy [241])) ;
    arriav_io_obuf datout_obuf_1_ (.o (datout[1]), .obar (xmplr_dummy [242]), .i (
                   datout_dup_0[1]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [243]), .seriesterminationcontrol ({
                   xmplr_dummy [244],xmplr_dummy [245],xmplr_dummy [246],
                   xmplr_dummy [247],xmplr_dummy [248],xmplr_dummy [249],
                   xmplr_dummy [250],xmplr_dummy [251],xmplr_dummy [252],
                   xmplr_dummy [253],xmplr_dummy [254],xmplr_dummy [255],
                   xmplr_dummy [256],xmplr_dummy [257],xmplr_dummy [258],
                   xmplr_dummy [259]}), .parallelterminationcontrol ({
                   xmplr_dummy [260],xmplr_dummy [261],xmplr_dummy [262],
                   xmplr_dummy [263],xmplr_dummy [264],xmplr_dummy [265],
                   xmplr_dummy [266],xmplr_dummy [267],xmplr_dummy [268],
                   xmplr_dummy [269],xmplr_dummy [270],xmplr_dummy [271],
                   xmplr_dummy [272],xmplr_dummy [273],xmplr_dummy [274],
                   xmplr_dummy [275]}), .devoe (xmplr_dummy [276])) ;
    arriav_io_obuf datout_obuf_0_ (.o (datout[0]), .obar (xmplr_dummy [277]), .i (
                   datout_dup_0[0]), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [278]), .seriesterminationcontrol ({
                   xmplr_dummy [279],xmplr_dummy [280],xmplr_dummy [281],
                   xmplr_dummy [282],xmplr_dummy [283],xmplr_dummy [284],
                   xmplr_dummy [285],xmplr_dummy [286],xmplr_dummy [287],
                   xmplr_dummy [288],xmplr_dummy [289],xmplr_dummy [290],
                   xmplr_dummy [291],xmplr_dummy [292],xmplr_dummy [293],
                   xmplr_dummy [294]}), .parallelterminationcontrol ({
                   xmplr_dummy [295],xmplr_dummy [296],xmplr_dummy [297],
                   xmplr_dummy [298],xmplr_dummy [299],xmplr_dummy [300],
                   xmplr_dummy [301],xmplr_dummy [302],xmplr_dummy [303],
                   xmplr_dummy [304],xmplr_dummy [305],xmplr_dummy [306],
                   xmplr_dummy [307],xmplr_dummy [308],xmplr_dummy [309],
                   xmplr_dummy [310]}), .devoe (xmplr_dummy [311])) ;
    arriav_io_obuf int_obuf (.o (int), .obar (xmplr_dummy [312]), .i (int_dup_0)
                   , .oe (1'b1), .dynamicterminationcontrol (xmplr_dummy [313])
                   , .seriesterminationcontrol ({xmplr_dummy [314],
                   xmplr_dummy [315],xmplr_dummy [316],xmplr_dummy [317],
                   xmplr_dummy [318],xmplr_dummy [319],xmplr_dummy [320],
                   xmplr_dummy [321],xmplr_dummy [322],xmplr_dummy [323],
                   xmplr_dummy [324],xmplr_dummy [325],xmplr_dummy [326],
                   xmplr_dummy [327],xmplr_dummy [328],xmplr_dummy [329]}), .parallelterminationcontrol (
                   {xmplr_dummy [330],xmplr_dummy [331],xmplr_dummy [332],
                   xmplr_dummy [333],xmplr_dummy [334],xmplr_dummy [335],
                   xmplr_dummy [336],xmplr_dummy [337],xmplr_dummy [338],
                   xmplr_dummy [339],xmplr_dummy [340],xmplr_dummy [341],
                   xmplr_dummy [342],xmplr_dummy [343],xmplr_dummy [344],
                   xmplr_dummy [345]}), .devoe (xmplr_dummy [346])) ;
    arriav_io_obuf sout_obuf (.o (sout), .obar (xmplr_dummy [347]), .i (
                   sout_dup_0), .oe (1'b1), .dynamicterminationcontrol (
                   xmplr_dummy [348]), .seriesterminationcontrol ({
                   xmplr_dummy [349],xmplr_dummy [350],xmplr_dummy [351],
                   xmplr_dummy [352],xmplr_dummy [353],xmplr_dummy [354],
                   xmplr_dummy [355],xmplr_dummy [356],xmplr_dummy [357],
                   xmplr_dummy [358],xmplr_dummy [359],xmplr_dummy [360],
                   xmplr_dummy [361],xmplr_dummy [362],xmplr_dummy [363],
                   xmplr_dummy [364]}), .parallelterminationcontrol ({
                   xmplr_dummy [365],xmplr_dummy [366],xmplr_dummy [367],
                   xmplr_dummy [368],xmplr_dummy [369],xmplr_dummy [370],
                   xmplr_dummy [371],xmplr_dummy [372],xmplr_dummy [373],
                   xmplr_dummy [374],xmplr_dummy [375],xmplr_dummy [376],
                   xmplr_dummy [377],xmplr_dummy [378],xmplr_dummy [379],
                   xmplr_dummy [380]}), .devoe (xmplr_dummy [381])) ;
    assign NOT_U_1_U_0_GND = ~U_1_U_0_GND ;
    assign NOT_cs_int = ~cs_int ;
    assign sout_dup_0 = ~nx50810z1 ;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60650 (.combout (
                      xmplr_dummy [382]), .sumout (U_2_rtlc5n88[0]), .cout (
                      nx21277z19), .shareout (xmplr_dummy [383]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[0]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (U_1_U_0_GND)
                      , .sharein (xmplr_dummy [384])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60650.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60649 (.combout (
                      xmplr_dummy [385]), .sumout (U_2_rtlc5n88[1]), .cout (
                      nx21277z18), .shareout (xmplr_dummy [386]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[1]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z19)
                      , .sharein (xmplr_dummy [387])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60649.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60648 (.combout (
                      xmplr_dummy [388]), .sumout (U_2_rtlc5n88[2]), .cout (
                      nx21277z17), .shareout (xmplr_dummy [389]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[2]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z18)
                      , .sharein (xmplr_dummy [390])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60648.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60647 (.combout (
                      xmplr_dummy [391]), .sumout (U_2_rtlc5n88[3]), .cout (
                      nx21277z16), .shareout (xmplr_dummy [392]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[3]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z17)
                      , .sharein (xmplr_dummy [393])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60647.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60646 (.combout (
                      xmplr_dummy [394]), .sumout (U_2_rtlc5n88[4]), .cout (
                      nx21277z15), .shareout (xmplr_dummy [395]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[4]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z16)
                      , .sharein (xmplr_dummy [396])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60646.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60645 (.combout (
                      xmplr_dummy [397]), .sumout (U_2_rtlc5n88[5]), .cout (
                      nx21277z14), .shareout (xmplr_dummy [398]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[5]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z15)
                      , .sharein (xmplr_dummy [399])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60645.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60644 (.combout (
                      xmplr_dummy [400]), .sumout (U_2_rtlc5n88[6]), .cout (
                      nx21277z13), .shareout (xmplr_dummy [401]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[6]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z14)
                      , .sharein (xmplr_dummy [402])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60644.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60643 (.combout (
                      xmplr_dummy [403]), .sumout (U_2_rtlc5n88[7]), .cout (
                      nx21277z12), .shareout (xmplr_dummy [404]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divlsb[7]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z13)
                      , .sharein (xmplr_dummy [405])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60643.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60642 (.combout (
                      xmplr_dummy [406]), .sumout (U_2_rtlc5n88[8]), .cout (
                      nx21277z11), .shareout (xmplr_dummy [407]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[0]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z12)
                      , .sharein (xmplr_dummy [408])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60642.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60641 (.combout (
                      xmplr_dummy [409]), .sumout (U_2_rtlc5n88[9]), .cout (
                      nx21277z10), .shareout (xmplr_dummy [410]), .dataa (1'b1)
                      , .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[1]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z11)
                      , .sharein (xmplr_dummy [411])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60641.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60640 (.combout (
                      xmplr_dummy [412]), .sumout (U_2_rtlc5n88[10]), .cout (
                      nx21277z9), .shareout (xmplr_dummy [413]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[2]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z10)
                      , .sharein (xmplr_dummy [414])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60640.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60639 (.combout (
                      xmplr_dummy [415]), .sumout (U_2_rtlc5n88[11]), .cout (
                      nx21277z8), .shareout (xmplr_dummy [416]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[3]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z9), 
                      .sharein (xmplr_dummy [417])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60639.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60638 (.combout (
                      xmplr_dummy [418]), .sumout (U_2_rtlc5n88[12]), .cout (
                      nx21277z7), .shareout (xmplr_dummy [419]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[4]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z8), 
                      .sharein (xmplr_dummy [420])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60638.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60637 (.combout (
                      xmplr_dummy [421]), .sumout (U_2_rtlc5n88[13]), .cout (
                      nx21277z6), .shareout (xmplr_dummy [422]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[5]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z7), 
                      .sharein (xmplr_dummy [423])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60637.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60636 (.combout (
                      xmplr_dummy [424]), .sumout (U_2_rtlc5n88[14]), .cout (
                      nx21277z5), .shareout (xmplr_dummy [425]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[6]), .datae (
                      1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (nx21277z6), 
                      .sharein (xmplr_dummy [426])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60636.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_rtlc5_166_dec_4_ix21277z60634 (.combout (
                      xmplr_dummy [427]), .sumout (U_2_rtlc5n88[15]), .cout (
                      xmplr_dummy [428]), .shareout (xmplr_dummy [429]), .dataa (
                      1'b1), .datab (1'b1), .datac (1'b1), .datad (U_2_divmsb[7]
                      ), .datae (1'b1), .dataf (U_2_PWR), .datag (1'b1), .cin (
                      nx21277z5), .sharein (xmplr_dummy [430])) ;
                      defparam U_2_rtlc5_166_dec_4_ix21277z60634.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60645 (.combout (xmplr_dummy [431])
                      , .sumout (U_2_rtlcn516[0]), .cout (nx512z13), .shareout (
                      xmplr_dummy [432]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (nx512z14), .datae (1'b1), .dataf (U_2_PWR)
                      , .datag (1'b1), .cin (U_1_U_0_GND), .sharein (
                      xmplr_dummy [433])) ;
                      defparam U_2_modgen_inc_5_ix512z60645.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60644 (.combout (xmplr_dummy [434])
                      , .sumout (U_2_rtlcn516[1]), .cout (nx512z12), .shareout (
                      xmplr_dummy [435]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[1]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z13), .sharein (
                      xmplr_dummy [436])) ;
                      defparam U_2_modgen_inc_5_ix512z60644.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60643 (.combout (xmplr_dummy [437])
                      , .sumout (U_2_rtlcn516[2]), .cout (nx512z11), .shareout (
                      xmplr_dummy [438]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[2]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z12), .sharein (
                      xmplr_dummy [439])) ;
                      defparam U_2_modgen_inc_5_ix512z60643.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60642 (.combout (xmplr_dummy [440])
                      , .sumout (U_2_rtlcn516[3]), .cout (nx512z10), .shareout (
                      xmplr_dummy [441]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[3]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z11), .sharein (
                      xmplr_dummy [442])) ;
                      defparam U_2_modgen_inc_5_ix512z60642.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60641 (.combout (xmplr_dummy [443])
                      , .sumout (U_2_rtlcn516[4]), .cout (nx512z9), .shareout (
                      xmplr_dummy [444]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[4]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z10), .sharein (
                      xmplr_dummy [445])) ;
                      defparam U_2_modgen_inc_5_ix512z60641.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60640 (.combout (xmplr_dummy [446])
                      , .sumout (U_2_rtlcn516[5]), .cout (nx512z8), .shareout (
                      xmplr_dummy [447]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[5]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z9), .sharein (
                      xmplr_dummy [448])) ;
                      defparam U_2_modgen_inc_5_ix512z60640.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60639 (.combout (xmplr_dummy [449])
                      , .sumout (U_2_rtlcn516[6]), .cout (nx512z7), .shareout (
                      xmplr_dummy [450]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[6]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z8), .sharein (
                      xmplr_dummy [451])) ;
                      defparam U_2_modgen_inc_5_ix512z60639.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60638 (.combout (xmplr_dummy [452])
                      , .sumout (U_2_rtlcn516[7]), .cout (nx512z6), .shareout (
                      xmplr_dummy [453]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[7]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z7), .sharein (
                      xmplr_dummy [454])) ;
                      defparam U_2_modgen_inc_5_ix512z60638.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60637 (.combout (xmplr_dummy [455])
                      , .sumout (U_2_rtlcn516[8]), .cout (nx512z5), .shareout (
                      xmplr_dummy [456]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[8]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z6), .sharein (
                      xmplr_dummy [457])) ;
                      defparam U_2_modgen_inc_5_ix512z60637.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60636 (.combout (xmplr_dummy [458])
                      , .sumout (U_2_rtlcn516[9]), .cout (nx512z4), .shareout (
                      xmplr_dummy [459]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[9]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z5), .sharein (
                      xmplr_dummy [460])) ;
                      defparam U_2_modgen_inc_5_ix512z60636.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60635 (.combout (xmplr_dummy [461])
                      , .sumout (U_2_rtlcn516[10]), .cout (nx512z3), .shareout (
                      xmplr_dummy [462]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[10]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z4), .sharein (
                      xmplr_dummy [463])) ;
                      defparam U_2_modgen_inc_5_ix512z60635.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60634 (.combout (xmplr_dummy [464])
                      , .sumout (U_2_rtlcn516[11]), .cout (nx512z2), .shareout (
                      xmplr_dummy [465]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[11]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z3), .sharein (
                      xmplr_dummy [466])) ;
                      defparam U_2_modgen_inc_5_ix512z60634.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix512z60633 (.combout (xmplr_dummy [467])
                      , .sumout (U_2_rtlcn516[12]), .cout (nx65051z2), .shareout (
                      xmplr_dummy [468]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_2_clk_cnt[12]), .datae (1'b1), .dataf (
                      U_1_U_0_GND), .datag (1'b1), .cin (nx512z2), .sharein (
                      xmplr_dummy [469])) ;
                      defparam U_2_modgen_inc_5_ix512z60633.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix65051z60633 (.combout (
                      xmplr_dummy [470]), .sumout (U_2_rtlcn516[13]), .cout (
                      nx63057z4), .shareout (xmplr_dummy [471]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_clk_cnt[13]), .datae (
                      1'b1), .dataf (U_1_U_0_GND), .datag (1'b1), .cin (
                      nx65051z2), .sharein (xmplr_dummy [472])) ;
                      defparam U_2_modgen_inc_5_ix65051z60633.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix63057z60634 (.combout (
                      xmplr_dummy [473]), .sumout (U_2_rtlcn516[14]), .cout (
                      nx63057z3), .shareout (xmplr_dummy [474]), .dataa (1'b1), 
                      .datab (1'b1), .datac (1'b1), .datad (U_2_clk_cnt[14]), .datae (
                      1'b1), .dataf (U_1_U_0_GND), .datag (1'b1), .cin (
                      nx63057z4), .sharein (xmplr_dummy [475])) ;
                      defparam U_2_modgen_inc_5_ix63057z60634.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb U_2_modgen_inc_5_ix63057z60633 (.combout (
                      xmplr_dummy [476]), .sumout (U_2_rtlcn516[15]), .cout (
                      xmplr_dummy [477]), .shareout (xmplr_dummy [478]), .dataa (
                      1'b1), .datab (1'b1), .datac (1'b1), .datad (
                      U_2_clk_cnt[15]), .datae (1'b1), .dataf (U_1_U_0_GND), .datag (
                      1'b1), .cin (nx63057z3), .sharein (xmplr_dummy [479])) ;
                      defparam U_2_modgen_inc_5_ix63057z60633.lut_mask = 64'h000000ff0000ff00;
    arriav_lcell_comb ix29832z60633 (.combout (datout_dup_0[7]), .sumout (
                      xmplr_dummy [480]), .cout (xmplr_dummy [481]), .shareout (
                      xmplr_dummy [482]), .dataa (U_2_divlsb[7]), .datab (
                      addr_int[1]), .datac (U_2_divmsb[7]), .datad (addr_int[0])
                      , .datae (addr_int[2]), .dataf (U_4_recvdt[7]), .datag (
                      U_4_xmitdt[7]), .cin (xmplr_dummy [483]), .sharein (
                      xmplr_dummy [484])) ;
                      defparam ix29832z60633.lut_mask = 64'h3330302200303022;
                      defparam ix29832z60633.extended_lut = "on";
    arriav_lcell_comb ix30829z60633 (.combout (datout_dup_0[6]), .sumout (
                      xmplr_dummy [485]), .cout (xmplr_dummy [486]), .shareout (
                      xmplr_dummy [487]), .dataa (U_2_divlsb[6]), .datab (
                      addr_int[1]), .datac (U_2_divmsb[6]), .datad (addr_int[0])
                      , .datae (addr_int[2]), .dataf (U_4_recvdt[6]), .datag (
                      U_4_xmitdt[6]), .cin (xmplr_dummy [488]), .sharein (
                      xmplr_dummy [489])) ;
                      defparam ix30829z60633.lut_mask = 64'h3330302200303022;
                      defparam ix30829z60633.extended_lut = "on";
    arriav_lcell_comb ix31826z60633 (.combout (datout_dup_0[5]), .sumout (
                      xmplr_dummy [490]), .cout (xmplr_dummy [491]), .shareout (
                      xmplr_dummy [492]), .dataa (U_2_divlsb[5]), .datab (
                      addr_int[1]), .datac (U_2_divmsb[5]), .datad (addr_int[0])
                      , .datae (addr_int[2]), .dataf (U_4_recvdt[5]), .datag (
                      U_4_xmitdt[5]), .cin (xmplr_dummy [493]), .sharein (
                      xmplr_dummy [494])) ;
                      defparam ix31826z60633.lut_mask = 64'h3330302200303022;
                      defparam ix31826z60633.extended_lut = "on";
    arriav_lcell_comb ix32823z60633 (.combout (datout_dup_0[4]), .sumout (
                      xmplr_dummy [495]), .cout (xmplr_dummy [496]), .shareout (
                      xmplr_dummy [497]), .dataa (U_2_divlsb[4]), .datab (
                      addr_int[1]), .datac (U_2_divmsb[4]), .datad (addr_int[0])
                      , .datae (addr_int[2]), .dataf (U_4_recvdt[4]), .datag (
                      U_4_xmitdt[4]), .cin (xmplr_dummy [498]), .sharein (
                      xmplr_dummy [499])) ;
                      defparam ix32823z60633.lut_mask = 64'h3330302200303022;
                      defparam ix32823z60633.extended_lut = "on";
    arriav_lcell_comb ix35948z60633 (.combout (nx35948z1), .sumout (
                      xmplr_dummy [500]), .cout (xmplr_dummy [501]), .shareout (
                      xmplr_dummy [502]), .dataa (U_4_U_0_xmit_bit_cnt[0]), .datab (
                      U_4_U_0_xmit_current_state[3]), .datac (nx35948z2), .datad (
                      U_4_U_0_xmit_current_state[1]), .datae (nx35948z3), .dataf (
                      U_4_U_0_xmit_current_state[2]), .datag (nx35948z4), .cin (
                      xmplr_dummy [503]), .sharein (xmplr_dummy [504])) ;
                      defparam ix35948z60633.lut_mask = 64'h0f0f5f5f3f0c7f4c;
                      defparam ix35948z60633.extended_lut = "on";
    arriav_lcell_comb ix36190z60633 (.combout (nx36190z1), .sumout (
                      xmplr_dummy [505]), .cout (xmplr_dummy [506]), .shareout (
                      xmplr_dummy [507]), .dataa (U_4_rcv_bit_cnt[1]), .datab (
                      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49
                      ), .datac (nx64054z4), .datad (U_2_clk_cnt[15]), .datae (
                      U_4_U_0_rcv_current_state[1]), .dataf (nx16055z2), .datag (
                      nx17052z2), .cin (xmplr_dummy [508]), .sharein (
                      xmplr_dummy [509])) ;
                      defparam ix36190z60633.lut_mask = 64'h33a3a3a3aaaaa3a3;
                      defparam ix36190z60633.extended_lut = "on";
    arriav_lcell_comb ix37187z60633 (.combout (nx37187z1), .sumout (
                      xmplr_dummy [510]), .cout (xmplr_dummy [511]), .shareout (
                      xmplr_dummy [512]), .dataa (U_4_rcv_bit_cnt[2]), .datab (
                      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50
                      ), .datac (nx64054z4), .datad (U_2_clk_cnt[15]), .datae (
                      U_4_U_0_rcv_current_state[1]), .dataf (nx16055z2), .datag (
                      nx17052z2), .cin (xmplr_dummy [513]), .sharein (
                      xmplr_dummy [514])) ;
                      defparam ix37187z60633.lut_mask = 64'h33a3a3a3aaaaa3a3;
                      defparam ix37187z60633.extended_lut = "on";
    arriav_lcell_comb ix35948z60635 (.combout (nx35948z3), .sumout (
                      xmplr_dummy [515]), .cout (xmplr_dummy [516]), .shareout (
                      xmplr_dummy [517]), .dataa (U_4_xmitdt[2]), .datab (
                      U_4_U_0_xmit_bit_cnt[1]), .datac (U_4_xmitdt[0]), .datad (
                      U_4_U_0_xmit_bit_cnt[0]), .datae (U_4_U_0_xmit_bit_cnt[2])
                      , .dataf (U_4_xmitdt[6]), .datag (U_4_xmitdt[4]), .cin (
                      xmplr_dummy [518]), .sharein (xmplr_dummy [519])) ;
                      defparam ix35948z60635.lut_mask = 64'hfffc00b8ff3000b8;
                      defparam ix35948z60635.extended_lut = "on";
    arriav_lcell_comb ix19046z60637 (.combout (nx19046z5), .sumout (
                      xmplr_dummy [520]), .cout (xmplr_dummy [521]), .shareout (
                      xmplr_dummy [522]), .dataa (U_2_divlsb[6]), .datab (
                      U_2_divlsb[4]), .datac (nx19046z6), .datad (U_2_clk_cnt[3]
                      ), .datae (nx19046z7), .dataf (U_2_clk_cnt[5]), .datag (
                      U_2_divlsb[5]), .cin (xmplr_dummy [523]), .sharein (
                      xmplr_dummy [524])) ;
                      defparam ix19046z60637.lut_mask = 64'ha0a080a8fafaeafe;
                      defparam ix19046z60637.extended_lut = "on";
    arriav_lcell_comb ix19046z60636 (.combout (nx19046z4), .sumout (
                      xmplr_dummy [525]), .cout (xmplr_dummy [526]), .shareout (
                      xmplr_dummy [527]), .dataa (U_2_divlsb[7]), .datab (
                      U_2_divmsb[1]), .datac (nx19046z5), .datad (U_2_clk_cnt[6]
                      ), .datae (nx19046z8), .dataf (U_2_clk_cnt[8]), .datag (
                      U_2_divmsb[0]), .cin (xmplr_dummy [528]), .sharein (
                      xmplr_dummy [529])) ;
                      defparam ix19046z60636.lut_mask = 64'hc0c080c8fcfcecfe;
                      defparam ix19046z60636.extended_lut = "on";
    arriav_lcell_comb ix19046z60635 (.combout (nx19046z3), .sumout (
                      xmplr_dummy [530]), .cout (xmplr_dummy [531]), .shareout (
                      xmplr_dummy [532]), .dataa (U_2_divmsb[4]), .datab (
                      U_2_divmsb[2]), .datac (nx19046z4), .datad (U_2_clk_cnt[9]
                      ), .datae (nx19046z9), .dataf (U_2_clk_cnt[11]), .datag (
                      U_2_divmsb[3]), .cin (xmplr_dummy [533]), .sharein (
                      xmplr_dummy [534])) ;
                      defparam ix19046z60635.lut_mask = 64'ha0a080a8fafaeafe;
                      defparam ix19046z60635.extended_lut = "on";
    arriav_lcell_comb ix17052z60634 (.combout (nx17052z2), .sumout (
                      xmplr_dummy [535]), .cout (xmplr_dummy [536]), .shareout (
                      xmplr_dummy [537]), .dataa (U_2_divmsb[7]), .datab (
                      U_2_divmsb[5]), .datac (nx19046z3), .datad (
                      U_2_clk_cnt[12]), .datae (nx17052z3), .dataf (
                      U_2_clk_cnt[14]), .datag (U_2_divmsb[6]), .cin (
                      xmplr_dummy [538]), .sharein (xmplr_dummy [539])) ;
                      defparam ix17052z60634.lut_mask = 64'ha0a080a8fafaeafe;
                      defparam ix17052z60634.extended_lut = "on";
    dffeas U_2_reg_clk_cnt_1_ (.q (U_2_clk_cnt[1]), .d (U_2_rtlcn516[1]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [540]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_2_ (.q (U_2_clk_cnt[2]), .d (U_2_rtlcn516[2]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [541]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_3_ (.q (U_2_clk_cnt[3]), .d (U_2_rtlcn516[3]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [542]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_4_ (.q (U_2_clk_cnt[4]), .d (U_2_rtlcn516[4]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [543]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_5_ (.q (U_2_clk_cnt[5]), .d (U_2_rtlcn516[5]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [544]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_6_ (.q (U_2_clk_cnt[6]), .d (U_2_rtlcn516[6]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [545]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_7_ (.q (U_2_clk_cnt[7]), .d (U_2_rtlcn516[7]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [546]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_8_ (.q (U_2_clk_cnt[8]), .d (U_2_rtlcn516[8]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [547]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_9_ (.q (U_2_clk_cnt[9]), .d (U_2_rtlcn516[9]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [548]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_10_ (.q (U_2_clk_cnt[10]), .d (U_2_rtlcn516[10]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [549]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_11_ (.q (U_2_clk_cnt[11]), .d (U_2_rtlcn516[11]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [550]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_12_ (.q (U_2_clk_cnt[12]), .d (U_2_rtlcn516[12]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [551]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_13_ (.q (U_2_clk_cnt[13]), .d (U_2_rtlcn516[13]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [552]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_14_ (.q (U_2_clk_cnt[14]), .d (U_2_rtlcn516[14]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [553]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_2_reg_clk_cnt_15_ (.q (U_2_clk_cnt[15]), .d (U_2_rtlcn516[15]), .clk (
           clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [554]), .asdata (U_1_U_0_GND), .sclr (nx64054z2), .sload (
           U_1_U_0_GND)) ;
    dffeas U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_2_ (.q (U_4_rcv_bit_cnt[2])
           , .d (nx37187z1), .clk (clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [555]), .asdata (U_1_U_0_GND), .sclr (
           xmplr_dummy [556]), .sload (xmplr_dummy [557])) ;
    dffeas U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_1_ (.q (U_4_rcv_bit_cnt[1])
           , .d (nx36190z1), .clk (clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [558]), .asdata (U_1_U_0_GND), .sclr (
           xmplr_dummy [559]), .sload (xmplr_dummy [560])) ;
    dffeas U_4_U_0_modgen_counter_rcv_bit_cnt_reg_q_0_ (.q (U_4_rcv_bit_cnt[0])
           , .d (nx35193z1), .clk (clk_int), .ena (U_2_PWR), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [561]), .asdata (U_1_U_0_GND), .sclr (
           xmplr_dummy [562]), .sload (xmplr_dummy [563])) ;
    dffeas U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_2_ (.q (
           U_4_U_0_xmit_bit_cnt[2]), .d (nx48350z1), .clk (clk_int), .ena (
           U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [564])
           , .asdata (U_1_U_0_GND), .sclr (xmplr_dummy [565]), .sload (
           xmplr_dummy [566])) ;
    dffeas U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_1_ (.q (
           U_4_U_0_xmit_bit_cnt[1]), .d (nx47353z1), .clk (clk_int), .ena (
           U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [567])
           , .asdata (U_1_U_0_GND), .sclr (xmplr_dummy [568]), .sload (
           xmplr_dummy [569])) ;
    dffeas U_4_U_0_modgen_counter_xmit_bit_cnt_reg_q_0_ (.q (
           U_4_U_0_xmit_bit_cnt[0]), .d (nx46356z1), .clk (clk_int), .ena (
           U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [570])
           , .asdata (U_1_U_0_GND), .sclr (xmplr_dummy [571]), .sload (
           xmplr_dummy [572])) ;
    dffeas U_2_reg_clk_cnt_0_ (.q (nx512z15), .d (nx21277z1), .clk (clk_int), .ena (
           U_2_PWR), .clrn (rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [573])
           , .asdata (NOT_U_1_U_0_GND), .sclr (xmplr_dummy [574]), .sload (
           xmplr_dummy [575])) ;
    arriav_lcell_comb ix33820z60633 (.combout (datout_dup_0[3]), .sumout (
                      xmplr_dummy [576]), .cout (xmplr_dummy [577]), .shareout (
                      xmplr_dummy [578]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_2_divmsb[3])
                      , .datae (U_2_divlsb[3]), .dataf (ser_if_data_3_), .datag (
                      1'b1), .cin (xmplr_dummy [579]), .sharein (
                      xmplr_dummy [580])) ;
                      defparam ix33820z60633.lut_mask = 64'hfffdfefc03010200;
    arriav_lcell_comb ix34817z60633 (.combout (datout_dup_0[2]), .sumout (
                      xmplr_dummy [581]), .cout (xmplr_dummy [582]), .shareout (
                      xmplr_dummy [583]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_2_divmsb[2])
                      , .datae (U_2_divlsb[2]), .dataf (ser_if_data_2_), .datag (
                      1'b1), .cin (xmplr_dummy [584]), .sharein (
                      xmplr_dummy [585])) ;
                      defparam ix34817z60633.lut_mask = 64'hfffdfefc03010200;
    arriav_lcell_comb ix35814z60633 (.combout (datout_dup_0[1]), .sumout (
                      xmplr_dummy [586]), .cout (xmplr_dummy [587]), .shareout (
                      xmplr_dummy [588]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_2_divmsb[1])
                      , .datae (U_2_divlsb[1]), .dataf (ser_if_data_1_), .datag (
                      1'b1), .cin (xmplr_dummy [589]), .sharein (
                      xmplr_dummy [590])) ;
                      defparam ix35814z60633.lut_mask = 64'hfffdfefc03010200;
    arriav_lcell_comb ix36811z60633 (.combout (datout_dup_0[0]), .sumout (
                      xmplr_dummy [591]), .cout (xmplr_dummy [592]), .shareout (
                      xmplr_dummy [593]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_2_divmsb[0])
                      , .datae (U_2_divlsb[0]), .dataf (ser_if_data_0_), .datag (
                      1'b1), .cin (xmplr_dummy [594]), .sharein (
                      xmplr_dummy [595])) ;
                      defparam ix36811z60633.lut_mask = 64'hfffdfefc03010200;
    arriav_lcell_comb ix8346z60633 (.combout (int_dup_0), .sumout (
                      xmplr_dummy [596]), .cout (xmplr_dummy [597]), .shareout (
                      xmplr_dummy [598]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_4_status[2]), .dataf (
                      U_4_status[3]), .datag (1'b1), .cin (xmplr_dummy [599]), .sharein (
                      xmplr_dummy [600])) ;
                      defparam ix8346z60633.lut_mask = 64'hffffffffffff0000;
    arriav_lcell_comb ix33820z60634 (.combout (ser_if_data_3_), .sumout (
                      xmplr_dummy [601]), .cout (xmplr_dummy [602]), .shareout (
                      xmplr_dummy [603]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_4_xmitdt[3])
                      , .datae (U_4_status[3]), .dataf (U_4_recvdt[3]), .datag (
                      1'b1), .cin (xmplr_dummy [604]), .sharein (
                      xmplr_dummy [605])) ;
                      defparam ix33820z60634.lut_mask = 64'h7060302050401000;
    arriav_lcell_comb ix34817z60634 (.combout (ser_if_data_2_), .sumout (
                      xmplr_dummy [606]), .cout (xmplr_dummy [607]), .shareout (
                      xmplr_dummy [608]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_4_xmitdt[2])
                      , .datae (U_4_status[2]), .dataf (U_4_recvdt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [609]), .sharein (
                      xmplr_dummy [610])) ;
                      defparam ix34817z60634.lut_mask = 64'h7060302050401000;
    arriav_lcell_comb ix35814z60634 (.combout (ser_if_data_1_), .sumout (
                      xmplr_dummy [611]), .cout (xmplr_dummy [612]), .shareout (
                      xmplr_dummy [613]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_4_xmitdt[1])
                      , .datae (U_4_status[1]), .dataf (U_4_recvdt[1]), .datag (
                      1'b1), .cin (xmplr_dummy [614]), .sharein (
                      xmplr_dummy [615])) ;
                      defparam ix35814z60634.lut_mask = 64'h7060302050401000;
    arriav_lcell_comb ix36811z60634 (.combout (ser_if_data_0_), .sumout (
                      xmplr_dummy [616]), .cout (xmplr_dummy [617]), .shareout (
                      xmplr_dummy [618]), .dataa (addr_int[0]), .datab (
                      addr_int[1]), .datac (addr_int[2]), .datad (U_4_xmitdt[0])
                      , .datae (U_4_status[0]), .dataf (U_4_recvdt[0]), .datag (
                      1'b1), .cin (xmplr_dummy [619]), .sharein (
                      xmplr_dummy [620])) ;
                      defparam ix36811z60634.lut_mask = 64'h7060302050401000;
    arriav_lcell_comb ix7741z60634 (.combout (nx7741z3), .sumout (
                      xmplr_dummy [621]), .cout (xmplr_dummy [622]), .shareout (
                      xmplr_dummy [623]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (addr_int[0]), .datae (addr_int[1]), .dataf (
                      addr_int[2]), .datag (1'b1), .cin (xmplr_dummy [624]), .sharein (
                      xmplr_dummy [625])) ;
                      defparam ix7741z60634.lut_mask = 64'hffffff00ffffffff;
    arriav_lcell_comb ix9735z60634 (.combout (nx9735z2), .sumout (
                      xmplr_dummy [626]), .cout (xmplr_dummy [627]), .shareout (
                      xmplr_dummy [628]), .dataa (1'b1), .datab (1'b1), .datac (
                      nrw_int), .datad (addr_int[0]), .datae (addr_int[1]), .dataf (
                      addr_int[2]), .datag (1'b1), .cin (xmplr_dummy [629]), .sharein (
                      xmplr_dummy [630])) ;
                      defparam ix9735z60634.lut_mask = 64'hf0ffffffffffffff;
    arriav_lcell_comb ix8738z60633 (.combout (nx8738z1), .sumout (
                      xmplr_dummy [631]), .cout (xmplr_dummy [632]), .shareout (
                      xmplr_dummy [633]), .dataa (1'b1), .datab (1'b1), .datac (
                      cs_int), .datad (U_1_U_0_current_state[1]), .datae (
                      clear_flags), .dataf (nx9735z2), .datag (1'b1), .cin (
                      xmplr_dummy [634]), .sharein (xmplr_dummy [635])) ;
                      defparam ix8738z60633.lut_mask = 64'h0f0f00000f0f0f00;
    arriav_lcell_comb ix9735z60633 (.combout (nx9735z1), .sumout (
                      xmplr_dummy [636]), .cout (xmplr_dummy [637]), .shareout (
                      xmplr_dummy [638]), .dataa (1'b1), .datab (nrw_int), .datac (
                      cs_int), .datad (nx7741z2), .datae (
                      U_1_U_0_current_state[1]), .dataf (nx9735z2), .datag (1'b1
                      ), .cin (xmplr_dummy [639]), .sharein (xmplr_dummy [640])
                      ) ;
                      defparam ix9735z60633.lut_mask = 64'h0f0f000300030003;
    arriav_lcell_comb ix7741z60633 (.combout (nx7741z1), .sumout (
                      xmplr_dummy [641]), .cout (xmplr_dummy [642]), .shareout (
                      xmplr_dummy [643]), .dataa (1'b1), .datab (nrw_int), .datac (
                      cs_int), .datad (nx7741z2), .datae (enable_write), .dataf (
                      nx7741z3), .datag (1'b1), .cin (xmplr_dummy [644]), .sharein (
                      xmplr_dummy [645])) ;
                      defparam ix7741z60633.lut_mask = 64'h0f0f000c030f000c;
    arriav_lcell_comb ix6744z60633 (.combout (nx6744z1), .sumout (
                      xmplr_dummy [646]), .cout (xmplr_dummy [647]), .shareout (
                      xmplr_dummy [648]), .dataa (1'b1), .datab (nrw_int), .datac (
                      cs_int), .datad (start_xmit), .datae (enable_write), .dataf (
                      nx7741z3), .datag (1'b1), .cin (xmplr_dummy [649]), .sharein (
                      xmplr_dummy [650])) ;
                      defparam ix6744z60633.lut_mask = 64'h0f000f000f0c0f00;
    arriav_lcell_comb ix64054z60634 (.combout (nx64054z3), .sumout (
                      xmplr_dummy [651]), .cout (xmplr_dummy [652]), .shareout (
                      xmplr_dummy [653]), .dataa (1'b1), .datab (sin_int), .datac (
                      nx64054z4), .datad (U_4_U_0_rcv_current_state[2]), .datae (
                      U_4_done_rcving), .dataf (enable_xmit_clk), .datag (1'b1)
                      , .cin (xmplr_dummy [654]), .sharein (xmplr_dummy [655])
                      ) ;
                      defparam ix64054z60634.lut_mask = 64'hffffffff000033f3;
    arriav_lcell_comb ix17214z60633 (.combout (nx17214z1), .sumout (
                      xmplr_dummy [656]), .cout (xmplr_dummy [657]), .shareout (
                      xmplr_dummy [658]), .dataa (1'b1), .datab (1'b1), .datac (
                      addr_int[0]), .datad (addr_int[1]), .datae (addr_int[2]), 
                      .dataf (enable_write), .datag (1'b1), .cin (
                      xmplr_dummy [659]), .sharein (xmplr_dummy [660])) ;
                      defparam ix17214z60633.lut_mask = 64'h0000000f00000000;
    arriav_lcell_comb ix9427z60633 (.combout (nx9427z1), .sumout (
                      xmplr_dummy [661]), .cout (xmplr_dummy [662]), .shareout (
                      xmplr_dummy [663]), .dataa (1'b1), .datab (1'b1), .datac (
                      addr_int[0]), .datad (addr_int[1]), .datae (addr_int[2]), 
                      .dataf (enable_write), .datag (1'b1), .cin (
                      xmplr_dummy [664]), .sharein (xmplr_dummy [665])) ;
                      defparam ix9427z60633.lut_mask = 64'h000000f000000000;
    arriav_lcell_comb ix64054z60633 (.combout (nx64054z2), .sumout (
                      xmplr_dummy [666]), .cout (xmplr_dummy [667]), .shareout (
                      xmplr_dummy [668]), .dataa (1'b1), .datab (1'b1), .datac (
                      U_2_clk_cnt[15]), .datad (nx64054z3), .datae (
                      U_2_rtlc5n88[15]), .dataf (nx21277z20), .datag (1'b1), .cin (
                      xmplr_dummy [669]), .sharein (xmplr_dummy [670])) ;
                      defparam ix64054z60633.lut_mask = 64'h00fff0fff0ffffff;
    arriav_lcell_comb ix30972z60634 (.combout (NOT_U_4_read_bit), .sumout (
                      xmplr_dummy [671]), .cout (xmplr_dummy [672]), .shareout (
                      xmplr_dummy [673]), .dataa (1'b1), .datab (addr_int[0]), .datac (
                      addr_int[1]), .datad (addr_int[2]), .datae (
                      U_4_U_0_rcv_current_state[1]), .dataf (enable_write), .datag (
                      1'b1), .cin (xmplr_dummy [674]), .sharein (
                      xmplr_dummy [675])) ;
                      defparam ix30972z60634.lut_mask = 64'h0300ffff0000ffff;
    arriav_lcell_comb ix19766z60633 (.combout (nx19766z1), .sumout (
                      xmplr_dummy [676]), .cout (xmplr_dummy [677]), .shareout (
                      xmplr_dummy [678]), .dataa (1'b1), .datab (1'b1), .datac (
                      addr_int[0]), .datad (addr_int[1]), .datae (addr_int[2]), 
                      .dataf (enable_write), .datag (1'b1), .cin (
                      xmplr_dummy [679]), .sharein (xmplr_dummy [680])) ;
                      defparam ix19766z60633.lut_mask = 64'h000f000000000000;
    arriav_lcell_comb ix30972z60633 (.combout (nx30972z1), .sumout (
                      xmplr_dummy [681]), .cout (xmplr_dummy [682]), .shareout (
                      xmplr_dummy [683]), .dataa (sin_int), .datab (
                      U_4_recvdt[7]), .datac (U_2_clk_cnt[15]), .datad (
                      nx16055z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [684]), .sharein (
                      xmplr_dummy [685])) ;
                      defparam ix30972z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix29975z60633 (.combout (nx29975z1), .sumout (
                      xmplr_dummy [686]), .cout (xmplr_dummy [687]), .shareout (
                      xmplr_dummy [688]), .dataa (sin_int), .datab (
                      U_4_recvdt[6]), .datac (U_2_clk_cnt[15]), .datad (
                      nx29975z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [689]), .sharein (
                      xmplr_dummy [690])) ;
                      defparam ix29975z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix28978z60633 (.combout (nx28978z1), .sumout (
                      xmplr_dummy [691]), .cout (xmplr_dummy [692]), .shareout (
                      xmplr_dummy [693]), .dataa (sin_int), .datab (
                      U_4_recvdt[5]), .datac (U_2_clk_cnt[15]), .datad (
                      nx28978z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [694]), .sharein (
                      xmplr_dummy [695])) ;
                      defparam ix28978z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix27981z60633 (.combout (nx27981z1), .sumout (
                      xmplr_dummy [696]), .cout (xmplr_dummy [697]), .shareout (
                      xmplr_dummy [698]), .dataa (sin_int), .datab (
                      U_4_recvdt[4]), .datac (U_2_clk_cnt[15]), .datad (
                      nx27981z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [699]), .sharein (
                      xmplr_dummy [700])) ;
                      defparam ix27981z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix26984z60633 (.combout (nx26984z1), .sumout (
                      xmplr_dummy [701]), .cout (xmplr_dummy [702]), .shareout (
                      xmplr_dummy [703]), .dataa (sin_int), .datab (
                      U_4_recvdt[3]), .datac (U_2_clk_cnt[15]), .datad (
                      nx26984z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [704]), .sharein (
                      xmplr_dummy [705])) ;
                      defparam ix26984z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix25987z60633 (.combout (nx25987z1), .sumout (
                      xmplr_dummy [706]), .cout (xmplr_dummy [707]), .shareout (
                      xmplr_dummy [708]), .dataa (sin_int), .datab (
                      U_4_recvdt[2]), .datac (U_2_clk_cnt[15]), .datad (
                      nx25987z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [709]), .sharein (
                      xmplr_dummy [710])) ;
                      defparam ix25987z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix24990z60633 (.combout (nx24990z1), .sumout (
                      xmplr_dummy [711]), .cout (xmplr_dummy [712]), .shareout (
                      xmplr_dummy [713]), .dataa (sin_int), .datab (
                      U_4_recvdt[1]), .datac (U_2_clk_cnt[15]), .datad (
                      nx24990z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [714]), .sharein (
                      xmplr_dummy [715])) ;
                      defparam ix24990z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix23993z60633 (.combout (nx23993z1), .sumout (
                      xmplr_dummy [716]), .cout (xmplr_dummy [717]), .shareout (
                      xmplr_dummy [718]), .dataa (sin_int), .datab (
                      U_4_recvdt[0]), .datac (U_2_clk_cnt[15]), .datad (
                      nx23993z2), .datae (NOT_U_4_read_bit), .dataf (nx17052z2)
                      , .datag (1'b1), .cin (xmplr_dummy [719]), .sharein (
                      xmplr_dummy [720])) ;
                      defparam ix23993z60633.lut_mask = 64'hccccccacccccccaa;
    arriav_lcell_comb ix23993z60634 (.combout (nx23993z2), .sumout (
                      xmplr_dummy [721]), .cout (xmplr_dummy [722]), .shareout (
                      xmplr_dummy [723]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [724]), .sharein (
                      xmplr_dummy [725])) ;
                      defparam ix23993z60634.lut_mask = 64'hffffffffffffff00;
    arriav_lcell_comb ix24990z60634 (.combout (nx24990z2), .sumout (
                      xmplr_dummy [726]), .cout (xmplr_dummy [727]), .shareout (
                      xmplr_dummy [728]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [729]), .sharein (
                      xmplr_dummy [730])) ;
                      defparam ix24990z60634.lut_mask = 64'hffffffffffff00ff;
    arriav_lcell_comb ix25987z60634 (.combout (nx25987z2), .sumout (
                      xmplr_dummy [731]), .cout (xmplr_dummy [732]), .shareout (
                      xmplr_dummy [733]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [734]), .sharein (
                      xmplr_dummy [735])) ;
                      defparam ix25987z60634.lut_mask = 64'hffffffffff00ffff;
    arriav_lcell_comb ix26984z60634 (.combout (nx26984z2), .sumout (
                      xmplr_dummy [736]), .cout (xmplr_dummy [737]), .shareout (
                      xmplr_dummy [738]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [739]), .sharein (
                      xmplr_dummy [740])) ;
                      defparam ix26984z60634.lut_mask = 64'hffffffff00ffffff;
    arriav_lcell_comb ix27981z60634 (.combout (nx27981z2), .sumout (
                      xmplr_dummy [741]), .cout (xmplr_dummy [742]), .shareout (
                      xmplr_dummy [743]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [744]), .sharein (
                      xmplr_dummy [745])) ;
                      defparam ix27981z60634.lut_mask = 64'hffffff00ffffffff;
    arriav_lcell_comb ix28978z60634 (.combout (nx28978z2), .sumout (
                      xmplr_dummy [746]), .cout (xmplr_dummy [747]), .shareout (
                      xmplr_dummy [748]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [749]), .sharein (
                      xmplr_dummy [750])) ;
                      defparam ix28978z60634.lut_mask = 64'hffff00ffffffffff;
    arriav_lcell_comb ix29975z60634 (.combout (nx29975z2), .sumout (
                      xmplr_dummy [751]), .cout (xmplr_dummy [752]), .shareout (
                      xmplr_dummy [753]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [754]), .sharein (
                      xmplr_dummy [755])) ;
                      defparam ix29975z60634.lut_mask = 64'hff00ffffffffffff;
    arriav_lcell_comb ix37659z60633 (.combout (U_4_U_1_xmitting_reg_3n3ss1), .sumout (
                      xmplr_dummy [756]), .cout (xmplr_dummy [757]), .shareout (
                      xmplr_dummy [758]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (enable_xmit_clk), .dataf (
                      clear_flags), .datag (1'b1), .cin (xmplr_dummy [759]), .sharein (
                      xmplr_dummy [760])) ;
                      defparam ix37659z60633.lut_mask = 64'h00000000ffff0000;
    arriav_lcell_comb ix37346z60633 (.combout (U_4_U_1_rcving_reg_3n3ss1), .sumout (
                      xmplr_dummy [761]), .cout (xmplr_dummy [762]), .shareout (
                      xmplr_dummy [763]), .dataa (1'b1), .datab (1'b1), .datac (
                      nx64054z4), .datad (U_4_U_0_rcv_current_state[2]), .datae (
                      U_4_done_rcving), .dataf (clear_flags), .datag (1'b1), .cin (
                      xmplr_dummy [764]), .sharein (xmplr_dummy [765])) ;
                      defparam ix37346z60633.lut_mask = 64'h00000000000000f0;
    arriav_lcell_comb ix12643z60633 (.combout (U_4_U_1_done_rcving_reg_3n3ss1), 
                      .sumout (xmplr_dummy [766]), .cout (xmplr_dummy [767]), .shareout (
                      xmplr_dummy [768]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_4_done_rcving), .dataf (
                      clear_flags), .datag (1'b1), .cin (xmplr_dummy [769]), .sharein (
                      xmplr_dummy [770])) ;
                      defparam ix12643z60633.lut_mask = 64'h00000000ffff0000;
    arriav_lcell_comb ix48030z60633 (.combout (nx48030z1), .sumout (
                      xmplr_dummy [771]), .cout (xmplr_dummy [772]), .shareout (
                      xmplr_dummy [773]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_status[2]), .datae (U_4_done_xmitting)
                      , .dataf (clear_flags), .datag (1'b1), .cin (
                      xmplr_dummy [774]), .sharein (xmplr_dummy [775])) ;
                      defparam ix48030z60633.lut_mask = 64'h00000000ffffff00;
    arriav_lcell_comb ix14061z60633 (.combout (nx14061z1), .sumout (
                      xmplr_dummy [776]), .cout (xmplr_dummy [777]), .shareout (
                      xmplr_dummy [778]), .dataa (U_4_U_0_rcv_current_state[5])
                      , .datab (U_4_U_0_rcv_current_state[6]), .datac (
                      U_2_clk_cnt[14]), .datad (U_2_clk_cnt[15]), .datae (
                      U_2_divmsb[7]), .dataf (nx19046z2), .datag (1'b1), .cin (
                      xmplr_dummy [779]), .sharein (xmplr_dummy [780])) ;
                      defparam ix14061z60633.lut_mask = 64'h00ee000e000e0000;
    arriav_lcell_comb ix15058z60633 (.combout (nx15058z1), .sumout (
                      xmplr_dummy [781]), .cout (xmplr_dummy [782]), .shareout (
                      xmplr_dummy [783]), .dataa (1'b1), .datab (
                      U_4_U_0_rcv_current_state[1]), .datac (
                      U_4_U_0_rcv_current_state[5]), .datad (U_2_clk_cnt[15]), .datae (
                      nx16055z2), .dataf (nx17052z2), .datag (1'b1), .cin (
                      xmplr_dummy [784]), .sharein (xmplr_dummy [785])) ;
                      defparam ix15058z60633.lut_mask = 64'hf000fc00f0f0fcfc;
    arriav_lcell_comb ix19046z60633 (.combout (nx19046z1), .sumout (
                      xmplr_dummy [786]), .cout (xmplr_dummy [787]), .shareout (
                      xmplr_dummy [788]), .dataa (nx19046z2), .datab (
                      U_4_U_0_rcv_current_state[1]), .datac (
                      U_4_U_0_rcv_current_state[4]), .datad (U_2_clk_cnt[14]), .datae (
                      U_2_clk_cnt[15]), .dataf (U_2_divmsb[7]), .datag (1'b1), .cin (
                      xmplr_dummy [789]), .sharein (xmplr_dummy [790])) ;
                      defparam ix19046z60633.lut_mask = 64'h0000a8fc000000a8;
    arriav_lcell_comb ix16055z60633 (.combout (nx16055z1), .sumout (
                      xmplr_dummy [791]), .cout (xmplr_dummy [792]), .shareout (
                      xmplr_dummy [793]), .dataa (U_4_U_0_rcv_current_state[1])
                      , .datab (U_4_U_0_rcv_current_state[3]), .datac (
                      U_4_U_0_rcv_current_state[4]), .datad (U_2_clk_cnt[15]), .datae (
                      nx16055z2), .dataf (nx17052z2), .datag (1'b1), .cin (
                      xmplr_dummy [794]), .sharein (xmplr_dummy [795])) ;
                      defparam ix16055z60633.lut_mask = 64'hfe00fc00fefefcfc;
    arriav_lcell_comb ix17052z60633 (.combout (nx17052z1), .sumout (
                      xmplr_dummy [796]), .cout (xmplr_dummy [797]), .shareout (
                      xmplr_dummy [798]), .dataa (1'b1), .datab (sin_int), .datac (
                      U_4_U_0_rcv_current_state[2]), .datad (
                      U_4_U_0_rcv_current_state[3]), .datae (U_2_clk_cnt[15]), .dataf (
                      nx17052z2), .datag (1'b1), .cin (xmplr_dummy [799]), .sharein (
                      xmplr_dummy [800])) ;
                      defparam ix17052z60633.lut_mask = 64'h3030ff3030303030;
    arriav_lcell_comb ix20043z60633 (.combout (nx20043z1), .sumout (
                      xmplr_dummy [801]), .cout (xmplr_dummy [802]), .shareout (
                      xmplr_dummy [803]), .dataa (1'b1), .datab (1'b1), .datac (
                      sin_int), .datad (nx64054z4), .datae (
                      U_4_U_0_rcv_current_state[2]), .dataf (U_4_done_rcving), .datag (
                      1'b1), .cin (xmplr_dummy [804]), .sharein (
                      xmplr_dummy [805])) ;
                      defparam ix20043z60633.lut_mask = 64'h000000000f0fff0f;
    arriav_lcell_comb ix3309z60633 (.combout (nx3309z1), .sumout (
                      xmplr_dummy [806]), .cout (xmplr_dummy [807]), .shareout (
                      xmplr_dummy [808]), .dataa (1'b1), .datab (
                      U_4_U_0_xmit_current_state[3]), .datac (
                      U_4_U_0_xmit_current_state[5]), .datad (U_2_clk_cnt[15]), 
                      .datae (nx318z2), .dataf (nx17052z2), .datag (1'b1), .cin (
                      xmplr_dummy [809]), .sharein (xmplr_dummy [810])) ;
                      defparam ix3309z60633.lut_mask = 64'hf000fc00f0f0fcfc;
    arriav_lcell_comb ix1315z60633 (.combout (nx1315z1), .sumout (
                      xmplr_dummy [811]), .cout (xmplr_dummy [812]), .shareout (
                      xmplr_dummy [813]), .dataa (nx19046z2), .datab (
                      U_4_U_0_xmit_current_state[2]), .datac (
                      U_4_U_0_xmit_current_state[3]), .datad (U_2_clk_cnt[14]), 
                      .datae (U_2_clk_cnt[15]), .dataf (U_2_divmsb[7]), .datag (
                      1'b1), .cin (xmplr_dummy [814]), .sharein (
                      xmplr_dummy [815])) ;
                      defparam ix1315z60633.lut_mask = 64'h0000a8fc000000a8;
    arriav_lcell_comb ix318z60633 (.combout (nx318z1), .sumout (
                      xmplr_dummy [816]), .cout (xmplr_dummy [817]), .shareout (
                      xmplr_dummy [818]), .dataa (U_4_U_0_xmit_current_state[1])
                      , .datab (U_4_U_0_xmit_current_state[2]), .datac (
                      U_4_U_0_xmit_current_state[3]), .datad (U_2_clk_cnt[15]), 
                      .datae (nx318z2), .dataf (nx17052z2), .datag (1'b1), .cin (
                      xmplr_dummy [819]), .sharein (xmplr_dummy [820])) ;
                      defparam ix318z60633.lut_mask = 64'hfe00ee00fefeeeee;
    arriav_lcell_comb ix64857z60633 (.combout (nx64857z1), .sumout (
                      xmplr_dummy [821]), .cout (xmplr_dummy [822]), .shareout (
                      xmplr_dummy [823]), .dataa (1'b1), .datab (nx64857z2), .datac (
                      U_4_U_0_xmit_current_state[1]), .datad (U_2_clk_cnt[15]), 
                      .datae (start_xmit), .dataf (nx17052z2), .datag (1'b1), .cin (
                      xmplr_dummy [824]), .sharein (xmplr_dummy [825])) ;
                      defparam ix64857z60633.lut_mask = 64'h33f300f033330000;
    arriav_lcell_comb ix63860z60633 (.combout (nx63860z1), .sumout (
                      xmplr_dummy [826]), .cout (xmplr_dummy [827]), .shareout (
                      xmplr_dummy [828]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (nx64857z2), .datae (
                      U_4_U_0_xmit_current_state[4]), .dataf (start_xmit), .datag (
                      1'b1), .cin (xmplr_dummy [829]), .sharein (
                      xmplr_dummy [830])) ;
                      defparam ix63860z60633.lut_mask = 64'h0000ffff0000ff00;
    arriav_lcell_comb ix13064z60633 (.combout (nx13064z1), .sumout (
                      xmplr_dummy [831]), .cout (xmplr_dummy [832]), .shareout (
                      xmplr_dummy [833]), .dataa (1'b1), .datab (
                      U_4_U_0_rcv_current_state[6]), .datac (U_2_clk_cnt[14]), .datad (
                      U_2_clk_cnt[15]), .datae (U_2_divmsb[7]), .dataf (
                      nx19046z2), .datag (1'b1), .cin (xmplr_dummy [834]), .sharein (
                      xmplr_dummy [835])) ;
                      defparam ix13064z60633.lut_mask = 64'hcc00ccc0ccc0cccc;
    arriav_lcell_comb ix18049z60633 (.combout (nx18049z1), .sumout (
                      xmplr_dummy [836]), .cout (xmplr_dummy [837]), .shareout (
                      xmplr_dummy [838]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (sin_int), .dataf (nx64054z4)
                      , .datag (1'b1), .cin (xmplr_dummy [839]), .sharein (
                      xmplr_dummy [840])) ;
                      defparam ix18049z60633.lut_mask = 64'h000000000000ffff;
    arriav_lcell_comb ix4306z60633 (.combout (nx4306z1), .sumout (
                      xmplr_dummy [841]), .cout (xmplr_dummy [842]), .shareout (
                      xmplr_dummy [843]), .dataa (1'b1), .datab (
                      U_4_U_0_xmit_current_state[5]), .datac (U_2_clk_cnt[14]), 
                      .datad (U_2_clk_cnt[15]), .datae (U_2_divmsb[7]), .dataf (
                      nx19046z2), .datag (1'b1), .cin (xmplr_dummy [844]), .sharein (
                      xmplr_dummy [845])) ;
                      defparam ix4306z60633.lut_mask = 64'h00cc000c000c0000;
    arriav_lcell_comb ix16055z60634 (.combout (nx16055z2), .sumout (
                      xmplr_dummy [846]), .cout (xmplr_dummy [847]), .shareout (
                      xmplr_dummy [848]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [849]), .sharein (
                      xmplr_dummy [850])) ;
                      defparam ix16055z60634.lut_mask = 64'h00ffffffffffffff;
    arriav_lcell_comb ix318z60634 (.combout (nx318z2), .sumout (
                      xmplr_dummy [851]), .cout (xmplr_dummy [852]), .shareout (
                      xmplr_dummy [853]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_U_0_xmit_bit_cnt[0]), .datae (
                      U_4_U_0_xmit_bit_cnt[1]), .dataf (U_4_U_0_xmit_bit_cnt[2])
                      , .datag (1'b1), .cin (xmplr_dummy [854]), .sharein (
                      xmplr_dummy [855])) ;
                      defparam ix318z60634.lut_mask = 64'hffffffffffffff00;
    arriav_lcell_comb ix3650z60633 (.combout (nx3650z1), .sumout (
                      xmplr_dummy [856]), .cout (xmplr_dummy [857]), .shareout (
                      xmplr_dummy [858]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_U_0_xmit_current_state[1]), .datae (
                      U_4_U_0_xmit_current_state[4]), .dataf (enable_xmit_clk), 
                      .datag (1'b1), .cin (xmplr_dummy [859]), .sharein (
                      xmplr_dummy [860])) ;
                      defparam ix3650z60633.lut_mask = 64'h0000ffff0000ff00;
    arriav_lcell_comb ix36190z60634 (.combout (
                      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_1_dup_49
                      ), .sumout (xmplr_dummy [861]), .cout (xmplr_dummy [862])
                      , .shareout (xmplr_dummy [863]), .dataa (1'b1), .datab (
                      1'b1), .datac (1'b1), .datad (nx64054z4), .datae (
                      U_4_rcv_bit_cnt[0]), .dataf (U_4_rcv_bit_cnt[1]), .datag (
                      1'b1), .cin (xmplr_dummy [864]), .sharein (
                      xmplr_dummy [865])) ;
                      defparam ix36190z60634.lut_mask = 64'hffff00ff00ffffff;
    arriav_lcell_comb ix37187z60634 (.combout (
                      NOT_U_4_U_0_modgen_counter_rcv_bit_cnt_sclear_and_2_dup_50
                      ), .sumout (xmplr_dummy [866]), .cout (xmplr_dummy [867])
                      , .shareout (xmplr_dummy [868]), .dataa (1'b1), .datab (
                      1'b1), .datac (nx64054z4), .datad (U_4_rcv_bit_cnt[0]), .datae (
                      U_4_rcv_bit_cnt[1]), .dataf (U_4_rcv_bit_cnt[2]), .datag (
                      1'b1), .cin (xmplr_dummy [869]), .sharein (
                      xmplr_dummy [870])) ;
                      defparam ix37187z60634.lut_mask = 64'hff0f0f0f0fffffff;
    arriav_lcell_comb ix48350z60634 (.combout (
                      U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2_), .sumout (
                      xmplr_dummy [871]), .cout (xmplr_dummy [872]), .shareout (
                      xmplr_dummy [873]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_U_0_xmit_bit_cnt[0]), .datae (
                      U_4_U_0_xmit_bit_cnt[1]), .dataf (U_4_U_0_xmit_bit_cnt[2])
                      , .datag (1'b1), .cin (xmplr_dummy [874]), .sharein (
                      xmplr_dummy [875])) ;
                      defparam ix48350z60634.lut_mask = 64'h00ffffffff000000;
    arriav_lcell_comb ix21277z60633 (.combout (nx21277z1), .sumout (
                      xmplr_dummy [876]), .cout (xmplr_dummy [877]), .shareout (
                      xmplr_dummy [878]), .dataa (1'b1), .datab (U_2_clk_cnt[15]
                      ), .datac (U_2_rtlcn516[0]), .datad (nx64054z3), .datae (
                      U_2_rtlc5n88[15]), .dataf (nx21277z20), .datag (1'b1), .cin (
                      xmplr_dummy [879]), .sharein (xmplr_dummy [880])) ;
                      defparam ix21277z60633.lut_mask = 64'h0f00cf00cf00ff00;
    arriav_lcell_comb ix46356z60633 (.combout (nx46356z1), .sumout (
                      xmplr_dummy [881]), .cout (xmplr_dummy [882]), .shareout (
                      xmplr_dummy [883]), .dataa (1'b1), .datab (nx64857z2), .datac (
                      U_4_U_0_xmit_current_state[2]), .datad (
                      U_4_U_0_xmit_bit_cnt[0]), .datae (U_2_clk_cnt[15]), .dataf (
                      nx17052z2), .datag (1'b1), .cin (xmplr_dummy [884]), .sharein (
                      xmplr_dummy [885])) ;
                      defparam ix46356z60633.lut_mask = 64'hfc000cc0fc00fc00;
    arriav_lcell_comb ix47353z60633 (.combout (nx47353z1), .sumout (
                      xmplr_dummy [886]), .cout (xmplr_dummy [887]), .shareout (
                      xmplr_dummy [888]), .dataa (nx64857z2), .datab (
                      U_4_U_0_xmit_current_state[2]), .datac (
                      U_4_U_0_xmit_bit_cnt[0]), .datad (U_4_U_0_xmit_bit_cnt[1])
                      , .datae (U_2_clk_cnt[15]), .dataf (nx17052z2), .datag (
                      1'b1), .cin (xmplr_dummy [889]), .sharein (
                      xmplr_dummy [890])) ;
                      defparam ix47353z60633.lut_mask = 64'hee002a80ee00ee00;
    arriav_lcell_comb ix48350z60633 (.combout (nx48350z1), .sumout (
                      xmplr_dummy [891]), .cout (xmplr_dummy [892]), .shareout (
                      xmplr_dummy [893]), .dataa (nx64857z2), .datab (
                      U_4_U_0_xmit_current_state[2]), .datac (
                      U_4_U_0_xmit_bit_cnt[2]), .datad (U_2_clk_cnt[15]), .datae (
                      U_4_U_0_modgen_counter_xmit_bit_cnt_inc_d_2_), .dataf (
                      nx17052z2), .datag (1'b1), .cin (xmplr_dummy [894]), .sharein (
                      xmplr_dummy [895])) ;
                      defparam ix48350z60633.lut_mask = 64'he0a8e020e0e0e0e0;
    arriav_lcell_comb ix35193z60633 (.combout (nx35193z1), .sumout (
                      xmplr_dummy [896]), .cout (xmplr_dummy [897]), .shareout (
                      xmplr_dummy [898]), .dataa (nx64054z4), .datab (
                      U_4_U_0_rcv_current_state[1]), .datac (U_4_rcv_bit_cnt[0])
                      , .datad (U_2_clk_cnt[15]), .datae (nx16055z2), .dataf (
                      nx17052z2), .datag (1'b1), .cin (xmplr_dummy [899]), .sharein (
                      xmplr_dummy [900])) ;
                      defparam ix35193z60633.lut_mask = 64'h28e0e0e02828e0e0;
    arriav_lcell_comb ix19046z60639 (.combout (nx19046z7), .sumout (
                      xmplr_dummy [901]), .cout (xmplr_dummy [902]), .shareout (
                      xmplr_dummy [903]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_2_clk_cnt[4]), .dataf (
                      U_2_divlsb[5]), .datag (1'b1), .cin (xmplr_dummy [904]), .sharein (
                      xmplr_dummy [905])) ;
                      defparam ix19046z60639.lut_mask = 64'h0000ffffffff0000;
    arriav_lcell_comb ix19046z60640 (.combout (nx19046z8), .sumout (
                      xmplr_dummy [906]), .cout (xmplr_dummy [907]), .shareout (
                      xmplr_dummy [908]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_2_clk_cnt[7]), .dataf (
                      U_2_divmsb[0]), .datag (1'b1), .cin (xmplr_dummy [909]), .sharein (
                      xmplr_dummy [910])) ;
                      defparam ix19046z60640.lut_mask = 64'h0000ffffffff0000;
    arriav_lcell_comb ix19046z60641 (.combout (nx19046z9), .sumout (
                      xmplr_dummy [911]), .cout (xmplr_dummy [912]), .shareout (
                      xmplr_dummy [913]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_2_clk_cnt[10]), .dataf (
                      U_2_divmsb[3]), .datag (1'b1), .cin (xmplr_dummy [914]), .sharein (
                      xmplr_dummy [915])) ;
                      defparam ix19046z60641.lut_mask = 64'h0000ffffffff0000;
    arriav_lcell_comb ix17052z60635 (.combout (nx17052z3), .sumout (
                      xmplr_dummy [916]), .cout (xmplr_dummy [917]), .shareout (
                      xmplr_dummy [918]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (1'b1), .datae (U_2_clk_cnt[13]), .dataf (
                      U_2_divmsb[6]), .datag (1'b1), .cin (xmplr_dummy [919]), .sharein (
                      xmplr_dummy [920])) ;
                      defparam ix17052z60635.lut_mask = 64'h0000ffffffff0000;
    arriav_lcell_comb ix19046z60638 (.combout (nx19046z6), .sumout (
                      xmplr_dummy [921]), .cout (xmplr_dummy [922]), .shareout (
                      xmplr_dummy [923]), .dataa (nx512z15), .datab (
                      U_2_clk_cnt[1]), .datac (U_2_clk_cnt[2]), .datad (
                      U_2_divlsb[1]), .datae (U_2_divlsb[2]), .dataf (
                      U_2_divlsb[3]), .datag (1'b1), .cin (xmplr_dummy [924]), .sharein (
                      xmplr_dummy [925])) ;
                      defparam ix19046z60638.lut_mask = 64'hbf3f2f0f0b030200;
    arriav_lcell_comb ix19046z60634 (.combout (nx19046z2), .sumout (
                      xmplr_dummy [926]), .cout (xmplr_dummy [927]), .shareout (
                      xmplr_dummy [928]), .dataa (1'b1), .datab (U_2_clk_cnt[12]
                      ), .datac (U_2_clk_cnt[13]), .datad (U_2_divmsb[5]), .datae (
                      U_2_divmsb[6]), .dataf (nx19046z3), .datag (1'b1), .cin (
                      xmplr_dummy [929]), .sharein (xmplr_dummy [930])) ;
                      defparam ix19046z60634.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60657 (.combout (nx21277z38), .sumout (
                      xmplr_dummy [931]), .cout (xmplr_dummy [932]), .shareout (
                      xmplr_dummy [933]), .dataa (nx512z15), .datab (
                      U_2_clk_cnt[1]), .datac (U_2_clk_cnt[2]), .datad (
                      U_2_rtlc5n88[0]), .datae (U_2_rtlc5n88[1]), .dataf (
                      U_2_rtlc5n88[2]), .datag (1'b1), .cin (xmplr_dummy [934])
                      , .sharein (xmplr_dummy [935])) ;
                      defparam ix21277z60657.lut_mask = 64'hbf3f2f0f0b030200;
    arriav_lcell_comb ix21277z60656 (.combout (nx21277z35), .sumout (
                      xmplr_dummy [936]), .cout (xmplr_dummy [937]), .shareout (
                      xmplr_dummy [938]), .dataa (1'b1), .datab (U_2_clk_cnt[3])
                      , .datac (U_2_clk_cnt[4]), .datad (U_2_rtlc5n88[3]), .datae (
                      U_2_rtlc5n88[4]), .dataf (nx21277z38), .datag (1'b1), .cin (
                      xmplr_dummy [939]), .sharein (xmplr_dummy [940])) ;
                      defparam ix21277z60656.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60655 (.combout (nx21277z32), .sumout (
                      xmplr_dummy [941]), .cout (xmplr_dummy [942]), .shareout (
                      xmplr_dummy [943]), .dataa (1'b1), .datab (U_2_clk_cnt[5])
                      , .datac (U_2_clk_cnt[6]), .datad (U_2_rtlc5n88[5]), .datae (
                      U_2_rtlc5n88[6]), .dataf (nx21277z35), .datag (1'b1), .cin (
                      xmplr_dummy [944]), .sharein (xmplr_dummy [945])) ;
                      defparam ix21277z60655.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60654 (.combout (nx21277z29), .sumout (
                      xmplr_dummy [946]), .cout (xmplr_dummy [947]), .shareout (
                      xmplr_dummy [948]), .dataa (1'b1), .datab (U_2_clk_cnt[7])
                      , .datac (U_2_clk_cnt[8]), .datad (U_2_rtlc5n88[7]), .datae (
                      U_2_rtlc5n88[8]), .dataf (nx21277z32), .datag (1'b1), .cin (
                      xmplr_dummy [949]), .sharein (xmplr_dummy [950])) ;
                      defparam ix21277z60654.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60653 (.combout (nx21277z26), .sumout (
                      xmplr_dummy [951]), .cout (xmplr_dummy [952]), .shareout (
                      xmplr_dummy [953]), .dataa (1'b1), .datab (U_2_clk_cnt[9])
                      , .datac (U_2_clk_cnt[10]), .datad (U_2_rtlc5n88[9]), .datae (
                      U_2_rtlc5n88[10]), .dataf (nx21277z29), .datag (1'b1), .cin (
                      xmplr_dummy [954]), .sharein (xmplr_dummy [955])) ;
                      defparam ix21277z60653.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60652 (.combout (nx21277z23), .sumout (
                      xmplr_dummy [956]), .cout (xmplr_dummy [957]), .shareout (
                      xmplr_dummy [958]), .dataa (1'b1), .datab (U_2_clk_cnt[11]
                      ), .datac (U_2_clk_cnt[12]), .datad (U_2_rtlc5n88[11]), .datae (
                      U_2_rtlc5n88[12]), .dataf (nx21277z26), .datag (1'b1), .cin (
                      xmplr_dummy [959]), .sharein (xmplr_dummy [960])) ;
                      defparam ix21277z60652.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix21277z60651 (.combout (nx21277z20), .sumout (
                      xmplr_dummy [961]), .cout (xmplr_dummy [962]), .shareout (
                      xmplr_dummy [963]), .dataa (1'b1), .datab (U_2_clk_cnt[13]
                      ), .datac (U_2_clk_cnt[14]), .datad (U_2_rtlc5n88[13]), .datae (
                      U_2_rtlc5n88[14]), .dataf (nx21277z23), .datag (1'b1), .cin (
                      xmplr_dummy [964]), .sharein (xmplr_dummy [965])) ;
                      defparam ix21277z60651.lut_mask = 64'hff3f0f033f0f0300;
    arriav_lcell_comb ix35948z60634 (.combout (nx35948z2), .sumout (
                      xmplr_dummy [966]), .cout (xmplr_dummy [967]), .shareout (
                      xmplr_dummy [968]), .dataa (1'b1), .datab (1'b1), .datac (
                      1'b1), .datad (U_4_U_0_xmit_bit_cnt[1]), .datae (
                      U_4_xmitdt[1]), .dataf (U_4_xmitdt[3]), .datag (1'b1), .cin (
                      xmplr_dummy [969]), .sharein (xmplr_dummy [970])) ;
                      defparam ix35948z60634.lut_mask = 64'hffffff0000ff0000;
    arriav_lcell_comb ix35948z60636 (.combout (nx35948z4), .sumout (
                      xmplr_dummy [971]), .cout (xmplr_dummy [972]), .shareout (
                      xmplr_dummy [973]), .dataa (1'b1), .datab (1'b1), .datac (
                      U_4_U_0_xmit_bit_cnt[0]), .datad (U_4_U_0_xmit_bit_cnt[1])
                      , .datae (U_4_xmitdt[5]), .dataf (U_4_xmitdt[7]), .datag (
                      1'b1), .cin (xmplr_dummy [974]), .sharein (
                      xmplr_dummy [975])) ;
                      defparam ix35948z60636.lut_mask = 64'hffffff0f0fff0f0f;
    dffeas U_1_U_0_reg_current_state_4_ (.q (start_xmit), .d (nx6744z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [976]), .asdata (xmplr_dummy [977]), .sclr (
           xmplr_dummy [978]), .sload (xmplr_dummy [979])) ;
    dffeas U_1_U_0_reg_current_state_3_ (.q (enable_write), .d (nx7741z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [980]), .asdata (xmplr_dummy [981]), .sclr (
           xmplr_dummy [982]), .sload (xmplr_dummy [983])) ;
    dffeas U_1_U_0_reg_current_state_2_ (.q (clear_flags), .d (nx8738z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [984]), .asdata (xmplr_dummy [985]), .sclr (
           xmplr_dummy [986]), .sload (xmplr_dummy [987])) ;
    dffeas U_1_U_0_reg_current_state_1_ (.q (U_1_U_0_current_state[1]), .d (
           nx9735z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [988]), .asdata (xmplr_dummy [989]), .sclr (
           xmplr_dummy [990]), .sload (xmplr_dummy [991])) ;
    dffeas U_1_U_0_reg_current_state_0_ (.q (nx7741z2), .d (NOT_cs_int), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [992]), .asdata (xmplr_dummy [993]), .sclr (
           xmplr_dummy [994]), .sload (xmplr_dummy [995])) ;
    dffeas U_2_reg_divmsb_7_ (.q (U_2_divmsb[7]), .d (datin_int[7]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [996]), .asdata (xmplr_dummy [997]), .sclr (
           xmplr_dummy [998]), .sload (xmplr_dummy [999])) ;
    dffeas U_2_reg_divmsb_6_ (.q (U_2_divmsb[6]), .d (datin_int[6]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1000]), .asdata (xmplr_dummy [1001]), .sclr (
           xmplr_dummy [1002]), .sload (xmplr_dummy [1003])) ;
    dffeas U_2_reg_divmsb_5_ (.q (U_2_divmsb[5]), .d (datin_int[5]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1004]), .asdata (xmplr_dummy [1005]), .sclr (
           xmplr_dummy [1006]), .sload (xmplr_dummy [1007])) ;
    dffeas U_2_reg_divmsb_4_ (.q (U_2_divmsb[4]), .d (datin_int[4]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1008]), .asdata (xmplr_dummy [1009]), .sclr (
           xmplr_dummy [1010]), .sload (xmplr_dummy [1011])) ;
    dffeas U_2_reg_divmsb_3_ (.q (U_2_divmsb[3]), .d (datin_int[3]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1012]), .asdata (xmplr_dummy [1013]), .sclr (
           xmplr_dummy [1014]), .sload (xmplr_dummy [1015])) ;
    dffeas U_2_reg_divmsb_2_ (.q (U_2_divmsb[2]), .d (datin_int[2]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1016]), .asdata (xmplr_dummy [1017]), .sclr (
           xmplr_dummy [1018]), .sload (xmplr_dummy [1019])) ;
    dffeas U_2_reg_divmsb_1_ (.q (U_2_divmsb[1]), .d (datin_int[1]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1020]), .asdata (xmplr_dummy [1021]), .sclr (
           xmplr_dummy [1022]), .sload (xmplr_dummy [1023])) ;
    dffeas U_2_reg_divmsb_0_ (.q (U_2_divmsb[0]), .d (datin_int[0]), .clk (
           clk_int), .ena (nx9427z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1024]), .asdata (xmplr_dummy [1025]), .sclr (
           xmplr_dummy [1026]), .sload (xmplr_dummy [1027])) ;
    dffeas U_2_reg_divlsb_7_ (.q (U_2_divlsb[7]), .d (datin_int[7]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1028]), .asdata (xmplr_dummy [1029]), .sclr (
           xmplr_dummy [1030]), .sload (xmplr_dummy [1031])) ;
    dffeas U_2_reg_divlsb_6_ (.q (U_2_divlsb[6]), .d (datin_int[6]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1032]), .asdata (xmplr_dummy [1033]), .sclr (
           xmplr_dummy [1034]), .sload (xmplr_dummy [1035])) ;
    dffeas U_2_reg_divlsb_5_ (.q (U_2_divlsb[5]), .d (datin_int[5]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1036]), .asdata (xmplr_dummy [1037]), .sclr (
           xmplr_dummy [1038]), .sload (xmplr_dummy [1039])) ;
    dffeas U_2_reg_divlsb_4_ (.q (U_2_divlsb[4]), .d (datin_int[4]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1040]), .asdata (xmplr_dummy [1041]), .sclr (
           xmplr_dummy [1042]), .sload (xmplr_dummy [1043])) ;
    dffeas U_2_reg_divlsb_3_ (.q (U_2_divlsb[3]), .d (datin_int[3]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1044]), .asdata (xmplr_dummy [1045]), .sclr (
           xmplr_dummy [1046]), .sload (xmplr_dummy [1047])) ;
    dffeas U_2_reg_divlsb_2_ (.q (U_2_divlsb[2]), .d (datin_int[2]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1048]), .asdata (xmplr_dummy [1049]), .sclr (
           xmplr_dummy [1050]), .sload (xmplr_dummy [1051])) ;
    dffeas U_2_reg_divlsb_1_ (.q (U_2_divlsb[1]), .d (datin_int[1]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1052]), .asdata (xmplr_dummy [1053]), .sclr (
           xmplr_dummy [1054]), .sload (xmplr_dummy [1055])) ;
    dffeas U_2_reg_divlsb_0_ (.q (U_2_divlsb[0]), .d (datin_int[0]), .clk (
           clk_int), .ena (nx17214z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1056]), .asdata (xmplr_dummy [1057]), .sclr (
           xmplr_dummy [1058]), .sload (xmplr_dummy [1059])) ;
    dffeas U_4_reg_xmitdt_7_ (.q (U_4_xmitdt[7]), .d (datin_int[7]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1060]), .asdata (xmplr_dummy [1061]), .sclr (
           xmplr_dummy [1062]), .sload (xmplr_dummy [1063])) ;
    dffeas U_4_reg_xmitdt_6_ (.q (U_4_xmitdt[6]), .d (datin_int[6]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1064]), .asdata (xmplr_dummy [1065]), .sclr (
           xmplr_dummy [1066]), .sload (xmplr_dummy [1067])) ;
    dffeas U_4_reg_xmitdt_5_ (.q (U_4_xmitdt[5]), .d (datin_int[5]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1068]), .asdata (xmplr_dummy [1069]), .sclr (
           xmplr_dummy [1070]), .sload (xmplr_dummy [1071])) ;
    dffeas U_4_reg_xmitdt_4_ (.q (U_4_xmitdt[4]), .d (datin_int[4]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1072]), .asdata (xmplr_dummy [1073]), .sclr (
           xmplr_dummy [1074]), .sload (xmplr_dummy [1075])) ;
    dffeas U_4_reg_xmitdt_3_ (.q (U_4_xmitdt[3]), .d (datin_int[3]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1076]), .asdata (xmplr_dummy [1077]), .sclr (
           xmplr_dummy [1078]), .sload (xmplr_dummy [1079])) ;
    dffeas U_4_reg_xmitdt_2_ (.q (U_4_xmitdt[2]), .d (datin_int[2]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1080]), .asdata (xmplr_dummy [1081]), .sclr (
           xmplr_dummy [1082]), .sload (xmplr_dummy [1083])) ;
    dffeas U_4_reg_xmitdt_1_ (.q (U_4_xmitdt[1]), .d (datin_int[1]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1084]), .asdata (xmplr_dummy [1085]), .sclr (
           xmplr_dummy [1086]), .sload (xmplr_dummy [1087])) ;
    dffeas U_4_reg_xmitdt_0_ (.q (U_4_xmitdt[0]), .d (datin_int[0]), .clk (
           clk_int), .ena (nx19766z1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1088]), .asdata (xmplr_dummy [1089]), .sclr (
           xmplr_dummy [1090]), .sload (xmplr_dummy [1091])) ;
    dffeas U_4_reg_recvdt_7_ (.q (U_4_recvdt[7]), .d (nx30972z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1092]), .asdata (xmplr_dummy [1093]), .sclr (
           xmplr_dummy [1094]), .sload (xmplr_dummy [1095])) ;
    dffeas U_4_reg_recvdt_6_ (.q (U_4_recvdt[6]), .d (nx29975z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1096]), .asdata (xmplr_dummy [1097]), .sclr (
           xmplr_dummy [1098]), .sload (xmplr_dummy [1099])) ;
    dffeas U_4_reg_recvdt_5_ (.q (U_4_recvdt[5]), .d (nx28978z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1100]), .asdata (xmplr_dummy [1101]), .sclr (
           xmplr_dummy [1102]), .sload (xmplr_dummy [1103])) ;
    dffeas U_4_reg_recvdt_4_ (.q (U_4_recvdt[4]), .d (nx27981z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1104]), .asdata (xmplr_dummy [1105]), .sclr (
           xmplr_dummy [1106]), .sload (xmplr_dummy [1107])) ;
    dffeas U_4_reg_recvdt_3_ (.q (U_4_recvdt[3]), .d (nx26984z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1108]), .asdata (xmplr_dummy [1109]), .sclr (
           xmplr_dummy [1110]), .sload (xmplr_dummy [1111])) ;
    dffeas U_4_reg_recvdt_2_ (.q (U_4_recvdt[2]), .d (nx25987z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1112]), .asdata (xmplr_dummy [1113]), .sclr (
           xmplr_dummy [1114]), .sload (xmplr_dummy [1115])) ;
    dffeas U_4_reg_recvdt_1_ (.q (U_4_recvdt[1]), .d (nx24990z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1116]), .asdata (xmplr_dummy [1117]), .sclr (
           xmplr_dummy [1118]), .sload (xmplr_dummy [1119])) ;
    dffeas U_4_reg_recvdt_0_ (.q (U_4_recvdt[0]), .d (nx23993z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1120]), .asdata (xmplr_dummy [1121]), .sclr (
           xmplr_dummy [1122]), .sload (xmplr_dummy [1123])) ;
    dffeas U_4_U_1_reg_rcving_reg (.q (U_4_status[1]), .d (
           U_4_U_1_rcving_reg_3n3ss1), .clk (clk_int), .ena (1'b1), .clrn (
           rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [1124]), .asdata (
           xmplr_dummy [1125]), .sclr (xmplr_dummy [1126]), .sload (
           xmplr_dummy [1127])) ;
    dffeas U_4_U_1_reg_xmitting_reg (.q (U_4_status[0]), .d (
           U_4_U_1_xmitting_reg_3n3ss1), .clk (clk_int), .ena (1'b1), .clrn (
           rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [1128]), .asdata (
           xmplr_dummy [1129]), .sclr (xmplr_dummy [1130]), .sload (
           xmplr_dummy [1131])) ;
    dffeas U_4_U_1_reg_done_rcving_reg (.q (U_4_status[3]), .d (
           U_4_U_1_done_rcving_reg_3n3ss1), .clk (clk_int), .ena (1'b1), .clrn (
           rst_int), .prn (U_2_PWR), .aload (xmplr_dummy [1132]), .asdata (
           xmplr_dummy [1133]), .sclr (xmplr_dummy [1134]), .sload (
           xmplr_dummy [1135])) ;
    dffeas U_4_U_1_reg_done_xmitting_reg (.q (U_4_status[2]), .d (nx48030z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1136]), .asdata (xmplr_dummy [1137]), .sclr (
           xmplr_dummy [1138]), .sload (xmplr_dummy [1139])) ;
    dffeas U_4_U_0_reg_rcv_current_state_7_ (.q (U_4_done_rcving), .d (nx13064z1
           ), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1140]), .asdata (xmplr_dummy [1141]), .sclr (
           xmplr_dummy [1142]), .sload (xmplr_dummy [1143])) ;
    dffeas U_4_U_0_reg_rcv_current_state_6_ (.q (U_4_U_0_rcv_current_state[6]), 
           .d (nx14061z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1144]), .asdata (xmplr_dummy [1145]), 
           .sclr (xmplr_dummy [1146]), .sload (xmplr_dummy [1147])) ;
    dffeas U_4_U_0_reg_rcv_current_state_5_ (.q (U_4_U_0_rcv_current_state[5]), 
           .d (nx15058z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1148]), .asdata (xmplr_dummy [1149]), 
           .sclr (xmplr_dummy [1150]), .sload (xmplr_dummy [1151])) ;
    dffeas U_4_U_0_reg_rcv_current_state_4_ (.q (U_4_U_0_rcv_current_state[4]), 
           .d (nx16055z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1152]), .asdata (xmplr_dummy [1153]), 
           .sclr (xmplr_dummy [1154]), .sload (xmplr_dummy [1155])) ;
    dffeas U_4_U_0_reg_rcv_current_state_3_ (.q (U_4_U_0_rcv_current_state[3]), 
           .d (nx17052z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1156]), .asdata (xmplr_dummy [1157]), 
           .sclr (xmplr_dummy [1158]), .sload (xmplr_dummy [1159])) ;
    dffeas U_4_U_0_reg_rcv_current_state_2_ (.q (U_4_U_0_rcv_current_state[2]), 
           .d (nx18049z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1160]), .asdata (xmplr_dummy [1161]), 
           .sclr (xmplr_dummy [1162]), .sload (xmplr_dummy [1163])) ;
    dffeas U_4_U_0_reg_rcv_current_state_1_ (.q (U_4_U_0_rcv_current_state[1]), 
           .d (nx19046z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1164]), .asdata (xmplr_dummy [1165]), 
           .sclr (xmplr_dummy [1166]), .sload (xmplr_dummy [1167])) ;
    dffeas U_4_U_0_reg_rcv_current_state_0_ (.q (nx64054z4), .d (nx20043z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1168]), .asdata (xmplr_dummy [1169]), .sclr (
           xmplr_dummy [1170]), .sload (xmplr_dummy [1171])) ;
    dffeas U_4_U_0_reg_xmit_current_state_6_ (.q (U_4_done_xmitting), .d (
           nx4306z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1172]), .asdata (xmplr_dummy [1173]), 
           .sclr (xmplr_dummy [1174]), .sload (xmplr_dummy [1175])) ;
    dffeas U_4_U_0_reg_xmit_current_state_5_ (.q (U_4_U_0_xmit_current_state[5])
           , .d (nx3309z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1176]), .asdata (xmplr_dummy [1177]), 
           .sclr (xmplr_dummy [1178]), .sload (xmplr_dummy [1179])) ;
    dffeas U_4_U_0_reg_xmit_current_state_4_ (.q (U_4_U_0_xmit_current_state[4])
           , .d (U_4_done_xmitting), .clk (clk_int), .ena (1'b1), .clrn (rst_int
           ), .prn (U_2_PWR), .aload (xmplr_dummy [1180]), .asdata (
           xmplr_dummy [1181]), .sclr (xmplr_dummy [1182]), .sload (
           xmplr_dummy [1183])) ;
    dffeas U_4_U_0_reg_xmit_current_state_3_ (.q (U_4_U_0_xmit_current_state[3])
           , .d (nx1315z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1184]), .asdata (xmplr_dummy [1185]), 
           .sclr (xmplr_dummy [1186]), .sload (xmplr_dummy [1187])) ;
    dffeas U_4_U_0_reg_xmit_current_state_2_ (.q (U_4_U_0_xmit_current_state[2])
           , .d (nx318z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1188]), .asdata (xmplr_dummy [1189]), 
           .sclr (xmplr_dummy [1190]), .sload (xmplr_dummy [1191])) ;
    dffeas U_4_U_0_reg_xmit_current_state_1_ (.q (U_4_U_0_xmit_current_state[1])
           , .d (nx64857z1), .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (
           U_2_PWR), .aload (xmplr_dummy [1192]), .asdata (xmplr_dummy [1193]), 
           .sclr (xmplr_dummy [1194]), .sload (xmplr_dummy [1195])) ;
    dffeas U_4_U_0_reg_xmit_current_state_0_ (.q (nx64857z2), .d (nx63860z1), .clk (
           clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1196]), .asdata (xmplr_dummy [1197]), .sclr (
           xmplr_dummy [1198]), .sload (xmplr_dummy [1199])) ;
    dffeas U_4_U_0_reg_sout_cld (.q (nx50810z1), .d (nx35948z1), .clk (clk_int)
           , .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1200]), .asdata (xmplr_dummy [1201]), .sclr (
           xmplr_dummy [1202]), .sload (xmplr_dummy [1203])) ;
    dffeas U_4_U_0_reg_enable_xmit_clk_cld (.q (enable_xmit_clk), .d (nx3650z1)
           , .clk (clk_int), .ena (1'b1), .clrn (rst_int), .prn (U_2_PWR), .aload (
           xmplr_dummy [1204]), .asdata (xmplr_dummy [1205]), .sclr (
           xmplr_dummy [1206]), .sload (xmplr_dummy [1207])) ;
endmodule

