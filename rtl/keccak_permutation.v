module keccak_permutation#(
    parameter ROUND_CONSTANT0 = 7'b0000001,
    parameter ROUND_CONSTANT1 = 7'b0011010     
)(
    input clk,
    input rstn,
    input en,
	//input [7 : 0]ROUND_CONSTANT0,ROUND_CONSTANT1,
    input [1599 : 0] s_in,
    output reg  [1599 : 0] s_out,
    output reg rdy
);
//parameter ROUND_CONSTANT0 = 64'h0000000000000001;
//parameter ROUND_CONSTANT1 = 64'h0000000000008082;
//parameter ROUND_CONSTANT0 = 7'b0000001;
//parameter ROUND_CONSTANT1 = 7'b0011010;

wire [63 : 0] Aba0, Abe0, Abi0, Abo0, Abu0;
wire [63 : 0] Aga0, Age0, Agi0, Ago0, Agu0;
wire [63 : 0] Aka0, Ake0, Aki0, Ako0, Aku0;
wire [63 : 0] Ama0, Ame0, Ami0, Amo0, Amu0;
wire [63 : 0] Asa0, Ase0, Asi0, Aso0, Asu0;
wire [63 : 0] BCa0, BCe0, BCi0, BCo0, BCu0;
wire [63 : 0]  Da0,  De0,  Di0,  Do0,  Du0;
wire [63 : 0] Eba0, Ebe0, Ebi0, Ebo0, Ebu0;
wire [63 : 0] Ega0, Ege0, Egi0, Ego0, Egu0;
wire [63 : 0] Eka0, Eke0, Eki0, Eko0, Eku0;
wire [63 : 0] Ema0, Eme0, Emi0, Emo0, Emu0;
wire [63 : 0] Esa0, Ese0, Esi0, Eso0, Esu0;

wire [63 : 0] Aba1, Abe1, Abi1, Abo1, Abu1;
wire [63 : 0] Aga1, Age1, Agi1, Ago1, Agu1;
wire [63 : 0] Aka1, Ake1, Aki1, Ako1, Aku1;
wire [63 : 0] Ama1, Ame1, Ami1, Amo1, Amu1;
wire [63 : 0] Asa1, Ase1, Asi1, Aso1, Asu1;
wire [63 : 0] BCa1, BCe1, BCi1, BCo1, BCu1;
wire [63 : 0]  Da1,  De1,  Di1,  Do1,  Du1;
wire [63 : 0] Eba1, Ebe1, Ebi1, Ebo1, Ebu1;
wire [63 : 0] Ega1, Ege1, Egi1, Ego1, Egu1;
wire [63 : 0] Eka1, Eke1, Eki1, Eko1, Eku1;
wire [63 : 0] Ema1, Eme1, Emi1, Emo1, Emu1;
wire [63 : 0] Esa1, Ese1, Esi1, Eso1, Esu1;

wire [63 : 0] Aba2, Abe2, Abi2, Abo2, Abu2;
wire [63 : 0] Aga2, Age2, Agi2, Ago2, Agu2;
wire [63 : 0] Aka2, Ake2, Aki2, Ako2, Aku2;
wire [63 : 0] Ama2, Ame2, Ami2, Amo2, Amu2;
wire [63 : 0] Asa2, Ase2, Asi2, Aso2, Asu2;
wire [63 : 0] BCa2, BCe2, BCi2, BCo2, BCu2;
wire [63 : 0]  Da2,  De2,  Di2,  Do2,  Du2;
wire [63 : 0] Eba2, Ebe2, Ebi2, Ebo2, Ebu2;
wire [63 : 0] Ega2, Ege2, Egi2, Ego2, Egu2;
wire [63 : 0] Eka2, Eke2, Eki2, Eko2, Eku2;
wire [63 : 0] Ema2, Eme2, Emi2, Emo2, Emu2;
wire [63 : 0] Esa2, Ese2, Esi2, Eso2, Esu2;

wire [63 : 0] Aba3;
wire [63 : 0] BCa3, BCe3, BCi3, BCo3, BCu3;
wire [63 : 0] Eba3;

wire [63 : 0] BCa4, BCe4, BCi4, BCo4, BCu4;
wire [63 : 0] BCa5, BCe5, BCi5, BCo5, BCu5;
wire [63 : 0] BCa6, BCe6, BCi6, BCo6, BCu6;
wire [63 : 0] BCa7, BCe7, BCi7, BCo7, BCu7;
wire [63 : 0] BCa8, BCe8, BCi8, BCo8, BCu8;
wire [63 : 0] BCa9, BCe9, BCi9, BCo9, BCu9;
wire [63 : 0] BCa10, BCe10, BCi10, BCo10, BCu10;
wire [63 : 0] BCa11, BCe11, BCi11, BCo11, BCu11;


// assign {Aba0, Abe0, Abi0, Abo0, Abu0,
// Aga0, Age0, Agi0, Ago0, Agu0,
// Aka0, Ake0, Aki0, Ako0, Aku0,
// Ama0, Ame0, Ami0, Amo0, Amu0,
// Asa0, Ase0, Asi0, Aso0, Asu0} = s_in;


assign Aba0 = {s_in[1543:1536], s_in[1551:1544], s_in[1559:1552], s_in[1567:1560], s_in[1575:1568], s_in[1583:1576], s_in[1591:1584], s_in[1599:1592]};
assign Abe0 = {s_in[1479:1472], s_in[1487:1480], s_in[1495:1488], s_in[1503:1496], s_in[1511:1504], s_in[1519:1512], s_in[1527:1520], s_in[1535:1528]};
assign Abi0 = {s_in[1415:1408], s_in[1423:1416], s_in[1431:1424], s_in[1439:1432], s_in[1447:1440], s_in[1455:1448], s_in[1463:1456], s_in[1471:1464]};
assign Abo0 = {s_in[1351:1344], s_in[1359:1352], s_in[1367:1360], s_in[1375:1368], s_in[1383:1376], s_in[1391:1384], s_in[1399:1392], s_in[1407:1400]};
assign Abu0 = {s_in[1287:1280], s_in[1295:1288], s_in[1303:1296], s_in[1311:1304], s_in[1319:1312], s_in[1327:1320], s_in[1335:1328], s_in[1343:1336]};
assign Aga0 = {s_in[1223:1216], s_in[1231:1224], s_in[1239:1232], s_in[1247:1240], s_in[1255:1248], s_in[1263:1256], s_in[1271:1264], s_in[1279:1272]};
assign Age0 = {s_in[1159:1152], s_in[1167:1160], s_in[1175:1168], s_in[1183:1176], s_in[1191:1184], s_in[1199:1192], s_in[1207:1200], s_in[1215:1208]};
assign Agi0 = {s_in[1095:1088], s_in[1103:1096], s_in[1111:1104], s_in[1119:1112], s_in[1127:1120], s_in[1135:1128], s_in[1143:1136], s_in[1151:1144]};
assign Ago0 = {s_in[1031:1024], s_in[1039:1032], s_in[1047:1040], s_in[1055:1048], s_in[1063:1056], s_in[1071:1064], s_in[1079:1072], s_in[1087:1080]};
assign Agu0 = {s_in[967:960]  , s_in[975:968]  , s_in[983:976]  , s_in[991:984]  , s_in[999:992]  , s_in[1007:1000], s_in[1015:1008], s_in[1023:1016]};
assign Aka0 = {s_in[903:896]  , s_in[911:904]  , s_in[919:912]  , s_in[927:920]  , s_in[935:928]  , s_in[943:936]  , s_in[951:944]  , s_in[959:952]  };
assign Ake0 = {s_in[839:832]  , s_in[847:840]  , s_in[855:848]  , s_in[863:856]  , s_in[871:864]  , s_in[879:872]  , s_in[887:880]  , s_in[895:888]  };
assign Aki0 = {s_in[775:768]  , s_in[783:776]  , s_in[791:784]  , s_in[799:792]  , s_in[807:800]  , s_in[815:808]  , s_in[823:816]  , s_in[831:824]  };
assign Ako0 = {s_in[711:704]  , s_in[719:712]  , s_in[727:720]  , s_in[735:728]  , s_in[743:736]  , s_in[751:744]  , s_in[759:752]  , s_in[767:760]  };
assign Aku0 = {s_in[647:640]  , s_in[655:648]  , s_in[663:656]  , s_in[671:664]  , s_in[679:672]  , s_in[687:680]  , s_in[695:688]  , s_in[703:696]  };
assign Ama0 = {s_in[583:576]  , s_in[591:584]  , s_in[599:592]  , s_in[607:600]  , s_in[615:608]  , s_in[623:616]  , s_in[631:624]  , s_in[639:632]  };
assign Ame0 = {s_in[519:512]  , s_in[527:520]  , s_in[535:528]  , s_in[543:536]  , s_in[551:544]  , s_in[559:552]  , s_in[567:560]  , s_in[575:568]  };
assign Ami0 = {s_in[455:448]  , s_in[463:456]  , s_in[471:464]  , s_in[479:472]  , s_in[487:480]  , s_in[495:488]  , s_in[503:496]  , s_in[511:504]  };
assign Amo0 = {s_in[391:384]  , s_in[399:392]  , s_in[407:400]  , s_in[415:408]  , s_in[423:416]  , s_in[431:424]  , s_in[439:432]  , s_in[447:440]  };
assign Amu0 = {s_in[327:320]  , s_in[335:328]  , s_in[343:336]  , s_in[351:344]  , s_in[359:352]  , s_in[367:360]  , s_in[375:368]  , s_in[383:376]  };
assign Asa0 = {s_in[263:256]  , s_in[271:264]  , s_in[279:272]  , s_in[287:280]  , s_in[295:288]  , s_in[303:296]  , s_in[311:304]  , s_in[319:312]  };
assign Ase0 = {s_in[199:192]  , s_in[207:200]  , s_in[215:208]  , s_in[223:216]  , s_in[231:224]  , s_in[239:232]  , s_in[247:240]  , s_in[255:248]  };
assign Asi0 = {s_in[135:128]  , s_in[143:136]  , s_in[151:144]  , s_in[159:152]  , s_in[167:160]  , s_in[175:168]  , s_in[183:176]  , s_in[191:184]  };
assign Aso0 = {s_in[71:64]    , s_in[79:72]    , s_in[87:80]    , s_in[95:88]    , s_in[103:96]   , s_in[111:104]  , s_in[119:112]  , s_in[127:120]  };
assign Asu0 = {s_in[7:0]      , s_in[15:8]     , s_in[23:16]    , s_in[31:24]    , s_in[39:32]    , s_in[47:40]    , s_in[55:48]    , s_in[63:56]    };


/*
assign {Aba0,Aga0,Aka0,Ama0,Asa0,
        Abe0,Age0,Ake0,Ame0,Ase0,
        Abi0,Agi0,Aki0,Ami0,Asi0,
        Abo0,Ago0,Ako0,Amo0,Aso0,
        Abu0,Agu0,Aku0,Amu0,Asu0} = s_in;	
*/
assign BCa0 = (Aba0 ^ Aga0) ^ (Aka0 ^ Ama0) ^ Asa0;
assign BCe0 = (Abe0 ^ Age0) ^ (Ake0 ^ Ame0) ^ Ase0;
assign BCi0 = (Abi0 ^ Agi0) ^ (Aki0 ^ Ami0) ^ Asi0;
assign BCo0 = (Abo0 ^ Ago0) ^ (Ako0 ^ Amo0) ^ Aso0;
assign BCu0 = (Abu0 ^ Agu0) ^ (Aku0 ^ Amu0) ^ Asu0;
// wire [63 : 0] t0,t1,t2,t3,t4;
// assign t0 = (BCe0 << 1) ^ (BCe0  >> 63);
/*
assign Da0 = BCu0 ^ ROL(BCe0, 1);
assign De0 = BCa0 ^ ROL(BCi0, 1);
assign Di0 = BCe0 ^ ROL(BCo0, 1);
assign Do0 = BCi0 ^ ROL(BCu0, 1);
assign Du0 = BCo0 ^ ROL(BCa0, 1);
*/
assign Da0 = BCu0 ^ {BCe0[62 : 0], BCe0[63]};
assign De0 = BCa0 ^ {BCi0[62 : 0], BCi0[63]};
assign Di0 = BCe0 ^ {BCo0[62 : 0], BCo0[63]};
assign Do0 = BCi0 ^ {BCu0[62 : 0], BCu0[63]};
assign Du0 = BCo0 ^ {BCa0[62 : 0], BCa0[63]};


assign Aba1 =Aba0 ^ Da0;
assign BCa1 = Aba1;
assign Age1 = Age0 ^ De0;
//assign BCe1 = ROL(Age1, 44);
assign BCe1 = {Age1[19 : 0], Age1[63 -: 44]};
assign Aki1 = Aki0 ^ Di0;
//assign BCi1 = ROL(Aki1, 43);
assign BCi1 = {Aki1[20 : 0], Aki1[63 -: 43]};
assign Amo1 = Amo0 ^ Do0;
//assign BCo1 = ROL(Amo1, 21);
assign BCo1 ={Amo1[42 : 0], Amo1[63 -: 21]}; 
assign Asu1 = Asu0 ^ Du0;
//assign BCu1 = ROL(Asu1, 14);
assign BCu1 = {Asu1[49 : 0], Asu1[63 -: 14]};
assign Eba0 = BCa1 ^ ((~BCe1) & BCi1);
//assign Eba1 = Eba0 ^ ROUND_CONSTANT0;
assign Eba1 = {Eba0[63]^ROUND_CONSTANT0[6],Eba0[62 : 32], Eba0[31]^ROUND_CONSTANT0[5], Eba0[30:16], Eba0[15]^ROUND_CONSTANT0[4],Eba0[14:8],Eba0[7]^ROUND_CONSTANT0[3],Eba0[6:4],Eba0[3]^ROUND_CONSTANT0[2],Eba0[2],Eba0[1]^ROUND_CONSTANT0[1],Eba0[0]^ROUND_CONSTANT0[0]};
//assign Eba1 = Eba0 ^ rc0;
assign Ebe0 = BCe1 ^ ((~BCi1) & BCo1);
assign Ebi0 = BCi1 ^ ((~BCo1) & BCu1);
assign Ebo0 = BCo1 ^ ((~BCu1) & BCa1);
assign Ebu0 = BCu1 ^ ((~BCa1) & BCe1);

assign Abo1 = Abo0 ^ Do0;
//assign BCa2 = ROL(Abo1, 28);
assign BCa2 = {Abo1[63-28 : 0], Abo1[63 -: 28]};
assign Agu1 = Agu0 ^ Du0;
//assign BCe2 = ROL(Agu1, 20);
assign BCe2 = {Agu1[63-20 : 0], Agu1[63 -: 20]};
assign Aka1 = Aka0 ^ Da0;
//assign BCi2 = ROL(Aka1, 3);
assign BCi2 = {Aka1[63-3 : 0] , Aka1[63 -: 3]};
assign Ame1 = Ame0 ^ De0;
//assign BCo2 = ROL(Ame1, 45);
assign BCo2 = {Ame1[63-45 : 0], Ame1[63 -: 45]};
assign Asi1 = Asi0 ^ Di0;
//assign BCu2 = ROL(Asi1, 61);
assign BCu2 = {Asi1[63-61 : 0], Asi1[63 -: 61]};
assign Ega0 = BCa2 ^ ((~BCe2) & BCi2);
assign Ege0 = BCe2 ^ ((~BCi2) & BCo2);
assign Egi0 = BCi2 ^ ((~BCo2) & BCu2);
assign Ego0 = BCo2 ^ ((~BCu2) & BCa2);
assign Egu0 = BCu2 ^ ((~BCa2) & BCe2);

assign Abe1 = Abe0 ^ De0;
//assign BCa3 = ROL(Abe1, 1);
assign BCa3 = {Abe1[63-1 : 0], Abe1[63 -: 1]};
assign Agi1 = Agi0 ^ Di0;
//assign BCe3 = ROL(Agi1, 6);
assign BCe3 = {Agi1[63-6 : 0], Agi1[63 -: 6]};
assign Ako1 = Ako0 ^ Do0;
//assign BCi3 = ROL(Ako1, 25);
assign BCi3 = {Ako1[63-25 : 0], Ako1[63 -: 25]};
assign Amu1 = Amu0 ^ Du0;
//assign BCo3 = ROL(Amu1, 8);
assign BCo3 = {Amu1[63-8 : 0], Amu1[63 -: 8]};
assign Asa1 = Asa0 ^ Da0;
//assign BCu3 = ROL(Asa1, 18);
assign BCu3 = {Asa1[63-18 : 0], Asa1[63 -: 18]};
assign Eka0 = BCa3 ^ ((~BCe3) & BCi3);
assign Eke0 = BCe3 ^ ((~BCi3) & BCo3);
assign Eki0 = BCi3 ^ ((~BCo3) & BCu3);
assign Eko0 = BCo3 ^ ((~BCu3) & BCa3);
assign Eku0 = BCu3 ^ ((~BCa3) & BCe3);

assign Abu1 = Abu0 ^ Du0;
//assign BCa3 = ROL(Abu1, 27);
assign  BCa4 = {Abu1[63-27 : 0], Abu1[63 -: 27]};
assign Aga1 = Aga0 ^ Da0;
//assign BCe4 = ROL(Aga1, 36);
assign BCe4 = {Aga1[63-36 : 0], Aga1[63 -: 36]};
assign Ake1 = Ake0 ^ De0;
//assign BCi4 = ROL(Ake1, 10);
assign BCi4 = {Ake1[63-10 : 0], Ake1[63 -: 10]}; 
assign Ami1 = Ami0 ^ Di0;
//assign BCo4 = ROL(Ami1, 15);
assign BCo4 = {Ami1[63-15 : 0], Ami1[63 -: 15]};
assign Aso1 = Aso0 ^ Do0;
//assign BCu4 = ROL(Aso1, 56);
assign BCu4 = {Aso1[63-56 : 0], Aso1[63 -: 56]};
assign Ema0 = BCa4 ^ ((~BCe4) & BCi4);
assign Eme0 = BCe4 ^ ((~BCi4) & BCo4);
assign Emi0 = BCi4 ^ ((~BCo4) & BCu4);
assign Emo0 = BCo4 ^ ((~BCu4) & BCa4);
assign Emu0 = BCu4 ^ ((~BCa4) & BCe4);

assign Abi1 = Abi0 ^ Di0;
//assign BCa5 = ROL(Abi1, 62);
assign BCa5 = {Abi1[63-62 : 0], Abi1[63 -: 62]};
assign Ago1 = Ago0 ^ Do0;
//assign BCe5 = ROL(Ago1, 55);
assign BCe5 = {Ago1[63-55 : 0], Ago1[63 -: 55]};
assign Aku1 = Aku0 ^ Du0;
//assign BCi5 = ROL(Aku1, 39);
assign BCi5 = {Aku1[63-39 : 0], Aku1[63 -: 39]};
assign Ama1 = Ama0 ^ Da0;
//assign BCo5 = ROL(Ama1, 41);
assign BCo5 = {Ama1[63-41 : 0], Ama1[63 -: 41]};
assign Ase1 = Ase0 ^ De0;
//assign BCu5 = ROL(Ase1, 2);
assign BCu5 = {Ase1[63-2 : 0], Ase1[63 -: 2]};
assign Esa0 = BCa5 ^ ((~BCe5) & BCi5);
assign Ese0 = BCe5 ^ ((~BCi5) & BCo5);
assign Esi0 = BCi5 ^ ((~BCo5) & BCu5);
assign Eso0 = BCo5 ^ ((~BCu5) & BCa5);
assign Esu0 = BCu5 ^ ((~BCa5) & BCe5);



assign BCa6 = (Eba1 ^ Ega0) ^ (Eka0 ^ Ema0) ^ Esa0;
assign BCe6 = (Ebe0 ^ Ege0) ^ (Eke0 ^ Eme0) ^ Ese0;
assign BCi6 = (Ebi0 ^ Egi0) ^ (Eki0 ^ Emi0) ^ Esi0;
assign BCo6 = (Ebo0 ^ Ego0) ^ (Eko0 ^ Emo0) ^ Eso0;
assign BCu6 = (Ebu0 ^ Egu0) ^ (Eku0 ^ Emu0) ^ Esu0;

// assign Da1 = BCu6 ^ ROL(BCe6, 1);
// assign De1 = BCa6 ^ ROL(BCi6, 1);
// assign Di1 = BCe6 ^ ROL(BCo6, 1);
// assign Do1 = BCi6 ^ ROL(BCu6, 1);
// assign Du1 = BCo6 ^ ROL(BCa6, 1);

assign Da1 = BCu6 ^ {BCe6[63-1 : 0], BCe6[63 -: 1]};
assign De1 = BCa6 ^ {BCi6[63-1 : 0], BCi6[63 -: 1]};
assign Di1 = BCe6 ^ {BCo6[63-1 : 0], BCo6[63 -: 1]};
assign Do1 = BCi6 ^ {BCu6[63-1 : 0], BCu6[63 -: 1]};
assign Du1 = BCo6 ^ {BCa6[63-1 : 0], BCa6[63 -: 1]};

assign Eba2 = Eba1 ^ Da1;
assign BCa7 = Eba2;
assign Ege1 = Ege0 ^ De1;
//assign BCe7 = ROL(Ege1, 44);
assign BCe7 = {Ege1[19 : 0], Ege1[63 -: 44]};
assign Eki1 = Eki0 ^ Di1;
//assign BCi7 = ROL(Eki1, 43);
assign BCi7 = {Eki1[20 : 0], Eki1[63 -: 43]};
assign Emo1 = Emo0 ^ Do1;
//assign BCo7 = ROL(Emo1, 21);
assign BCo7 ={Emo1[42 : 0], Emo1[63 -: 21]}; 
assign Esu1 = Esu0 ^ Du1;
//assign BCu7 = ROL(Esu1, 14);
assign BCu7 = {Esu1[49 : 0], Esu1[63 -: 14]};
assign Aba2 = BCa7 ^ ((~BCe7) & BCi7);
//assign Aba3 = Aba2 ^ ROUND_CONSTANT1;
assign Aba3 = {Aba2[63]^ROUND_CONSTANT1[6],Aba2[62 : 32], Aba2[31]^ROUND_CONSTANT1[5], Aba2[30:16], Aba2[15]^ROUND_CONSTANT1[4],Aba2[14:8],Aba2[7]^ROUND_CONSTANT1[3],Aba2[6:4],Aba2[3]^ROUND_CONSTANT1[2],Aba2[2],Aba2[1]^ROUND_CONSTANT1[1],Aba2[0]^ROUND_CONSTANT1[0]};

//assign Aba3 = Aba2 ^ rc1;
assign Abe2 = BCe7 ^ ((~BCi7) & BCo7);
assign Abi2 = BCi7 ^ ((~BCo7) & BCu7);
assign Abo2 = BCo7 ^ ((~BCu7) & BCa7);
assign Abu2 = BCu7 ^ ((~BCa7) & BCe7);

assign Ebo1 = Ebo0 ^ Do1;
//assign BCa8 = ROL(Ebo1, 28);
assign BCa8 = {Ebo1[63-28 : 0], Ebo1[63 -: 28]};
assign Egu1 = Egu0 ^ Du1;
//assign BCe8 = ROL(Egu1, 20);
assign BCe8 = {Egu1[63-20 : 0], Egu1[63 -: 20]};
assign Eka1 = Eka0 ^ Da1;
//assign BCi8 = ROL(Eka1, 3);
assign BCi8 = {Eka1[63-3 : 0] , Eka1[63 -: 3]};
assign Eme1 = Eme0 ^ De1;
//assign BCo8 = ROL(Eme1, 45);
assign BCo8 = {Eme1[63-45 : 0], Eme1[63 -: 45]};
assign Esi1 = Esi0 ^ Di1;
//assign BCu8 = ROL(Esi1, 61);
assign BCu8 = {Esi1[63-61 : 0], Esi1[63 -: 61]};
assign Aga2 = BCa8 ^ ((~BCe8) & BCi8);
assign Age2 = BCe8 ^ ((~BCi8) & BCo8);
assign Agi2 = BCi8 ^ ((~BCo8) & BCu8);
assign Ago2 = BCo8 ^ ((~BCu8) & BCa8);
assign Agu2 = BCu8 ^ ((~BCa8) & BCe8);

assign Ebe1 = Ebe0 ^ De1;
//assign BCa9 = ROL(Ebe1, 1);
assign BCa9 = {Ebe1[63-1 : 0], Ebe1[63 -: 1]};
assign Egi1 = Egi0 ^ Di1;
//assign BCe9 = ROL(Egi1, 6);
assign BCe9 = {Egi1[63-6 : 0], Egi1[63 -: 6]};
assign Eko1 = Eko0 ^ Do1;
//assign BCi9 = ROL(Eko1, 25);
assign BCi9 = {Eko1[63-25 : 0], Eko1[63 -: 25]};
assign Emu1 = Emu0 ^ Du1;
//assign BCo9 = ROL(Emu1, 8);
assign BCo9 = {Emu1[63-8 : 0], Emu1[63 -: 8]};
assign Esa1 = Esa0 ^ Da1;
//assign BCu9 = ROL(Esa1, 18);
assign BCu9 = {Esa1[63-18 : 0], Esa1[63 -: 18]};
assign Aka2 = BCa9 ^ ((~BCe9) & BCi9);
assign Ake2 = BCe9 ^ ((~BCi9) & BCo9);
assign Aki2 = BCi9 ^ ((~BCo9) & BCu9);
assign Ako2 = BCo9 ^ ((~BCu9) & BCa9);
assign Aku2 = BCu9 ^ ((~BCa9) & BCe9);

assign Ebu1 = Ebu0 ^ Du1;
//assign BCa10 = ROL(Ebu1, 27);
assign  BCa10 = {Ebu1[63-27 : 0], Ebu1[63 -: 27]};
assign Ega1 = Ega0 ^ Da1;
//assign BCe10 = ROL(Ega1, 36);
assign BCe10 = {Ega1[63-36 : 0], Ega1[63 -: 36]};
assign Eke1 = Eke0 ^ De1;
//assign BCi10 = ROL(Eke1, 10);
assign BCi10 = {Eke1[63-10 : 0], Eke1[63 -: 10]}; 
assign Emi1 = Emi0 ^ Di1;
//assign BCo10 = ROL(Emi1, 15);
assign BCo10 = {Emi1[63-15 : 0], Emi1[63 -: 15]};
assign Eso1 = Eso0 ^ Do1;
//assign BCu10 = ROL(Eso1, 56);
assign BCu10 = {Eso1[63-56 : 0], Eso1[63 -: 56]};
assign Ama2 = BCa10 ^ ((~BCe10) & BCi10);
assign Ame2 = BCe10 ^ ((~BCi10) & BCo10);
assign Ami2 = BCi10 ^ ((~BCo10) & BCu10);
assign Amo2 = BCo10 ^ ((~BCu10) & BCa10);
assign Amu2 = BCu10 ^ ((~BCa10) & BCe10);

assign Ebi1 = Ebi0 ^ Di1;
//assign BCa11 = ROL(Ebi1, 62);
assign BCa11 = {Ebi1[63-62 : 0], Ebi1[63 -: 62]};
assign Ego1 = Ego0 ^ Do1;
//assign BCe11 = ROL(Ego1, 55);
assign BCe11 = {Ego1[63-55 : 0], Ego1[63 -: 55]};
assign Eku1 = Eku0 ^ Du1;
//assign BCi11 = ROL(Eku1, 39);
assign BCi11 = {Eku1[63-39 : 0], Eku1[63 -: 39]};
assign Ema1 = Ema0 ^ Da1;
//assign BCo11 = ROL(Ema1, 41);
assign BCo11 = {Ema1[63-41 : 0], Ema1[63 -: 41]};
assign Ese1 = Ese0 ^ De1;
//assign BCu11 = ROL(Ese1, 2);
assign BCu11 = {Ese1[63-2 : 0], Ese1[63 -: 2]};
assign Asa2 = BCa11 ^ ((~BCe11) & BCi11);
assign Ase2 = BCe11 ^ ((~BCi11) & BCo11);
assign Asi2 = BCi11 ^ ((~BCo11) & BCu11);
assign Aso2 = BCo11 ^ ((~BCu11) & BCa11);
assign Asu2 = BCu11 ^ ((~BCa11) & BCe11);

// wire [1599 : 0] s_out_tmp;
// assign s_out_tmp = {Aba3,Abe2,Abi2,Abo2,Abu2,
//                 Aga2,Age2,Agi2,Ago2,Agu2,
//                 Aka2,Ake2,Aki2,Ako2,Aku2,
//                 Ama2,Ame2,Ami2,Amo2,Amu2,
//                 Asa2,Ase2,Asi2,Aso2,Asu2
// };
wire [1599 : 0] A_out;
assign {A_out[1543:1536], A_out[1551:1544], A_out[1559:1552], A_out[1567:1560], A_out[1575:1568], A_out[1583:1576], A_out[1591:1584], A_out[1599:1592]} = Aba3;
assign {A_out[1479:1472], A_out[1487:1480], A_out[1495:1488], A_out[1503:1496], A_out[1511:1504], A_out[1519:1512], A_out[1527:1520], A_out[1535:1528]} = Abe2;
assign {A_out[1415:1408], A_out[1423:1416], A_out[1431:1424], A_out[1439:1432], A_out[1447:1440], A_out[1455:1448], A_out[1463:1456], A_out[1471:1464]} = Abi2;
assign {A_out[1351:1344], A_out[1359:1352], A_out[1367:1360], A_out[1375:1368], A_out[1383:1376], A_out[1391:1384], A_out[1399:1392], A_out[1407:1400]} = Abo2;
assign {A_out[1287:1280], A_out[1295:1288], A_out[1303:1296], A_out[1311:1304], A_out[1319:1312], A_out[1327:1320], A_out[1335:1328], A_out[1343:1336]} = Abu2;
assign {A_out[1223:1216], A_out[1231:1224], A_out[1239:1232], A_out[1247:1240], A_out[1255:1248], A_out[1263:1256], A_out[1271:1264], A_out[1279:1272]} = Aga2;
assign {A_out[1159:1152], A_out[1167:1160], A_out[1175:1168], A_out[1183:1176], A_out[1191:1184], A_out[1199:1192], A_out[1207:1200], A_out[1215:1208]} = Age2;
assign {A_out[1095:1088], A_out[1103:1096], A_out[1111:1104], A_out[1119:1112], A_out[1127:1120], A_out[1135:1128], A_out[1143:1136], A_out[1151:1144]} = Agi2;
assign {A_out[1031:1024], A_out[1039:1032], A_out[1047:1040], A_out[1055:1048], A_out[1063:1056], A_out[1071:1064], A_out[1079:1072], A_out[1087:1080]} = Ago2;
assign {A_out[967:960]  , A_out[975:968]  , A_out[983:976]  , A_out[991:984]  , A_out[999:992]  , A_out[1007:1000], A_out[1015:1008], A_out[1023:1016]} = Agu2;
assign {A_out[903:896]  , A_out[911:904]  , A_out[919:912]  , A_out[927:920]  , A_out[935:928]  , A_out[943:936]  , A_out[951:944]  , A_out[959:952]  } = Aka2;
assign {A_out[839:832]  , A_out[847:840]  , A_out[855:848]  , A_out[863:856]  , A_out[871:864]  , A_out[879:872]  , A_out[887:880]  , A_out[895:888]  } = Ake2;
assign {A_out[775:768]  , A_out[783:776]  , A_out[791:784]  , A_out[799:792]  , A_out[807:800]  , A_out[815:808]  , A_out[823:816]  , A_out[831:824]  } = Aki2;
assign {A_out[711:704]  , A_out[719:712]  , A_out[727:720]  , A_out[735:728]  , A_out[743:736]  , A_out[751:744]  , A_out[759:752]  , A_out[767:760]  } = Ako2;
assign {A_out[647:640]  , A_out[655:648]  , A_out[663:656]  , A_out[671:664]  , A_out[679:672]  , A_out[687:680]  , A_out[695:688]  , A_out[703:696]  } = Aku2;
assign {A_out[583:576]  , A_out[591:584]  , A_out[599:592]  , A_out[607:600]  , A_out[615:608]  , A_out[623:616]  , A_out[631:624]  , A_out[639:632]  } = Ama2;
assign {A_out[519:512]  , A_out[527:520]  , A_out[535:528]  , A_out[543:536]  , A_out[551:544]  , A_out[559:552]  , A_out[567:560]  , A_out[575:568]  } = Ame2;
assign {A_out[455:448]  , A_out[463:456]  , A_out[471:464]  , A_out[479:472]  , A_out[487:480]  , A_out[495:488]  , A_out[503:496]  , A_out[511:504]  } = Ami2;
assign {A_out[391:384]  , A_out[399:392]  , A_out[407:400]  , A_out[415:408]  , A_out[423:416]  , A_out[431:424]  , A_out[439:432]  , A_out[447:440]  } = Amo2;
assign {A_out[327:320]  , A_out[335:328]  , A_out[343:336]  , A_out[351:344]  , A_out[359:352]  , A_out[367:360]  , A_out[375:368]  , A_out[383:376]  } = Amu2;
assign {A_out[263:256]  , A_out[271:264]  , A_out[279:272]  , A_out[287:280]  , A_out[295:288]  , A_out[303:296]  , A_out[311:304]  , A_out[319:312]  } = Asa2;
assign {A_out[199:192]  , A_out[207:200]  , A_out[215:208]  , A_out[223:216]  , A_out[231:224]  , A_out[239:232]  , A_out[247:240]  , A_out[255:248]  } = Ase2;
assign {A_out[135:128]  , A_out[143:136]  , A_out[151:144]  , A_out[159:152]  , A_out[167:160]  , A_out[175:168]  , A_out[183:176]  , A_out[191:184]  } = Asi2;
assign {A_out[71:64]    , A_out[79:72]    , A_out[87:80]    , A_out[95:88]    , A_out[103:96]   , A_out[111:104]  , A_out[119:112]  , A_out[127:120]  } = Aso2;
assign {A_out[7:0]      , A_out[15:8]     , A_out[23:16]    , A_out[31:24]    , A_out[39:32]    , A_out[47:40]    , A_out[55:48]    , A_out[63:56]    } = Asu2;
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        s_out <= 'd0;
        rdy <= 0;
    end
    else if(en == 1) begin
        s_out <=  A_out;
        rdy <= 1'b1;
    end
    else begin
        s_out <= 0;
        rdy <= 0; 
    end
end
endmodule
