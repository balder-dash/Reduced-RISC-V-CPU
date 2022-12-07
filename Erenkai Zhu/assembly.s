main_loop:
li a4, 1 // this is the starting random number used in lfsr
li a2, 28 // it count 28 cycles to tick 1 sec
li t1, 8 
li a3, 0 // increment 1 after each cycle, maximum 8 // 两灯泡的个数
li a0, 1 // a0 is output, begin as it starting light up //灯泡
jal counter_loop // default x1
addi a3, a3, 1 // incre by 1
slli a0, a0, 1 //亮灯 sllI shift, x2
addi a0, a0, 1
bne  a3, t1, -4 // 回到传送门


//random number generator
//when all lights are on, go next step to generate an random number
//ifsr loop, to generate a random number
andi a6, 0x8, a4
andi a7, 0x4, a4
slli a4, a4, 1 // shift
srli a6, a6, 3 // shift x4 to the left most
srli a7, a7, 2 // shift x3 to the left most
xor a6, a6, a7 // x3 xor x4
or a4, a4, a6 // a4 is the new random number for delaying //working with bits
andi a4, 0xf, a4 // 取后四位

//when random number is generated, start the delay loop 
li a3, 1
jal counter_loop // reg contains return address
addi a3, a3, 1
bne  a3, a4, -2 //count a4 delay loops then go next step to close all lights back to jal
li a0, 0 //give output a0 the value zero so close all light// 关灯
j main_loop // 回到 一开始循环

//the counter loop that counts one second the subroutine using JAL
counter_loop: 
li a5, 0 // 数数的 
addi a5, a5, 1 
bne  a5, a2, -1 // go to next step when counts 28a2 cycles. Estimaating count 28 cycle spending 1 second, 一直加到1秒
ret // reg contains return address rs // 和jal配套使用
