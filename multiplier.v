module multiplier(
input [3:0] a,
input [3:0] b,
output p00,s01,s11,s21,s22,s23,s24,cout
);
wire c01,c02,s02,c03,s03,c04,s04,c11,c12,s12,c13,s13,c14,s14,c21,c22,c23;

assign p00=a[0]&b[0];
assign p01=a[1]&b[0];
assign p02=a[2]&b[0];
assign p03=a[3]&b[0];
assign p10=a[0]&b[1];
assign p11=a[1]&b[1];
assign p12=a[2]&b[1];
assign p13=a[3]&b[1];
assign p20=a[0]&b[2];
assign p21=a[1]&b[2];
assign p22=a[2]&b[2];
assign p23=a[3]&b[2];
assign p30=a[0]&b[3];
assign p31=a[1]&b[3];
assign p32=a[2]&b[3];
assign p33=a[3]&b[3];

half_adder_dataflow HA1(
.a(p01),
.b(p10),
.sum(s01),
.carry(c01)
);
full_adder_structural FA1(
.a(p02),
.b(p11),
.carry_in(p20),
.sum(s02),
.carry_out(c02)
);
full_adder_structural FA2(
.a(p03),
.b(p12),
.carry_in(p21),
.sum(s03),
.carry_out(c03)
);
half_adder_dataflow HA2(
.a(p22),
.b(p13),
.sum(s04),
.carry(c04)
);
half_adder_dataflow HA3(
.a(c01),
.b(s02),
.sum(s11),
.carry(c11)
);
full_adder_structural FA3(
.a(c02),
.b(p30),
.carry_in(s03),
.sum(s12),
.carry_out(c12)
);
full_adder_structural FA4(
.a(c03),
.b(p31),
.carry_in(s04),
.sum(s13),
.carry_out(c13)
);
full_adder_structural FA5(
.a(c04),
.b(p32),
.carry_in(p23),
.sum(s14),
.carry_out(c14)
);
half_adder_dataflow HA4(
.a(c11),
.b(s12),
.sum(s21),
.carry(c21)
);
full_adder_structural FA6(
.a(c12),
.b(s13),
.carry_in(c21),
.sum(s22),
.carry_out(c22)
);
full_adder_structural FA7(
.a(c13),
.b(s14),
.carry_in(c22),
.sum(s23),
.carry_out(c23)
);
full_adder_structural FA8(
.a(p33),
.b(c14),
.carry_in(c23),
.sum(s24),
.carry_out(cout)
);




endmodule
