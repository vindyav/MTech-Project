/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5-3
// Date      : Sat Nov 29 18:29:50 2025
/////////////////////////////////////////////////////////////


module accelerator_soc ( clk, rst_n, s_axi_awaddr, s_axi_awvalid, 
        s_axi_awready, s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_araddr, 
        s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rready, 
        host_mem_we, host_mem_addr, host_mem_wdata );
  input [3:0] s_axi_awaddr;
  input [31:0] s_axi_wdata;
  input [3:0] s_axi_araddr;
  output [31:0] s_axi_rdata;
  input [9:0] host_mem_addr;
  input [31:0] host_mem_wdata;
  input clk, rst_n, s_axi_awvalid, s_axi_wvalid, s_axi_arvalid, s_axi_rready,
         host_mem_we;
  output s_axi_awready, s_axi_wready, s_axi_arready, s_axi_rvalid;
  wire   s_axi_awready, quant_mode_cfg, start_pulse, clear_pulse, done_signal,
         \u_axi_slave/N45 , \u_axi_slave/reg_status[0] , \u_axi_slave/N44 ,
         \u_axi_slave/N40 , \u_axi_slave/N15 , n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n989, n990,
         n991, n992, n993;
  wire   [15:0] num_pixels_cfg;
  wire   [31:1] \u_axi_slave/reg_quant ;
  wire   [31:16] \u_axi_slave/reg_pixel_cnt ;
  wire   [31:0] \u_axi_slave/reg_ctrl ;
  wire   [15:0] \u_ctrl/write_cnt ;
  wire   [15:0] \u_ctrl/process_cnt ;
  wire   [2:0] \u_ctrl/state ;
  assign s_axi_wready = s_axi_awready;

  dfcrq1 \u_axi_slave/ar_ready_reg  ( .D(\u_axi_slave/N45 ), .CP(clk), .CDN(
        rst_n), .Q(s_axi_arready) );
  dfcrq1 \u_axi_slave/r_valid_reg  ( .D(n597), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rvalid) );
  dfcrq1 \u_axi_slave/aw_ready_reg  ( .D(\u_axi_slave/N15 ), .CP(clk), .CDN(
        rst_n), .Q(s_axi_awready) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[31]  ( .D(n595), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [31]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[30]  ( .D(n594), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [30]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[29]  ( .D(n593), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [29]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[28]  ( .D(n592), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [28]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[27]  ( .D(n591), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [27]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[26]  ( .D(n590), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [26]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[25]  ( .D(n589), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [25]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[24]  ( .D(n588), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [24]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[23]  ( .D(n587), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [23]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[22]  ( .D(n586), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [22]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[21]  ( .D(n585), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [21]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[20]  ( .D(n584), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [20]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[19]  ( .D(n583), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [19]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[18]  ( .D(n582), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [18]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[17]  ( .D(n581), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [17]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[16]  ( .D(n580), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [16]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[15]  ( .D(n579), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [15]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[14]  ( .D(n578), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [14]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[13]  ( .D(n577), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [13]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[12]  ( .D(n576), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [12]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[11]  ( .D(n575), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [11]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[10]  ( .D(n574), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [10]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[9]  ( .D(n573), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [9]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[8]  ( .D(n572), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [8]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[7]  ( .D(n571), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [7]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[6]  ( .D(n570), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [6]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[5]  ( .D(n569), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [5]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[4]  ( .D(n568), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [4]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[3]  ( .D(n567), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [3]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[2]  ( .D(n566), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [2]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[0]  ( .D(n596), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [0]) );
  dfcrq1 \u_axi_slave/reg_ctrl_reg[1]  ( .D(n565), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_ctrl [1]) );
  dfcrq1 \u_axi_slave/o_clear_irq_reg  ( .D(\u_axi_slave/N40 ), .CP(clk), 
        .CDN(rst_n), .Q(clear_pulse) );
  dfcrq1 \u_axi_slave/o_start_reg  ( .D(\u_axi_slave/N44 ), .CP(clk), .CDN(
        rst_n), .Q(start_pulse) );
  dfcrq1 \u_axi_slave/reg_quant_reg[0]  ( .D(n564), .CP(clk), .CDN(rst_n), .Q(
        quant_mode_cfg) );
  dfcrq1 \u_axi_slave/reg_quant_reg[1]  ( .D(n563), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [1]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[2]  ( .D(n562), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [2]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[3]  ( .D(n561), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [3]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[4]  ( .D(n560), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [4]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[5]  ( .D(n559), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [5]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[6]  ( .D(n558), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [6]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[7]  ( .D(n557), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [7]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[8]  ( .D(n556), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [8]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[9]  ( .D(n555), .CP(clk), .CDN(rst_n), .Q(
        \u_axi_slave/reg_quant [9]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[10]  ( .D(n554), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [10]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[11]  ( .D(n553), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [11]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[12]  ( .D(n552), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [12]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[13]  ( .D(n551), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [13]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[14]  ( .D(n550), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [14]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[15]  ( .D(n549), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [15]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[16]  ( .D(n548), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [16]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[17]  ( .D(n547), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [17]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[18]  ( .D(n546), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [18]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[19]  ( .D(n545), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [19]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[20]  ( .D(n544), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [20]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[21]  ( .D(n543), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [21]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[22]  ( .D(n542), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [22]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[23]  ( .D(n541), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [23]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[24]  ( .D(n540), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [24]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[25]  ( .D(n539), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [25]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[26]  ( .D(n538), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [26]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[27]  ( .D(n537), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [27]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[28]  ( .D(n536), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [28]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[29]  ( .D(n535), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [29]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[30]  ( .D(n534), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [30]) );
  dfcrq1 \u_axi_slave/reg_quant_reg[31]  ( .D(n533), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_quant [31]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[0]  ( .D(n532), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[0]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[1]  ( .D(n531), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[1]) );
  dfcrq1 \u_axi_slave/r_data_reg[1]  ( .D(n493), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[1]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[2]  ( .D(n530), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[2]) );
  dfcrq1 \u_axi_slave/r_data_reg[2]  ( .D(n492), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[2]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[3]  ( .D(n529), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[3]) );
  dfcrq1 \u_axi_slave/r_data_reg[3]  ( .D(n491), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[3]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[4]  ( .D(n528), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[4]) );
  dfcrq1 \u_axi_slave/r_data_reg[4]  ( .D(n490), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[4]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[5]  ( .D(n527), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[5]) );
  dfcrq1 \u_axi_slave/r_data_reg[5]  ( .D(n489), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[5]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[6]  ( .D(n526), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[6]) );
  dfcrq1 \u_axi_slave/r_data_reg[6]  ( .D(n488), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[6]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[7]  ( .D(n525), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[7]) );
  dfcrq1 \u_axi_slave/r_data_reg[7]  ( .D(n487), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[7]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[8]  ( .D(n524), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[8]) );
  dfcrq1 \u_axi_slave/r_data_reg[8]  ( .D(n486), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[8]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[9]  ( .D(n523), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[9]) );
  dfcrq1 \u_axi_slave/r_data_reg[9]  ( .D(n485), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[9]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[10]  ( .D(n522), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[10]) );
  dfcrq1 \u_axi_slave/r_data_reg[10]  ( .D(n484), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[10]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[11]  ( .D(n521), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[11]) );
  dfcrq1 \u_axi_slave/r_data_reg[11]  ( .D(n483), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[11]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[12]  ( .D(n520), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[12]) );
  dfcrq1 \u_axi_slave/r_data_reg[12]  ( .D(n482), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[12]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[13]  ( .D(n519), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[13]) );
  dfcrq1 \u_axi_slave/r_data_reg[13]  ( .D(n481), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[13]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[14]  ( .D(n518), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[14]) );
  dfcrq1 \u_axi_slave/r_data_reg[14]  ( .D(n480), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[14]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[15]  ( .D(n517), .CP(clk), .CDN(rst_n), 
        .Q(num_pixels_cfg[15]) );
  dfcrq1 \u_axi_slave/r_data_reg[15]  ( .D(n479), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[15]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[16]  ( .D(n516), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [16]) );
  dfcrq1 \u_axi_slave/r_data_reg[16]  ( .D(n478), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[16]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[17]  ( .D(n515), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [17]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[18]  ( .D(n514), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [18]) );
  dfcrq1 \u_axi_slave/r_data_reg[18]  ( .D(n476), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[18]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[19]  ( .D(n513), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [19]) );
  dfcrq1 \u_axi_slave/r_data_reg[19]  ( .D(n475), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[19]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[20]  ( .D(n512), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [20]) );
  dfcrq1 \u_axi_slave/r_data_reg[20]  ( .D(n474), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[20]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[21]  ( .D(n511), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [21]) );
  dfcrq1 \u_axi_slave/r_data_reg[21]  ( .D(n473), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[21]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[22]  ( .D(n510), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [22]) );
  dfcrq1 \u_axi_slave/r_data_reg[22]  ( .D(n472), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[22]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[23]  ( .D(n509), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [23]) );
  dfcrq1 \u_axi_slave/r_data_reg[23]  ( .D(n471), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[23]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[24]  ( .D(n508), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [24]) );
  dfcrq1 \u_axi_slave/r_data_reg[24]  ( .D(n470), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[24]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[25]  ( .D(n507), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [25]) );
  dfcrq1 \u_axi_slave/r_data_reg[25]  ( .D(n469), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[25]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[26]  ( .D(n506), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [26]) );
  dfcrq1 \u_axi_slave/r_data_reg[26]  ( .D(n468), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[26]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[27]  ( .D(n505), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [27]) );
  dfcrq1 \u_axi_slave/r_data_reg[27]  ( .D(n467), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[27]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[28]  ( .D(n504), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [28]) );
  dfcrq1 \u_axi_slave/r_data_reg[28]  ( .D(n466), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[28]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[29]  ( .D(n503), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [29]) );
  dfcrq1 \u_axi_slave/r_data_reg[29]  ( .D(n465), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[29]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[30]  ( .D(n502), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [30]) );
  dfcrq1 \u_axi_slave/r_data_reg[30]  ( .D(n464), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[30]) );
  dfcrq1 \u_axi_slave/reg_pixel_cnt_reg[31]  ( .D(n501), .CP(clk), .CDN(rst_n), 
        .Q(\u_axi_slave/reg_pixel_cnt [31]) );
  dfcrq1 \u_axi_slave/r_data_reg[31]  ( .D(n463), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[31]) );
  dfcrq1 \u_ctrl/state_reg[2]  ( .D(n498), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/state [2]) );
  dfcrq1 \u_ctrl/state_reg[1]  ( .D(n496), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/state [1]) );
  dfcrq1 \u_ctrl/done_reg  ( .D(n495), .CP(clk), .CDN(rst_n), .Q(done_signal)
         );
  dfcrq1 \u_axi_slave/reg_status_reg[0]  ( .D(done_signal), .CP(clk), .CDN(
        rst_n), .Q(\u_axi_slave/reg_status[0] ) );
  dfcrq1 \u_axi_slave/r_data_reg[0]  ( .D(n494), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[0]) );
  dfcrq1 \u_ctrl/write_cnt_reg[0]  ( .D(n462), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [0]) );
  dfcrq1 \u_ctrl/write_cnt_reg[1]  ( .D(n499), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [1]) );
  dfcrq1 \u_ctrl/write_cnt_reg[2]  ( .D(n461), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [2]) );
  dfcrq1 \u_ctrl/write_cnt_reg[3]  ( .D(n460), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [3]) );
  dfcrq1 \u_ctrl/write_cnt_reg[4]  ( .D(n459), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [4]) );
  dfcrq1 \u_ctrl/write_cnt_reg[5]  ( .D(n458), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [5]) );
  dfcrq1 \u_ctrl/write_cnt_reg[6]  ( .D(n457), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [6]) );
  dfcrq1 \u_ctrl/write_cnt_reg[7]  ( .D(n456), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [7]) );
  dfcrq1 \u_ctrl/write_cnt_reg[8]  ( .D(n455), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [8]) );
  dfcrq1 \u_ctrl/write_cnt_reg[9]  ( .D(n454), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [9]) );
  dfcrq1 \u_ctrl/write_cnt_reg[10]  ( .D(n453), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [10]) );
  dfcrq1 \u_ctrl/write_cnt_reg[11]  ( .D(n452), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [11]) );
  dfcrq1 \u_ctrl/write_cnt_reg[12]  ( .D(n451), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [12]) );
  dfcrq1 \u_ctrl/write_cnt_reg[13]  ( .D(n450), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [13]) );
  dfcrq1 \u_ctrl/write_cnt_reg[14]  ( .D(n449), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [14]) );
  dfcrq1 \u_ctrl/write_cnt_reg[15]  ( .D(n448), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/write_cnt [15]) );
  dfcrq1 \u_ctrl/process_cnt_reg[0]  ( .D(n447), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [0]) );
  dfcrq1 \u_ctrl/process_cnt_reg[1]  ( .D(n446), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [1]) );
  dfcrq1 \u_ctrl/process_cnt_reg[2]  ( .D(n445), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [2]) );
  dfcrq1 \u_ctrl/process_cnt_reg[3]  ( .D(n444), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [3]) );
  dfcrq1 \u_ctrl/process_cnt_reg[4]  ( .D(n443), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [4]) );
  dfcrq1 \u_ctrl/process_cnt_reg[5]  ( .D(n442), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [5]) );
  dfcrq1 \u_ctrl/process_cnt_reg[6]  ( .D(n441), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [6]) );
  dfcrq1 \u_ctrl/process_cnt_reg[7]  ( .D(n440), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [7]) );
  dfcrq1 \u_ctrl/process_cnt_reg[8]  ( .D(n439), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [8]) );
  dfcrq1 \u_ctrl/process_cnt_reg[9]  ( .D(n438), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [9]) );
  dfcrq1 \u_ctrl/process_cnt_reg[10]  ( .D(n437), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [10]) );
  dfcrq1 \u_ctrl/process_cnt_reg[11]  ( .D(n436), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [11]) );
  dfcrq1 \u_ctrl/process_cnt_reg[12]  ( .D(n435), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [12]) );
  dfcrq1 \u_ctrl/process_cnt_reg[13]  ( .D(n434), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [13]) );
  dfcrq1 \u_ctrl/process_cnt_reg[14]  ( .D(n433), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [14]) );
  dfcrq1 \u_ctrl/process_cnt_reg[15]  ( .D(n500), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/process_cnt [15]) );
  dfcrq1 \u_axi_slave/r_data_reg[17]  ( .D(n477), .CP(clk), .CDN(rst_n), .Q(
        s_axi_rdata[17]) );
  dfcrq1 \u_ctrl/state_reg[0]  ( .D(n497), .CP(clk), .CDN(rst_n), .Q(
        \u_ctrl/state [0]) );
  nr02d4 U454 ( .A1(n776), .A2(n823), .ZN(n777) );
  invbd4 U455 ( .I(n874), .ZN(n858) );
  aoim22d2 U456 ( .A1(n885), .A2(n884), .B1(\u_axi_slave/reg_pixel_cnt [20]), 
        .B2(n882), .Z(n512) );
  aoim22d2 U457 ( .A1(n885), .A2(n879), .B1(\u_axi_slave/reg_pixel_cnt [17]), 
        .B2(n882), .Z(n515) );
  aoim22d2 U458 ( .A1(n885), .A2(n883), .B1(\u_axi_slave/reg_pixel_cnt [19]), 
        .B2(n882), .Z(n513) );
  aoim22d2 U459 ( .A1(n885), .A2(n880), .B1(\u_axi_slave/reg_pixel_cnt [18]), 
        .B2(n807), .Z(n514) );
  aoim22d1 U460 ( .A1(n807), .A2(n894), .B1(\u_axi_slave/reg_pixel_cnt [29]), 
        .B2(n882), .Z(n503) );
  aoim22d1 U461 ( .A1(n807), .A2(n889), .B1(\u_axi_slave/reg_pixel_cnt [24]), 
        .B2(n882), .Z(n508) );
  aoim22d1 U462 ( .A1(n873), .A2(n879), .B1(\u_axi_slave/reg_quant [17]), .B2(
        n875), .Z(n547) );
  aoim22d1 U463 ( .A1(n877), .A2(n856), .B1(\u_axi_slave/reg_quant [1]), .B2(
        n876), .Z(n563) );
  xr02d1 U464 ( .A1(n816), .A2(n815), .Z(n817) );
  xr02d1 U465 ( .A1(n723), .A2(n722), .Z(n724) );
  aoi22d1 U466 ( .A1(n858), .A2(n892), .B1(n974), .B2(n874), .ZN(n537) );
  aoi22d1 U467 ( .A1(n858), .A2(n891), .B1(n971), .B2(n874), .ZN(n538) );
  aoi22d1 U468 ( .A1(n858), .A2(n890), .B1(n967), .B2(n874), .ZN(n539) );
  aoi22d1 U469 ( .A1(n858), .A2(n888), .B1(n963), .B2(n874), .ZN(n541) );
  aoi22d1 U470 ( .A1(n858), .A2(n886), .B1(n959), .B2(n874), .ZN(n543) );
  aoi22d1 U471 ( .A1(n858), .A2(n883), .B1(n955), .B2(n874), .ZN(n545) );
  aoi22d1 U472 ( .A1(n858), .A2(n880), .B1(n952), .B2(n874), .ZN(n546) );
  aoi22d1 U473 ( .A1(n858), .A2(n878), .B1(n948), .B2(n874), .ZN(n548) );
  aoi22d1 U474 ( .A1(n858), .A2(n855), .B1(n902), .B2(n874), .ZN(n564) );
  aoi22d1 U475 ( .A1(n875), .A2(n893), .B1(n978), .B2(n874), .ZN(n536) );
  aoi22d1 U476 ( .A1(n875), .A2(n895), .B1(n986), .B2(n874), .ZN(n534) );
  aoi22d1 U477 ( .A1(n882), .A2(n897), .B1(n992), .B2(n896), .ZN(n501) );
  invbd4 U478 ( .I(n642), .ZN(n635) );
  nr04d2 U479 ( .A1(n769), .A2(n754), .A3(n675), .A4(n674), .ZN(n676) );
  invbd4 U480 ( .I(n987), .ZN(n838) );
  nd02d1 U481 ( .A1(n773), .A2(\u_ctrl/state [0]), .ZN(n823) );
  nr02d0 U482 ( .A1(n816), .A2(n815), .ZN(n809) );
  nr02d0 U483 ( .A1(n723), .A2(n722), .ZN(n720) );
  inv0d1 U484 ( .I(n979), .ZN(n642) );
  nd03d2 U485 ( .A1(n844), .A2(s_axi_arready), .A3(n599), .ZN(n836) );
  aoim22d1 U486 ( .A1(n882), .A2(n887), .B1(\u_axi_slave/reg_pixel_cnt [22]), 
        .B2(n882), .Z(n510) );
  inv0d1 U487 ( .I(s_axi_wdata[22]), .ZN(n887) );
  inv0d1 U488 ( .I(s_axi_wdata[24]), .ZN(n889) );
  inv0d1 U489 ( .I(s_axi_wdata[29]), .ZN(n894) );
  inv0d1 U490 ( .I(s_axi_wdata[20]), .ZN(n884) );
  inv0d1 U491 ( .I(s_axi_wdata[17]), .ZN(n879) );
  inv0d1 U492 ( .I(s_axi_arvalid), .ZN(n598) );
  inv0d0 U493 ( .I(n598), .ZN(n599) );
  inv0d0 U494 ( .I(n598), .ZN(n600) );
  inv0d0 U495 ( .I(s_axi_wdata[0]), .ZN(n601) );
  inv0d1 U496 ( .I(n601), .ZN(n602) );
  inv0d0 U497 ( .I(s_axi_wdata[1]), .ZN(n603) );
  inv0d1 U498 ( .I(n603), .ZN(n604) );
  inv0d0 U499 ( .I(s_axi_wdata[2]), .ZN(n605) );
  inv0d1 U500 ( .I(n605), .ZN(n606) );
  inv0d0 U501 ( .I(s_axi_wdata[3]), .ZN(n607) );
  inv0d1 U502 ( .I(n607), .ZN(n608) );
  inv0d0 U503 ( .I(s_axi_wdata[4]), .ZN(n609) );
  inv0d1 U504 ( .I(n609), .ZN(n610) );
  inv0d0 U505 ( .I(s_axi_wdata[5]), .ZN(n611) );
  inv0d1 U506 ( .I(n611), .ZN(n612) );
  inv0d0 U507 ( .I(s_axi_wdata[6]), .ZN(n613) );
  inv0d1 U508 ( .I(n613), .ZN(n614) );
  inv0d0 U509 ( .I(s_axi_wdata[7]), .ZN(n615) );
  inv0d1 U510 ( .I(n615), .ZN(n616) );
  inv0d0 U511 ( .I(s_axi_wdata[8]), .ZN(n617) );
  inv0d1 U512 ( .I(n617), .ZN(n618) );
  inv0d0 U513 ( .I(s_axi_wdata[9]), .ZN(n619) );
  inv0d1 U514 ( .I(n619), .ZN(n620) );
  inv0d0 U515 ( .I(s_axi_wdata[10]), .ZN(n621) );
  inv0d1 U516 ( .I(n621), .ZN(n622) );
  inv0d0 U517 ( .I(s_axi_wdata[11]), .ZN(n623) );
  inv0d1 U518 ( .I(n623), .ZN(n624) );
  inv0d0 U519 ( .I(s_axi_wdata[12]), .ZN(n625) );
  inv0d1 U520 ( .I(n625), .ZN(n626) );
  inv0d0 U521 ( .I(s_axi_wdata[13]), .ZN(n627) );
  inv0d1 U522 ( .I(n627), .ZN(n628) );
  inv0d0 U523 ( .I(s_axi_wdata[14]), .ZN(n629) );
  inv0d1 U524 ( .I(n629), .ZN(n630) );
  inv0d0 U525 ( .I(s_axi_wdata[15]), .ZN(n631) );
  inv0d1 U526 ( .I(n631), .ZN(n632) );
  inv0d0 U527 ( .I(s_axi_awaddr[3]), .ZN(n633) );
  inv0d1 U528 ( .I(n633), .ZN(n634) );
  inv0d1 U529 ( .I(s_axi_wdata[28]), .ZN(n893) );
  inv0d1 U530 ( .I(s_axi_wdata[27]), .ZN(n892) );
  inv0d1 U531 ( .I(s_axi_wdata[26]), .ZN(n891) );
  aoim22d2 U532 ( .A1(n848), .A2(n890), .B1(\u_axi_slave/reg_ctrl [25]), .B2(
        n847), .Z(n589) );
  aoim22d1 U533 ( .A1(n807), .A2(n890), .B1(\u_axi_slave/reg_pixel_cnt [25]), 
        .B2(n882), .Z(n507) );
  inv0d1 U534 ( .I(s_axi_wdata[25]), .ZN(n890) );
  inv0d1 U535 ( .I(s_axi_wdata[23]), .ZN(n888) );
  aoim22d2 U536 ( .A1(n852), .A2(n886), .B1(\u_axi_slave/reg_ctrl [21]), .B2(
        n847), .Z(n585) );
  aoim22d1 U537 ( .A1(n882), .A2(n886), .B1(\u_axi_slave/reg_pixel_cnt [21]), 
        .B2(n882), .Z(n511) );
  inv0d1 U538 ( .I(s_axi_wdata[21]), .ZN(n886) );
  aoim22d2 U539 ( .A1(n852), .A2(n883), .B1(\u_axi_slave/reg_ctrl [19]), .B2(
        n847), .Z(n583) );
  inv0d1 U540 ( .I(s_axi_wdata[19]), .ZN(n883) );
  inv0d1 U541 ( .I(s_axi_wdata[18]), .ZN(n880) );
  inv0d1 U542 ( .I(s_axi_wdata[16]), .ZN(n878) );
  invbd4 U543 ( .I(n881), .ZN(n882) );
  invbd4 U544 ( .I(n881), .ZN(n807) );
  invbd2 U545 ( .I(n636), .ZN(n847) );
  nr02d0 U546 ( .A1(n855), .A2(n853), .ZN(\u_axi_slave/N44 ) );
  buffd1 U547 ( .I(n636), .Z(n853) );
  or02d2 U548 ( .A1(n854), .A2(n638), .Z(n881) );
  nr03d4 U549 ( .A1(n639), .A2(n637), .A3(n979), .ZN(n914) );
  nd02d0 U550 ( .A1(n693), .A2(\u_ctrl/process_cnt [12]), .ZN(n684) );
  aor31d1 U551 ( .B1(start_pulse), .B2(n827), .B3(n899), .A(n826), .Z(n497) );
  oai21d4 U552 ( .B1(n775), .B2(n827), .A(n773), .ZN(n774) );
  invbd2 U553 ( .I(n636), .ZN(n849) );
  inv0d4 U554 ( .I(n823), .ZN(n640) );
  inv0d4 U555 ( .I(n975), .ZN(n993) );
  nr02d0 U556 ( .A1(n781), .A2(n785), .ZN(n783) );
  nr02d0 U557 ( .A1(n684), .A2(n692), .ZN(n690) );
  bufbd3 U558 ( .I(n845), .Z(n636) );
  nd02d0 U559 ( .A1(n786), .A2(\u_ctrl/write_cnt [11]), .ZN(n781) );
  inv0d4 U560 ( .I(n773), .ZN(n733) );
  nd02d0 U561 ( .A1(n732), .A2(\u_ctrl/process_cnt [2]), .ZN(n727) );
  nd02d0 U562 ( .A1(n748), .A2(n751), .ZN(n667) );
  nd02d0 U563 ( .A1(n743), .A2(n736), .ZN(n663) );
  nd02d1 U564 ( .A1(n645), .A2(n634), .ZN(n854) );
  nd02d0 U565 ( .A1(n735), .A2(n737), .ZN(n664) );
  nr02d0 U566 ( .A1(n712), .A2(n681), .ZN(n683) );
  nr02d0 U567 ( .A1(n778), .A2(n800), .ZN(n780) );
  or02d0 U568 ( .A1(\u_ctrl/write_cnt [13]), .A2(n941), .Z(n755) );
  an03d0 U569 ( .A1(n644), .A2(s_axi_wvalid), .A3(s_axi_awvalid), .Z(
        \u_axi_slave/N15 ) );
  nr02d0 U570 ( .A1(n792), .A2(n794), .ZN(n786) );
  nd02d1 U571 ( .A1(n827), .A2(n686), .ZN(n898) );
  nd02d0 U572 ( .A1(\u_ctrl/write_cnt [7]), .A2(\u_ctrl/write_cnt [6]), .ZN(
        n778) );
  or02d0 U573 ( .A1(\u_ctrl/process_cnt [4]), .A2(\u_ctrl/process_cnt [12]), 
        .Z(n761) );
  nd02d0 U574 ( .A1(\u_ctrl/process_cnt [6]), .A2(\u_ctrl/process_cnt [7]), 
        .ZN(n681) );
  an02d0 U575 ( .A1(\u_ctrl/state [0]), .A2(\u_ctrl/state [1]), .Z(n679) );
  nd02d0 U576 ( .A1(\u_ctrl/process_cnt [10]), .A2(\u_ctrl/process_cnt [11]), 
        .ZN(n680) );
  nr02d2 U577 ( .A1(s_axi_araddr[1]), .A2(s_axi_araddr[0]), .ZN(n915) );
  buffd1 U578 ( .I(s_axi_awaddr[2]), .Z(n638) );
  buffd1 U579 ( .I(s_axi_araddr[3]), .Z(n637) );
  buffd1 U580 ( .I(s_axi_araddr[2]), .Z(n639) );
  inv0d1 U581 ( .I(n606), .ZN(n857) );
  inv0d1 U582 ( .I(n608), .ZN(n859) );
  inv0d1 U583 ( .I(n610), .ZN(n860) );
  inv0d1 U584 ( .I(n612), .ZN(n861) );
  inv0d1 U585 ( .I(n614), .ZN(n862) );
  inv0d1 U586 ( .I(n616), .ZN(n863) );
  inv0d1 U587 ( .I(n618), .ZN(n864) );
  inv0d1 U588 ( .I(n620), .ZN(n865) );
  inv0d1 U589 ( .I(n622), .ZN(n866) );
  inv0d1 U590 ( .I(n624), .ZN(n867) );
  inv0d1 U591 ( .I(n626), .ZN(n868) );
  inv0d1 U592 ( .I(n628), .ZN(n869) );
  inv0d1 U593 ( .I(n630), .ZN(n870) );
  inv0d1 U594 ( .I(n632), .ZN(n871) );
  aoim22d2 U595 ( .A1(n848), .A2(n897), .B1(\u_axi_slave/reg_ctrl [31]), .B2(
        n851), .Z(n595) );
  inv0d1 U596 ( .I(s_axi_wdata[31]), .ZN(n897) );
  aoim22d2 U597 ( .A1(n848), .A2(n895), .B1(\u_axi_slave/reg_ctrl [30]), .B2(
        n851), .Z(n594) );
  inv0d1 U598 ( .I(s_axi_wdata[30]), .ZN(n895) );
  inv0d1 U599 ( .I(num_pixels_cfg[7]), .ZN(n925) );
  inv0d1 U600 ( .I(n602), .ZN(n855) );
  aoi211d2 U601 ( .C1(n677), .C2(n760), .A(n676), .B(n678), .ZN(n825) );
  aoim22d2 U602 ( .A1(n852), .A2(n884), .B1(\u_axi_slave/reg_ctrl [20]), .B2(
        n847), .Z(n584) );
  aoim22d2 U603 ( .A1(n852), .A2(n879), .B1(\u_axi_slave/reg_ctrl [17]), .B2(
        n847), .Z(n581) );
  aoim22d2 U604 ( .A1(n852), .A2(n880), .B1(\u_axi_slave/reg_ctrl [18]), .B2(
        n847), .Z(n582) );
  aoim22d2 U605 ( .A1(n852), .A2(n878), .B1(\u_axi_slave/reg_ctrl [16]), .B2(
        n847), .Z(n580) );
  aoim22d2 U606 ( .A1(n848), .A2(n889), .B1(\u_axi_slave/reg_ctrl [24]), .B2(
        n847), .Z(n588) );
  aoim22d2 U607 ( .A1(n852), .A2(n887), .B1(\u_axi_slave/reg_ctrl [22]), .B2(
        n847), .Z(n586) );
  aoi21d4 U608 ( .B1(s_axi_rdata[6]), .B2(n635), .A(n641), .ZN(n921) );
  aoi21d4 U609 ( .B1(s_axi_rdata[2]), .B2(n635), .A(n641), .ZN(n909) );
  aoi21d4 U610 ( .B1(s_axi_rdata[3]), .B2(n635), .A(n641), .ZN(n912) );
  aoi21d4 U611 ( .B1(s_axi_rdata[5]), .B2(n635), .A(n641), .ZN(n918) );
  aoi211d2 U612 ( .C1(s_axi_rdata[0]), .C2(n635), .A(n982), .B(n904), .ZN(n907) );
  buffd3 U613 ( .I(n641), .Z(n982) );
  oai22d2 U614 ( .A1(\u_ctrl/write_cnt [12]), .A2(n938), .B1(n941), .B2(
        \u_ctrl/write_cnt [13]), .ZN(n757) );
  inv0d1 U615 ( .I(num_pixels_cfg[13]), .ZN(n941) );
  inv0d1 U616 ( .I(num_pixels_cfg[12]), .ZN(n938) );
  inv0d1 U617 ( .I(n604), .ZN(n856) );
  nd02d0 U618 ( .A1(n821), .A2(\u_ctrl/write_cnt [2]), .ZN(n813) );
  inv0d1 U619 ( .I(n811), .ZN(n821) );
  inv0d1 U620 ( .I(n725), .ZN(n732) );
  inv0d1 U621 ( .I(\u_ctrl/state [0]), .ZN(n827) );
  nr02d2 U622 ( .A1(\u_ctrl/state [2]), .A2(n686), .ZN(n773) );
  inv0d1 U623 ( .I(\u_ctrl/state [1]), .ZN(n686) );
  inv0d1 U624 ( .I(n799), .ZN(n816) );
  inv0d1 U625 ( .I(n711), .ZN(n723) );
  aoim22d2 U626 ( .A1(n848), .A2(n893), .B1(\u_axi_slave/reg_ctrl [28]), .B2(
        n849), .Z(n592) );
  aoim22d2 U627 ( .A1(n848), .A2(n892), .B1(\u_axi_slave/reg_ctrl [27]), .B2(
        n849), .Z(n591) );
  aoim22d2 U628 ( .A1(n848), .A2(n891), .B1(\u_axi_slave/reg_ctrl [26]), .B2(
        n849), .Z(n590) );
  aoim22d2 U629 ( .A1(n848), .A2(n888), .B1(\u_axi_slave/reg_ctrl [23]), .B2(
        n849), .Z(n587) );
  aoim22d2 U630 ( .A1(n852), .A2(n871), .B1(\u_axi_slave/reg_ctrl [15]), .B2(
        n849), .Z(n579) );
  aoim22d2 U631 ( .A1(n852), .A2(n869), .B1(\u_axi_slave/reg_ctrl [13]), .B2(
        n849), .Z(n577) );
  oai222d2 U632 ( .A1(n901), .A2(clear_pulse), .B1(n901), .B2(n900), .C1(n899), 
        .C2(n898), .ZN(n495) );
  inv0d1 U633 ( .I(\u_ctrl/state [2]), .ZN(n899) );
  nd02d0 U634 ( .A1(n831), .A2(\u_ctrl/write_cnt [8]), .ZN(n833) );
  inv0d1 U635 ( .I(n785), .ZN(n831) );
  inv0d1 U636 ( .I(n692), .ZN(n709) );
  buffd3 U637 ( .I(n914), .Z(n989) );
  nr03d4 U638 ( .A1(n639), .A2(n979), .A3(n905), .ZN(n975) );
  inv0d2 U639 ( .I(n915), .ZN(n980) );
  invbd2 U640 ( .I(n839), .ZN(n641) );
  nr04d1 U641 ( .A1(\u_ctrl/process_cnt [13]), .A2(\u_ctrl/process_cnt [10]), 
        .A3(\u_ctrl/process_cnt [14]), .A4(n761), .ZN(n763) );
  nr02d1 U642 ( .A1(n669), .A2(num_pixels_cfg[10]), .ZN(n750) );
  inv0d0 U643 ( .I(n775), .ZN(n776) );
  inv0d0 U644 ( .I(s_axi_awready), .ZN(n644) );
  nr03d2 U645 ( .A1(s_axi_awaddr[1]), .A2(n644), .A3(s_axi_awaddr[0]), .ZN(
        n645) );
  nr13d1 U646 ( .A1(n645), .A2(n638), .A3(n634), .ZN(n643) );
  inv0d1 U647 ( .I(n643), .ZN(n845) );
  nr02d1 U648 ( .A1(n856), .A2(n853), .ZN(\u_axi_slave/N40 ) );
  mx02d1 U649 ( .I0(num_pixels_cfg[9]), .I1(n620), .S(n807), .Z(n523) );
  inv0d0 U650 ( .I(num_pixels_cfg[15]), .ZN(n945) );
  nd02d1 U651 ( .A1(n945), .A2(\u_ctrl/write_cnt [15]), .ZN(n766) );
  nd02d1 U652 ( .A1(n679), .A2(n766), .ZN(n675) );
  inv0d0 U653 ( .I(n675), .ZN(n677) );
  inv0d0 U654 ( .I(num_pixels_cfg[14]), .ZN(n647) );
  inv0d0 U655 ( .I(\u_ctrl/write_cnt [15]), .ZN(n646) );
  nd02d1 U656 ( .A1(n646), .A2(num_pixels_cfg[15]), .ZN(n768) );
  oai21d1 U657 ( .B1(n647), .B2(\u_ctrl/write_cnt [14]), .A(n768), .ZN(n760)
         );
  inv0d0 U658 ( .I(\u_ctrl/write_cnt [14]), .ZN(n648) );
  nr02d0 U659 ( .A1(n648), .A2(num_pixels_cfg[14]), .ZN(n769) );
  inv0d0 U660 ( .I(\u_ctrl/write_cnt [13]), .ZN(n649) );
  nr02d0 U661 ( .A1(n649), .A2(num_pixels_cfg[13]), .ZN(n754) );
  inv0d0 U662 ( .I(\u_ctrl/write_cnt [12]), .ZN(n673) );
  inv0d0 U663 ( .I(num_pixels_cfg[4]), .ZN(n656) );
  inv0d1 U664 ( .I(num_pixels_cfg[1]), .ZN(n842) );
  inv0d1 U665 ( .I(num_pixels_cfg[0]), .ZN(n903) );
  oai22d1 U666 ( .A1(\u_ctrl/write_cnt [1]), .A2(n842), .B1(n903), .B2(
        \u_ctrl/write_cnt [0]), .ZN(n651) );
  inv0d1 U667 ( .I(num_pixels_cfg[2]), .ZN(n910) );
  aoi22d1 U668 ( .A1(\u_ctrl/write_cnt [2]), .A2(n910), .B1(n842), .B2(
        \u_ctrl/write_cnt [1]), .ZN(n650) );
  nd02d1 U669 ( .A1(n651), .A2(n650), .ZN(n655) );
  inv0d0 U670 ( .I(\u_ctrl/write_cnt [3]), .ZN(n653) );
  inv0d0 U671 ( .I(\u_ctrl/write_cnt [2]), .ZN(n652) );
  aoi22d1 U672 ( .A1(num_pixels_cfg[3]), .A2(n653), .B1(n652), .B2(
        num_pixels_cfg[2]), .ZN(n654) );
  oai211d1 U673 ( .C1(\u_ctrl/write_cnt [4]), .C2(n656), .A(n655), .B(n654), 
        .ZN(n661) );
  inv0d1 U674 ( .I(num_pixels_cfg[3]), .ZN(n913) );
  nd02d1 U675 ( .A1(n913), .A2(\u_ctrl/write_cnt [3]), .ZN(n657) );
  nd02d1 U676 ( .A1(n657), .A2(num_pixels_cfg[4]), .ZN(n658) );
  aoim22d1 U677 ( .A1(n658), .A2(\u_ctrl/write_cnt [4]), .B1(n657), .B2(
        num_pixels_cfg[4]), .Z(n660) );
  inv0d0 U678 ( .I(\u_ctrl/write_cnt [5]), .ZN(n659) );
  aoi22d1 U679 ( .A1(n661), .A2(n660), .B1(num_pixels_cfg[5]), .B2(n659), .ZN(
        n742) );
  inv0d0 U680 ( .I(num_pixels_cfg[5]), .ZN(n919) );
  nd02d1 U681 ( .A1(n919), .A2(\u_ctrl/write_cnt [5]), .ZN(n735) );
  inv0d0 U682 ( .I(num_pixels_cfg[6]), .ZN(n922) );
  nd02d1 U683 ( .A1(n922), .A2(\u_ctrl/write_cnt [6]), .ZN(n737) );
  nr02d1 U684 ( .A1(n925), .A2(\u_ctrl/write_cnt [7]), .ZN(n738) );
  nr02d0 U685 ( .A1(n922), .A2(\u_ctrl/write_cnt [6]), .ZN(n662) );
  nr02d1 U686 ( .A1(n738), .A2(n662), .ZN(n740) );
  inv0d0 U687 ( .I(num_pixels_cfg[8]), .ZN(n665) );
  nd02d1 U688 ( .A1(n665), .A2(\u_ctrl/write_cnt [8]), .ZN(n743) );
  nd02d1 U689 ( .A1(n925), .A2(\u_ctrl/write_cnt [7]), .ZN(n736) );
  oan211d1 U690 ( .C1(n742), .C2(n664), .B(n740), .A(n663), .ZN(n668) );
  nr02d0 U691 ( .A1(n665), .A2(\u_ctrl/write_cnt [8]), .ZN(n745) );
  inv0d0 U692 ( .I(num_pixels_cfg[9]), .ZN(n929) );
  nd02d1 U693 ( .A1(n929), .A2(\u_ctrl/write_cnt [9]), .ZN(n746) );
  inv0d0 U694 ( .I(\u_ctrl/write_cnt [9]), .ZN(n666) );
  nd02d1 U695 ( .A1(n666), .A2(num_pixels_cfg[9]), .ZN(n748) );
  inv0d0 U696 ( .I(\u_ctrl/write_cnt [10]), .ZN(n669) );
  nd02d1 U697 ( .A1(n669), .A2(num_pixels_cfg[10]), .ZN(n751) );
  oan211d1 U698 ( .C1(n668), .C2(n745), .B(n746), .A(n667), .ZN(n671) );
  inv0d0 U699 ( .I(\u_ctrl/write_cnt [11]), .ZN(n670) );
  nr02d0 U700 ( .A1(n670), .A2(num_pixels_cfg[11]), .ZN(n753) );
  nd02d1 U701 ( .A1(n670), .A2(num_pixels_cfg[11]), .ZN(n749) );
  oai31d1 U702 ( .B1(n671), .B2(n753), .B3(n750), .A(n749), .ZN(n672) );
  oan211d1 U703 ( .C1(num_pixels_cfg[12]), .C2(n673), .B(n672), .A(n757), .ZN(
        n674) );
  nd02d1 U704 ( .A1(n898), .A2(n899), .ZN(n678) );
  oai22d1 U705 ( .A1(n825), .A2(n686), .B1(n679), .B2(n678), .ZN(n496) );
  mx02d1 U706 ( .I0(num_pixels_cfg[15]), .I1(n632), .S(n807), .Z(n517) );
  mx02d1 U707 ( .I0(num_pixels_cfg[14]), .I1(n630), .S(n807), .Z(n518) );
  nd02d1 U708 ( .A1(\u_ctrl/process_cnt [8]), .A2(\u_ctrl/process_cnt [9]), 
        .ZN(n697) );
  nr02d1 U709 ( .A1(n697), .A2(n680), .ZN(n693) );
  nd02d1 U710 ( .A1(\u_ctrl/process_cnt [4]), .A2(\u_ctrl/process_cnt [5]), 
        .ZN(n712) );
  nd02d1 U711 ( .A1(\u_ctrl/process_cnt [2]), .A2(\u_ctrl/process_cnt [3]), 
        .ZN(n682) );
  nd02d1 U712 ( .A1(\u_ctrl/process_cnt [1]), .A2(\u_ctrl/process_cnt [0]), 
        .ZN(n725) );
  nr02d1 U713 ( .A1(n682), .A2(n725), .ZN(n711) );
  nd02d1 U714 ( .A1(n683), .A2(n711), .ZN(n692) );
  xr02d1 U715 ( .A1(n685), .A2(\u_ctrl/process_cnt [15]), .Z(n687) );
  aor22d1 U716 ( .A1(n687), .A2(n640), .B1(\u_ctrl/process_cnt [15]), .B2(n733), .Z(n500) );
  ah01d1 U717 ( .A(n688), .B(\u_ctrl/process_cnt [14]), .CO(n685), .S(n689) );
  aor22d1 U718 ( .A1(n689), .A2(n640), .B1(\u_ctrl/process_cnt [14]), .B2(n733), .Z(n433) );
  ah01d1 U719 ( .A(n690), .B(\u_ctrl/process_cnt [13]), .CO(n688), .S(n691) );
  aor22d1 U720 ( .A1(n691), .A2(n640), .B1(\u_ctrl/process_cnt [13]), .B2(n733), .Z(n434) );
  nd02d1 U721 ( .A1(n709), .A2(n693), .ZN(n695) );
  inv0d0 U722 ( .I(\u_ctrl/process_cnt [12]), .ZN(n694) );
  xr02d1 U723 ( .A1(n695), .A2(n694), .Z(n696) );
  aor22d1 U724 ( .A1(n696), .A2(n640), .B1(\u_ctrl/process_cnt [12]), .B2(n733), .Z(n435) );
  inv0d0 U725 ( .I(n697), .ZN(n698) );
  nd02d1 U726 ( .A1(n709), .A2(n698), .ZN(n703) );
  inv0d0 U727 ( .I(\u_ctrl/process_cnt [10]), .ZN(n702) );
  nr02d1 U728 ( .A1(n703), .A2(n702), .ZN(n700) );
  inv0d0 U729 ( .I(\u_ctrl/process_cnt [11]), .ZN(n699) );
  xn02d1 U730 ( .A1(n700), .A2(n699), .ZN(n701) );
  aor22d1 U731 ( .A1(n701), .A2(n640), .B1(\u_ctrl/process_cnt [11]), .B2(n733), .Z(n436) );
  xr02d1 U732 ( .A1(n703), .A2(n702), .Z(n704) );
  aor22d1 U733 ( .A1(n704), .A2(n640), .B1(\u_ctrl/process_cnt [10]), .B2(n733), .Z(n437) );
  nd02d1 U734 ( .A1(n709), .A2(\u_ctrl/process_cnt [8]), .ZN(n706) );
  inv0d0 U735 ( .I(\u_ctrl/process_cnt [9]), .ZN(n705) );
  xr02d1 U736 ( .A1(n706), .A2(n705), .Z(n707) );
  aor22d1 U737 ( .A1(n707), .A2(n640), .B1(\u_ctrl/process_cnt [9]), .B2(n733), 
        .Z(n438) );
  inv0d0 U738 ( .I(\u_ctrl/process_cnt [8]), .ZN(n708) );
  xn02d1 U739 ( .A1(n709), .A2(n708), .ZN(n710) );
  aor22d1 U740 ( .A1(n710), .A2(n640), .B1(\u_ctrl/process_cnt [8]), .B2(n733), 
        .Z(n439) );
  nr02d1 U741 ( .A1(n723), .A2(n712), .ZN(n717) );
  nd02d1 U742 ( .A1(n717), .A2(\u_ctrl/process_cnt [6]), .ZN(n714) );
  inv0d0 U743 ( .I(\u_ctrl/process_cnt [7]), .ZN(n713) );
  xr02d1 U744 ( .A1(n714), .A2(n713), .Z(n715) );
  aor22d1 U745 ( .A1(n715), .A2(n640), .B1(\u_ctrl/process_cnt [7]), .B2(n733), 
        .Z(n440) );
  inv0d0 U746 ( .I(\u_ctrl/process_cnt [6]), .ZN(n716) );
  xn02d1 U747 ( .A1(n717), .A2(n716), .ZN(n718) );
  aor22d1 U748 ( .A1(n718), .A2(n640), .B1(\u_ctrl/process_cnt [6]), .B2(n733), 
        .Z(n441) );
  inv0d0 U749 ( .I(\u_ctrl/process_cnt [4]), .ZN(n722) );
  inv0d0 U750 ( .I(\u_ctrl/process_cnt [5]), .ZN(n719) );
  xn02d1 U751 ( .A1(n720), .A2(n719), .ZN(n721) );
  aor22d1 U752 ( .A1(n721), .A2(n640), .B1(\u_ctrl/process_cnt [5]), .B2(n733), 
        .Z(n442) );
  aor22d1 U753 ( .A1(n724), .A2(n640), .B1(\u_ctrl/process_cnt [4]), .B2(n733), 
        .Z(n443) );
  inv0d0 U754 ( .I(\u_ctrl/process_cnt [3]), .ZN(n726) );
  xr02d1 U755 ( .A1(n727), .A2(n726), .Z(n728) );
  aor22d1 U756 ( .A1(n728), .A2(n640), .B1(\u_ctrl/process_cnt [3]), .B2(n733), 
        .Z(n444) );
  inv0d0 U757 ( .I(\u_ctrl/process_cnt [1]), .ZN(n729) );
  xn02d1 U758 ( .A1(n729), .A2(\u_ctrl/process_cnt [0]), .ZN(n730) );
  aor22d1 U759 ( .A1(n640), .A2(n730), .B1(\u_ctrl/process_cnt [1]), .B2(n733), 
        .Z(n446) );
  mx02d1 U760 ( .I0(n640), .I1(n733), .S(\u_ctrl/process_cnt [0]), .Z(n447) );
  inv0d0 U761 ( .I(\u_ctrl/process_cnt [2]), .ZN(n731) );
  xn02d1 U762 ( .A1(n732), .A2(n731), .ZN(n734) );
  aor22d1 U763 ( .A1(n734), .A2(n640), .B1(\u_ctrl/process_cnt [2]), .B2(n733), 
        .Z(n445) );
  mx02d1 U764 ( .I0(num_pixels_cfg[13]), .I1(n628), .S(n807), .Z(n519) );
  inv0d0 U765 ( .I(n735), .ZN(n741) );
  oai21d1 U766 ( .B1(n738), .B2(n737), .A(n736), .ZN(n739) );
  oan211d1 U767 ( .C1(n742), .C2(n741), .B(n740), .A(n739), .ZN(n744) );
  oai21d1 U768 ( .B1(n745), .B2(n744), .A(n743), .ZN(n747) );
  oaim21d1 U769 ( .B1(n748), .B2(n747), .A(n746), .ZN(n752) );
  aon211d1 U770 ( .C1(n752), .C2(n751), .B(n750), .A(n749), .ZN(n759) );
  inv0d0 U771 ( .I(n753), .ZN(n758) );
  aoi31d1 U772 ( .B1(\u_ctrl/write_cnt [12]), .B2(n938), .B3(n755), .A(n754), 
        .ZN(n756) );
  aon211d1 U773 ( .C1(n759), .C2(n758), .B(n757), .A(n756), .ZN(n772) );
  inv0d0 U774 ( .I(n760), .ZN(n771) );
  nr04d0 U775 ( .A1(\u_ctrl/process_cnt [15]), .A2(\u_ctrl/process_cnt [6]), 
        .A3(\u_ctrl/process_cnt [3]), .A4(\u_ctrl/process_cnt [8]), .ZN(n765)
         );
  nr04d0 U776 ( .A1(\u_ctrl/process_cnt [5]), .A2(\u_ctrl/process_cnt [7]), 
        .A3(\u_ctrl/process_cnt [9]), .A4(\u_ctrl/process_cnt [11]), .ZN(n764)
         );
  oai21d1 U777 ( .B1(\u_ctrl/process_cnt [1]), .B2(\u_ctrl/process_cnt [0]), 
        .A(\u_ctrl/process_cnt [2]), .ZN(n762) );
  nd04d1 U778 ( .A1(n765), .A2(n764), .A3(n763), .A4(n762), .ZN(n767) );
  oaim211d1 U779 ( .C1(n769), .C2(n768), .A(n767), .B(n766), .ZN(n770) );
  aoi21d1 U780 ( .B1(n772), .B2(n771), .A(n770), .ZN(n775) );
  nd02d1 U781 ( .A1(\u_ctrl/write_cnt [8]), .A2(\u_ctrl/write_cnt [9]), .ZN(
        n792) );
  inv0d0 U782 ( .I(\u_ctrl/write_cnt [10]), .ZN(n794) );
  nd02d1 U783 ( .A1(\u_ctrl/write_cnt [4]), .A2(\u_ctrl/write_cnt [5]), .ZN(
        n800) );
  nd02d1 U784 ( .A1(\u_ctrl/write_cnt [2]), .A2(\u_ctrl/write_cnt [3]), .ZN(
        n779) );
  nd02d1 U785 ( .A1(\u_ctrl/write_cnt [1]), .A2(\u_ctrl/write_cnt [0]), .ZN(
        n811) );
  nr02d1 U786 ( .A1(n779), .A2(n811), .ZN(n799) );
  nd02d1 U787 ( .A1(n780), .A2(n799), .ZN(n785) );
  aor22d1 U788 ( .A1(n774), .A2(\u_ctrl/write_cnt [13]), .B1(n777), .B2(n782), 
        .Z(n450) );
  mx02d1 U789 ( .I0(num_pixels_cfg[12]), .I1(n626), .S(n807), .Z(n520) );
  ah01d1 U790 ( .A(n783), .B(\u_ctrl/write_cnt [12]), .CO(n790), .S(n784) );
  aor22d1 U791 ( .A1(n774), .A2(\u_ctrl/write_cnt [12]), .B1(n777), .B2(n784), 
        .Z(n451) );
  nd02d1 U792 ( .A1(n831), .A2(n786), .ZN(n788) );
  inv0d0 U793 ( .I(\u_ctrl/write_cnt [11]), .ZN(n787) );
  xr02d1 U794 ( .A1(n788), .A2(n787), .Z(n789) );
  aor22d1 U795 ( .A1(n774), .A2(\u_ctrl/write_cnt [11]), .B1(n777), .B2(n789), 
        .Z(n452) );
  mx02d1 U796 ( .I0(num_pixels_cfg[11]), .I1(n624), .S(n807), .Z(n521) );
  ah01d1 U797 ( .A(n790), .B(\u_ctrl/write_cnt [13]), .CO(n828), .S(n782) );
  aor22d1 U798 ( .A1(n774), .A2(\u_ctrl/write_cnt [14]), .B1(n777), .B2(n791), 
        .Z(n449) );
  inv0d0 U799 ( .I(n792), .ZN(n793) );
  nd02d1 U800 ( .A1(n831), .A2(n793), .ZN(n795) );
  xr02d1 U801 ( .A1(n795), .A2(n794), .Z(n796) );
  aor22d1 U802 ( .A1(n774), .A2(\u_ctrl/write_cnt [10]), .B1(n777), .B2(n796), 
        .Z(n453) );
  mx02d1 U803 ( .I0(num_pixels_cfg[10]), .I1(n622), .S(n807), .Z(n522) );
  inv0d0 U804 ( .I(\u_ctrl/write_cnt [8]), .ZN(n797) );
  xn02d1 U805 ( .A1(n831), .A2(n797), .ZN(n798) );
  aor22d1 U806 ( .A1(n774), .A2(\u_ctrl/write_cnt [8]), .B1(n777), .B2(n798), 
        .Z(n455) );
  mx02d1 U807 ( .I0(num_pixels_cfg[8]), .I1(n618), .S(n807), .Z(n524) );
  nr02d1 U808 ( .A1(n816), .A2(n800), .ZN(n805) );
  nd02d1 U809 ( .A1(n805), .A2(\u_ctrl/write_cnt [6]), .ZN(n802) );
  inv0d0 U810 ( .I(\u_ctrl/write_cnt [7]), .ZN(n801) );
  xr02d1 U811 ( .A1(n802), .A2(n801), .Z(n803) );
  aor22d1 U812 ( .A1(n774), .A2(\u_ctrl/write_cnt [7]), .B1(n777), .B2(n803), 
        .Z(n456) );
  mx02d1 U813 ( .I0(num_pixels_cfg[7]), .I1(n616), .S(n807), .Z(n525) );
  inv0d0 U814 ( .I(\u_ctrl/write_cnt [6]), .ZN(n804) );
  xn02d1 U815 ( .A1(n805), .A2(n804), .ZN(n806) );
  aor22d1 U816 ( .A1(n774), .A2(\u_ctrl/write_cnt [6]), .B1(n777), .B2(n806), 
        .Z(n457) );
  mx02d1 U817 ( .I0(num_pixels_cfg[6]), .I1(n614), .S(n807), .Z(n526) );
  inv0d0 U818 ( .I(\u_ctrl/write_cnt [4]), .ZN(n815) );
  inv0d0 U819 ( .I(\u_ctrl/write_cnt [5]), .ZN(n808) );
  xn02d1 U820 ( .A1(n809), .A2(n808), .ZN(n810) );
  aor22d1 U821 ( .A1(n774), .A2(\u_ctrl/write_cnt [5]), .B1(n777), .B2(n810), 
        .Z(n458) );
  inv0d2 U822 ( .I(n881), .ZN(n885) );
  mx02d1 U823 ( .I0(num_pixels_cfg[5]), .I1(n612), .S(n885), .Z(n527) );
  inv0d0 U824 ( .I(\u_ctrl/write_cnt [3]), .ZN(n812) );
  xr02d1 U825 ( .A1(n813), .A2(n812), .Z(n814) );
  aor22d1 U826 ( .A1(n774), .A2(\u_ctrl/write_cnt [3]), .B1(n777), .B2(n814), 
        .Z(n460) );
  mx02d1 U827 ( .I0(num_pixels_cfg[3]), .I1(n608), .S(n885), .Z(n529) );
  mx02d1 U828 ( .I0(num_pixels_cfg[4]), .I1(n610), .S(n885), .Z(n528) );
  aor22d1 U829 ( .A1(n774), .A2(\u_ctrl/write_cnt [4]), .B1(n777), .B2(n817), 
        .Z(n459) );
  mx02d1 U830 ( .I0(num_pixels_cfg[1]), .I1(n604), .S(n885), .Z(n531) );
  inv0d0 U831 ( .I(\u_ctrl/write_cnt [1]), .ZN(n818) );
  xn02d1 U832 ( .A1(n818), .A2(\u_ctrl/write_cnt [0]), .ZN(n819) );
  aor22d1 U833 ( .A1(n774), .A2(\u_ctrl/write_cnt [1]), .B1(n777), .B2(n819), 
        .Z(n499) );
  mx02d1 U834 ( .I0(num_pixels_cfg[0]), .I1(n602), .S(n885), .Z(n532) );
  mx02d1 U835 ( .I0(n777), .I1(n774), .S(\u_ctrl/write_cnt [0]), .Z(n462) );
  inv0d0 U836 ( .I(\u_ctrl/write_cnt [2]), .ZN(n820) );
  xn02d1 U837 ( .A1(n821), .A2(n820), .ZN(n822) );
  aor22d1 U838 ( .A1(n774), .A2(\u_ctrl/write_cnt [2]), .B1(n777), .B2(n822), 
        .Z(n461) );
  mx02d1 U839 ( .I0(num_pixels_cfg[2]), .I1(n606), .S(n885), .Z(n530) );
  inv0d0 U840 ( .I(n825), .ZN(n824) );
  oai21d1 U841 ( .B1(n824), .B2(n823), .A(n899), .ZN(n498) );
  xr02d1 U842 ( .A1(\u_ctrl/state [0]), .A2(n825), .Z(n826) );
  ah01d1 U843 ( .A(n828), .B(\u_ctrl/write_cnt [14]), .CO(n829), .S(n791) );
  xr02d1 U844 ( .A1(n829), .A2(\u_ctrl/write_cnt [15]), .Z(n830) );
  aor22d1 U845 ( .A1(n830), .A2(n777), .B1(\u_ctrl/write_cnt [15]), .B2(n774), 
        .Z(n448) );
  inv0d0 U846 ( .I(\u_ctrl/write_cnt [9]), .ZN(n832) );
  xr02d1 U847 ( .A1(n833), .A2(n832), .Z(n834) );
  aor22d1 U848 ( .A1(n774), .A2(\u_ctrl/write_cnt [9]), .B1(n777), .B2(n834), 
        .Z(n454) );
  inv0d0 U849 ( .I(s_axi_rvalid), .ZN(n844) );
  buffd3 U850 ( .I(n836), .Z(n979) );
  inv0d0 U851 ( .I(n637), .ZN(n905) );
  nd03d1 U852 ( .A1(n639), .A2(n642), .A3(n637), .ZN(n837) );
  buffd3 U853 ( .I(n837), .Z(n987) );
  aoi22d1 U854 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [1]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [1]), .ZN(n841) );
  or02d1 U855 ( .A1(n915), .A2(n979), .Z(n839) );
  aoi21d1 U856 ( .B1(s_axi_rdata[1]), .B2(n635), .A(n982), .ZN(n840) );
  oai211d1 U857 ( .C1(n993), .C2(n842), .A(n841), .B(n840), .ZN(n493) );
  inv0d0 U858 ( .I(n600), .ZN(n843) );
  nr02d0 U859 ( .A1(s_axi_arready), .A2(n843), .ZN(\u_axi_slave/N45 ) );
  oai21d1 U860 ( .B1(s_axi_rready), .B2(n844), .A(n635), .ZN(n597) );
  inv0d2 U861 ( .I(n636), .ZN(n851) );
  aoim22d1 U862 ( .A1(n847), .A2(n855), .B1(\u_axi_slave/reg_ctrl [0]), .B2(
        n851), .Z(n596) );
  inv0d2 U863 ( .I(n636), .ZN(n848) );
  aoim22d1 U864 ( .A1(n848), .A2(n894), .B1(\u_axi_slave/reg_ctrl [29]), .B2(
        n851), .Z(n593) );
  buffd1 U865 ( .I(n636), .Z(n846) );
  inv0d2 U866 ( .I(n846), .ZN(n852) );
  aoim22d1 U867 ( .A1(n848), .A2(n870), .B1(\u_axi_slave/reg_ctrl [14]), .B2(
        n847), .Z(n578) );
  inv0d2 U868 ( .I(n853), .ZN(n850) );
  aoim22d1 U869 ( .A1(n850), .A2(n868), .B1(\u_axi_slave/reg_ctrl [12]), .B2(
        n849), .Z(n576) );
  aoim22d1 U870 ( .A1(n850), .A2(n867), .B1(\u_axi_slave/reg_ctrl [11]), .B2(
        n849), .Z(n575) );
  aoim22d1 U871 ( .A1(n850), .A2(n866), .B1(\u_axi_slave/reg_ctrl [10]), .B2(
        n849), .Z(n574) );
  aoim22d1 U872 ( .A1(n850), .A2(n865), .B1(\u_axi_slave/reg_ctrl [9]), .B2(
        n849), .Z(n573) );
  aoim22d1 U873 ( .A1(n850), .A2(n864), .B1(\u_axi_slave/reg_ctrl [8]), .B2(
        n849), .Z(n572) );
  aoim22d1 U874 ( .A1(n850), .A2(n863), .B1(\u_axi_slave/reg_ctrl [7]), .B2(
        n851), .Z(n571) );
  aoim22d1 U875 ( .A1(n850), .A2(n862), .B1(\u_axi_slave/reg_ctrl [6]), .B2(
        n851), .Z(n570) );
  aoim22d1 U876 ( .A1(n850), .A2(n861), .B1(\u_axi_slave/reg_ctrl [5]), .B2(
        n851), .Z(n569) );
  aoim22d1 U877 ( .A1(n850), .A2(n860), .B1(\u_axi_slave/reg_ctrl [4]), .B2(
        n851), .Z(n568) );
  aoim22d1 U878 ( .A1(n850), .A2(n859), .B1(\u_axi_slave/reg_ctrl [3]), .B2(
        n851), .Z(n567) );
  aoim22d1 U879 ( .A1(n852), .A2(n857), .B1(\u_axi_slave/reg_ctrl [2]), .B2(
        n851), .Z(n566) );
  aor21d1 U880 ( .B1(\u_axi_slave/reg_ctrl [1]), .B2(n853), .A(
        \u_axi_slave/N40 ), .Z(n565) );
  nd12d4 U881 ( .A1(n854), .A2(n638), .ZN(n874) );
  inv0d0 U882 ( .I(quant_mode_cfg), .ZN(n902) );
  buffd3 U883 ( .I(n858), .Z(n877) );
  buffd3 U884 ( .I(n858), .Z(n876) );
  aoim22d1 U885 ( .A1(n877), .A2(n857), .B1(\u_axi_slave/reg_quant [2]), .B2(
        n876), .Z(n562) );
  buffd3 U886 ( .I(n858), .Z(n875) );
  aoim22d1 U887 ( .A1(n858), .A2(n859), .B1(\u_axi_slave/reg_quant [3]), .B2(
        n875), .Z(n561) );
  aoim22d1 U888 ( .A1(n877), .A2(n860), .B1(\u_axi_slave/reg_quant [4]), .B2(
        n876), .Z(n560) );
  aoim22d1 U889 ( .A1(n877), .A2(n861), .B1(\u_axi_slave/reg_quant [5]), .B2(
        n858), .Z(n559) );
  aoim22d1 U890 ( .A1(n877), .A2(n862), .B1(\u_axi_slave/reg_quant [6]), .B2(
        n875), .Z(n558) );
  aoim22d1 U891 ( .A1(n877), .A2(n863), .B1(\u_axi_slave/reg_quant [7]), .B2(
        n875), .Z(n557) );
  aoim22d1 U892 ( .A1(n877), .A2(n864), .B1(\u_axi_slave/reg_quant [8]), .B2(
        n875), .Z(n556) );
  aoim22d1 U893 ( .A1(n877), .A2(n865), .B1(\u_axi_slave/reg_quant [9]), .B2(
        n876), .Z(n555) );
  aoim22d1 U894 ( .A1(n877), .A2(n866), .B1(\u_axi_slave/reg_quant [10]), .B2(
        n876), .Z(n554) );
  buffd3 U895 ( .I(n858), .Z(n873) );
  aoim22d1 U896 ( .A1(n873), .A2(n867), .B1(\u_axi_slave/reg_quant [11]), .B2(
        n875), .Z(n553) );
  aoim22d1 U897 ( .A1(n873), .A2(n868), .B1(\u_axi_slave/reg_quant [12]), .B2(
        n875), .Z(n552) );
  aoim22d1 U898 ( .A1(n873), .A2(n869), .B1(\u_axi_slave/reg_quant [13]), .B2(
        n876), .Z(n551) );
  aoim22d1 U899 ( .A1(n873), .A2(n870), .B1(\u_axi_slave/reg_quant [14]), .B2(
        n875), .Z(n550) );
  aoim22d1 U900 ( .A1(n873), .A2(n871), .B1(\u_axi_slave/reg_quant [15]), .B2(
        n875), .Z(n549) );
  inv0d0 U901 ( .I(\u_axi_slave/reg_quant [16]), .ZN(n948) );
  inv0d0 U902 ( .I(\u_axi_slave/reg_quant [18]), .ZN(n952) );
  inv0d0 U903 ( .I(\u_axi_slave/reg_quant [19]), .ZN(n955) );
  aoim22d1 U904 ( .A1(n873), .A2(n884), .B1(\u_axi_slave/reg_quant [20]), .B2(
        n876), .Z(n544) );
  inv0d0 U905 ( .I(\u_axi_slave/reg_quant [21]), .ZN(n959) );
  aoim22d1 U906 ( .A1(n873), .A2(n887), .B1(\u_axi_slave/reg_quant [22]), .B2(
        n876), .Z(n542) );
  inv0d0 U907 ( .I(\u_axi_slave/reg_quant [23]), .ZN(n963) );
  aoim22d1 U908 ( .A1(n873), .A2(n889), .B1(\u_axi_slave/reg_quant [24]), .B2(
        n876), .Z(n540) );
  inv0d0 U909 ( .I(\u_axi_slave/reg_quant [25]), .ZN(n967) );
  inv0d0 U910 ( .I(\u_axi_slave/reg_quant [26]), .ZN(n971) );
  inv0d0 U911 ( .I(\u_axi_slave/reg_quant [27]), .ZN(n974) );
  inv0d0 U912 ( .I(\u_axi_slave/reg_quant [28]), .ZN(n978) );
  aoim22d1 U913 ( .A1(n873), .A2(n894), .B1(\u_axi_slave/reg_quant [29]), .B2(
        n876), .Z(n535) );
  inv0d0 U914 ( .I(\u_axi_slave/reg_quant [30]), .ZN(n986) );
  aoim22d1 U915 ( .A1(n877), .A2(n897), .B1(\u_axi_slave/reg_quant [31]), .B2(
        n876), .Z(n533) );
  buffd1 U916 ( .I(n881), .Z(n896) );
  aoim22d1 U917 ( .A1(n807), .A2(n878), .B1(\u_axi_slave/reg_pixel_cnt [16]), 
        .B2(n882), .Z(n516) );
  aoim22d1 U918 ( .A1(n882), .A2(n888), .B1(\u_axi_slave/reg_pixel_cnt [23]), 
        .B2(n882), .Z(n509) );
  aoim22d1 U919 ( .A1(n807), .A2(n891), .B1(\u_axi_slave/reg_pixel_cnt [26]), 
        .B2(n882), .Z(n506) );
  aoim22d1 U920 ( .A1(n882), .A2(n892), .B1(\u_axi_slave/reg_pixel_cnt [27]), 
        .B2(n882), .Z(n505) );
  aoim22d1 U921 ( .A1(n807), .A2(n893), .B1(\u_axi_slave/reg_pixel_cnt [28]), 
        .B2(n882), .Z(n504) );
  aoim22d1 U922 ( .A1(n882), .A2(n895), .B1(\u_axi_slave/reg_pixel_cnt [30]), 
        .B2(n807), .Z(n502) );
  inv0d0 U923 ( .I(\u_axi_slave/reg_pixel_cnt [31]), .ZN(n992) );
  inv0d0 U924 ( .I(done_signal), .ZN(n901) );
  inv0d0 U925 ( .I(n898), .ZN(n900) );
  oai22d1 U926 ( .A1(n903), .A2(n993), .B1(n987), .B2(n902), .ZN(n904) );
  nd04d0 U927 ( .A1(n642), .A2(n639), .A3(\u_axi_slave/reg_status[0] ), .A4(
        n905), .ZN(n906) );
  oaim211d1 U928 ( .C1(\u_axi_slave/reg_ctrl [0]), .C2(n914), .A(n907), .B(
        n906), .ZN(n494) );
  aoi22d1 U929 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [2]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [2]), .ZN(n908) );
  oai211d1 U930 ( .C1(n910), .C2(n993), .A(n909), .B(n908), .ZN(n492) );
  aoi22d1 U931 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [3]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [3]), .ZN(n911) );
  oai211d1 U932 ( .C1(n913), .C2(n993), .A(n912), .B(n911), .ZN(n491) );
  buffd3 U933 ( .I(n975), .Z(n983) );
  buffd3 U934 ( .I(n914), .Z(n968) );
  aoi222d1 U935 ( .A1(num_pixels_cfg[4]), .A2(n983), .B1(n968), .B2(
        \u_axi_slave/reg_ctrl [4]), .C1(n838), .C2(\u_axi_slave/reg_quant [4]), 
        .ZN(n916) );
  oaim22d1 U936 ( .A1(n916), .A2(n980), .B1(n979), .B2(s_axi_rdata[4]), .ZN(
        n490) );
  aoi22d1 U937 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [5]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [5]), .ZN(n917) );
  oai211d1 U938 ( .C1(n919), .C2(n993), .A(n918), .B(n917), .ZN(n489) );
  aoi22d1 U939 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [6]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [6]), .ZN(n920) );
  oai211d1 U940 ( .C1(n922), .C2(n993), .A(n921), .B(n920), .ZN(n488) );
  aoi21d1 U941 ( .B1(s_axi_rdata[7]), .B2(n836), .A(n641), .ZN(n924) );
  aoi22d1 U942 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [7]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [7]), .ZN(n923) );
  oai211d1 U943 ( .C1(n925), .C2(n993), .A(n924), .B(n923), .ZN(n487) );
  aoi222d1 U944 ( .A1(num_pixels_cfg[8]), .A2(n983), .B1(n914), .B2(
        \u_axi_slave/reg_ctrl [8]), .C1(n838), .C2(\u_axi_slave/reg_quant [8]), 
        .ZN(n926) );
  oaim22d1 U945 ( .A1(n926), .A2(n980), .B1(n635), .B2(s_axi_rdata[8]), .ZN(
        n486) );
  aoi21d1 U946 ( .B1(s_axi_rdata[9]), .B2(n836), .A(n641), .ZN(n928) );
  aoi22d1 U947 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [9]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [9]), .ZN(n927) );
  oai211d1 U948 ( .C1(n929), .C2(n993), .A(n928), .B(n927), .ZN(n485) );
  inv0d0 U949 ( .I(num_pixels_cfg[10]), .ZN(n932) );
  aoi21d1 U950 ( .B1(s_axi_rdata[10]), .B2(n836), .A(n641), .ZN(n931) );
  aoi22d1 U951 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [10]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [10]), .ZN(n930) );
  oai211d1 U952 ( .C1(n932), .C2(n993), .A(n931), .B(n930), .ZN(n484) );
  inv0d0 U953 ( .I(num_pixels_cfg[11]), .ZN(n935) );
  aoi21d1 U954 ( .B1(s_axi_rdata[11]), .B2(n836), .A(n641), .ZN(n934) );
  aoi22d1 U955 ( .A1(n914), .A2(\u_axi_slave/reg_ctrl [11]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [11]), .ZN(n933) );
  oai211d1 U956 ( .C1(n935), .C2(n993), .A(n934), .B(n933), .ZN(n483) );
  aoi21d1 U957 ( .B1(s_axi_rdata[12]), .B2(n836), .A(n641), .ZN(n937) );
  aoi22d1 U958 ( .A1(n914), .A2(\u_axi_slave/reg_ctrl [12]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [12]), .ZN(n936) );
  oai211d1 U959 ( .C1(n938), .C2(n993), .A(n937), .B(n936), .ZN(n482) );
  aoi21d1 U960 ( .B1(s_axi_rdata[13]), .B2(n836), .A(n641), .ZN(n940) );
  aoi22d1 U961 ( .A1(n914), .A2(\u_axi_slave/reg_ctrl [13]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [13]), .ZN(n939) );
  oai211d1 U962 ( .C1(n941), .C2(n993), .A(n940), .B(n939), .ZN(n481) );
  aoi222d1 U963 ( .A1(num_pixels_cfg[14]), .A2(n983), .B1(n968), .B2(
        \u_axi_slave/reg_ctrl [14]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [14]), .ZN(n942) );
  oaim22d1 U964 ( .A1(n942), .A2(n980), .B1(n635), .B2(s_axi_rdata[14]), .ZN(
        n480) );
  aoi21d1 U965 ( .B1(s_axi_rdata[15]), .B2(n979), .A(n641), .ZN(n944) );
  aoi22d1 U966 ( .A1(n914), .A2(\u_axi_slave/reg_ctrl [15]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [15]), .ZN(n943) );
  oai211d1 U967 ( .C1(n945), .C2(n993), .A(n944), .B(n943), .ZN(n479) );
  aoi21d1 U968 ( .B1(s_axi_rdata[16]), .B2(n979), .A(n641), .ZN(n947) );
  aoi22d1 U969 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [16]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [16]), .ZN(n946) );
  oai211d1 U970 ( .C1(n987), .C2(n948), .A(n947), .B(n946), .ZN(n478) );
  aoi222d1 U971 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [17]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [17]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [17]), .ZN(n949) );
  oaim22d1 U972 ( .A1(n949), .A2(n980), .B1(n635), .B2(s_axi_rdata[17]), .ZN(
        n477) );
  aoi21d1 U973 ( .B1(s_axi_rdata[18]), .B2(n635), .A(n641), .ZN(n951) );
  aoi22d1 U974 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [18]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [18]), .ZN(n950) );
  oai211d1 U975 ( .C1(n987), .C2(n952), .A(n951), .B(n950), .ZN(n476) );
  aoi21d1 U976 ( .B1(s_axi_rdata[19]), .B2(n635), .A(n982), .ZN(n954) );
  aoi22d1 U977 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [19]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [19]), .ZN(n953) );
  oai211d1 U978 ( .C1(n987), .C2(n955), .A(n954), .B(n953), .ZN(n475) );
  aoi222d1 U979 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [20]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [20]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [20]), .ZN(n956) );
  oaim22d1 U980 ( .A1(n956), .A2(n980), .B1(n635), .B2(s_axi_rdata[20]), .ZN(
        n474) );
  aoi21d1 U981 ( .B1(s_axi_rdata[21]), .B2(n635), .A(n982), .ZN(n958) );
  aoi22d1 U982 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [21]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [21]), .ZN(n957) );
  oai211d1 U983 ( .C1(n987), .C2(n959), .A(n958), .B(n957), .ZN(n473) );
  aoi222d1 U984 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [22]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [22]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [22]), .ZN(n960) );
  oaim22d1 U985 ( .A1(n960), .A2(n980), .B1(n635), .B2(s_axi_rdata[22]), .ZN(
        n472) );
  aoi21d1 U986 ( .B1(s_axi_rdata[23]), .B2(n635), .A(n982), .ZN(n962) );
  aoi22d1 U987 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [23]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [23]), .ZN(n961) );
  oai211d1 U988 ( .C1(n987), .C2(n963), .A(n962), .B(n961), .ZN(n471) );
  aoi222d1 U989 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [24]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [24]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [24]), .ZN(n964) );
  oaim22d1 U990 ( .A1(n964), .A2(n980), .B1(n979), .B2(s_axi_rdata[24]), .ZN(
        n470) );
  aoi21d1 U991 ( .B1(s_axi_rdata[25]), .B2(n635), .A(n982), .ZN(n966) );
  aoi22d1 U992 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [25]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [25]), .ZN(n965) );
  oai211d1 U993 ( .C1(n987), .C2(n967), .A(n966), .B(n965), .ZN(n469) );
  aoi21d1 U994 ( .B1(s_axi_rdata[26]), .B2(n635), .A(n982), .ZN(n970) );
  aoi22d1 U995 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [26]), .B1(n968), 
        .B2(\u_axi_slave/reg_ctrl [26]), .ZN(n969) );
  oai211d1 U996 ( .C1(n987), .C2(n971), .A(n970), .B(n969), .ZN(n468) );
  aoi21d1 U997 ( .B1(s_axi_rdata[27]), .B2(n635), .A(n982), .ZN(n973) );
  aoi22d1 U998 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [27]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [27]), .ZN(n972) );
  oai211d1 U999 ( .C1(n987), .C2(n974), .A(n973), .B(n972), .ZN(n467) );
  aoi21d1 U1000 ( .B1(s_axi_rdata[28]), .B2(n635), .A(n982), .ZN(n977) );
  aoi22d1 U1001 ( .A1(n975), .A2(\u_axi_slave/reg_pixel_cnt [28]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [28]), .ZN(n976) );
  oai211d1 U1002 ( .C1(n987), .C2(n978), .A(n977), .B(n976), .ZN(n466) );
  aoi222d1 U1003 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [29]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [29]), .C1(n838), .C2(
        \u_axi_slave/reg_quant [29]), .ZN(n981) );
  oaim22d1 U1004 ( .A1(n981), .A2(n980), .B1(n979), .B2(s_axi_rdata[29]), .ZN(
        n465) );
  aoi21d1 U1005 ( .B1(s_axi_rdata[30]), .B2(n635), .A(n982), .ZN(n985) );
  aoi22d1 U1006 ( .A1(n983), .A2(\u_axi_slave/reg_pixel_cnt [30]), .B1(n914), 
        .B2(\u_axi_slave/reg_ctrl [30]), .ZN(n984) );
  oai211d1 U1007 ( .C1(n987), .C2(n986), .A(n985), .B(n984), .ZN(n464) );
  aoi21d1 U1008 ( .B1(s_axi_rdata[31]), .B2(n979), .A(n641), .ZN(n991) );
  aoi22d1 U1009 ( .A1(n989), .A2(\u_axi_slave/reg_ctrl [31]), .B1(n838), .B2(
        \u_axi_slave/reg_quant [31]), .ZN(n990) );
  oai211d1 U1010 ( .C1(n993), .C2(n992), .A(n991), .B(n990), .ZN(n463) );
endmodule

