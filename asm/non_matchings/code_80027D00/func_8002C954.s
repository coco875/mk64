glabel func_8002C954
/* 02D554 8002C954 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 02D558 8002C958 AFBF0014 */  sw    $ra, 0x14($sp)
/* 02D55C 8002C95C AFA5001C */  sw    $a1, 0x1c($sp)
/* 02D560 8002C960 AFA60020 */  sw    $a2, 0x20($sp)
/* 02D564 8002C964 8C8200BC */  lw    $v0, 0xbc($a0)
/* 02D568 8002C968 C4860074 */  lwc1  $f6, 0x74($a0)
/* 02D56C 8002C96C C4840018 */  lwc1  $f4, 0x18($a0)
/* 02D570 8002C970 3C080001 */  lui   $t0, 1
/* 02D574 8002C974 00481824 */  and   $v1, $v0, $t0
/* 02D578 8002C978 00803825 */  move  $a3, $a0
/* 02D57C 8002C97C 11030004 */  beq   $t0, $v1, .L8002C990
/* 02D580 8002C980 46062001 */   sub.s $f0, $f4, $f6
/* 02D584 8002C984 3C040010 */  lui   $a0, 0x10
/* 02D588 8002C988 00447024 */  and   $t6, $v0, $a0
/* 02D58C 8002C98C 108E0016 */  beq   $a0, $t6, .L8002C9E8
.L8002C990:
/* 02D590 8002C990 3C0141A0 */   li    $at, 0x41A00000 # 20.000000
/* 02D594 8002C994 44814000 */  mtc1  $at, $f8
/* 02D598 8002C998 3C01BF80 */  li    $at, 0xBF800000 # -1.000000
/* 02D59C 8002C99C 4600403E */  c.le.s $f8, $f0
/* 02D5A0 8002C9A0 00000000 */  nop   
/* 02D5A4 8002C9A4 45010007 */  bc1t  .L8002C9C4
/* 02D5A8 8002C9A8 00000000 */   nop   
/* 02D5AC 8002C9AC 44815000 */  mtc1  $at, $f10
/* 02D5B0 8002C9B0 00000000 */  nop   
/* 02D5B4 8002C9B4 460A003C */  c.lt.s $f0, $f10
/* 02D5B8 8002C9B8 00000000 */  nop   
/* 02D5BC 8002C9BC 45020006 */  bc1fl .L8002C9D8
/* 02D5C0 8002C9C0 94F80114 */   lhu   $t8, 0x114($a3)
.L8002C9C4:
/* 02D5C4 8002C9C4 14600003 */  bnez  $v1, .L8002C9D4
/* 02D5C8 8002C9C8 304F0008 */   andi  $t7, $v0, 8
/* 02D5CC 8002C9CC 55E00007 */  bnel  $t7, $zero, .L8002C9EC
/* 02D5D0 8002C9D0 84E200CA */   lh    $v0, 0xca($a3)
.L8002C9D4:
/* 02D5D4 8002C9D4 94F80114 */  lhu   $t8, 0x114($a3)
.L8002C9D8:
/* 02D5D8 8002C9D8 5700000F */  bnel  $t8, $zero, .L8002CA18
/* 02D5DC 8002C9DC 94E20046 */   lhu   $v0, 0x46($a3)
/* 02D5E0 8002C9E0 5460000D */  bnel  $v1, $zero, .L8002CA18
/* 02D5E4 8002C9E4 94E20046 */   lhu   $v0, 0x46($a3)
.L8002C9E8:
/* 02D5E8 8002C9E8 84E200CA */  lh    $v0, 0xca($a3)
.L8002C9EC:
/* 02D5EC 8002C9EC 00E02025 */  move  $a0, $a3
/* 02D5F0 8002C9F0 83A5001F */  lb    $a1, 0x1f($sp)
/* 02D5F4 8002C9F4 30590002 */  andi  $t9, $v0, 2
/* 02D5F8 8002C9F8 13200003 */  beqz  $t9, .L8002CA08
/* 02D5FC 8002C9FC 30490008 */   andi  $t1, $v0, 8
/* 02D600 8002CA00 55200005 */  bnel  $t1, $zero, .L8002CA18
/* 02D604 8002CA04 94E20046 */   lhu   $v0, 0x46($a3)
.L8002CA08:
/* 02D608 8002CA08 0C023D25 */  jal   func_8008F494
/* 02D60C 8002CA0C AFA70018 */   sw    $a3, 0x18($sp)
/* 02D610 8002CA10 8FA70018 */  lw    $a3, 0x18($sp)
/* 02D614 8002CA14 94E20046 */  lhu   $v0, 0x46($a3)
.L8002CA18:
/* 02D618 8002CA18 24010020 */  li    $at, 32
/* 02D61C 8002CA1C 304A0020 */  andi  $t2, $v0, 0x20
/* 02D620 8002CA20 11410014 */  beq   $t2, $at, .L8002CA74
/* 02D624 8002CA24 3C01BF80 */   li    $at, 0xBF800000 # -1.000000
/* 02D628 8002CA28 44819000 */  mtc1  $at, $f18
/* 02D62C 8002CA2C C4F0011C */  lwc1  $f16, 0x11c($a3)
/* 02D630 8002CA30 3C01BF80 */  li    $at, 0xBF800000 # -1.000000
/* 02D634 8002CA34 240B0001 */  li    $t3, 1
/* 02D638 8002CA38 4612803C */  c.lt.s $f16, $f18
/* 02D63C 8002CA3C 00000000 */  nop   
/* 02D640 8002CA40 45030009 */  bc1tl .L8002CA68
/* 02D644 8002CA44 A4EB0256 */   sh    $t3, 0x256($a3)
/* 02D648 8002CA48 C4E40120 */  lwc1  $f4, 0x120($a3)
/* 02D64C 8002CA4C 44813000 */  mtc1  $at, $f6
/* 02D650 8002CA50 00000000 */  nop   
/* 02D654 8002CA54 4606203C */  c.lt.s $f4, $f6
/* 02D658 8002CA58 00000000 */  nop   
/* 02D65C 8002CA5C 45020004 */  bc1fl .L8002CA70
/* 02D660 8002CA60 344C0020 */   ori   $t4, $v0, 0x20
/* 02D664 8002CA64 A4EB0256 */  sh    $t3, 0x256($a3)
.L8002CA68:
/* 02D668 8002CA68 94E20046 */  lhu   $v0, 0x46($a3)
/* 02D66C 8002CA6C 344C0020 */  ori   $t4, $v0, 0x20
.L8002CA70:
/* 02D670 8002CA70 A4EC0046 */  sh    $t4, 0x46($a3)
.L8002CA74:
/* 02D674 8002CA74 94ED0000 */  lhu   $t5, ($a3)
/* 02D678 8002CA78 24014000 */  li    $at, 16384
/* 02D67C 8002CA7C 31AE4000 */  andi  $t6, $t5, 0x4000
/* 02D680 8002CA80 15C10012 */  bne   $t6, $at, .L8002CACC
/* 02D684 8002CA84 3C0141F0 */   li    $at, 0x41F00000 # 30.000000
/* 02D688 8002CA88 44814000 */  mtc1  $at, $f8
/* 02D68C 8002CA8C 3C014190 */  li    $at, 0x41900000 # 18.000000
/* 02D690 8002CA90 44818000 */  mtc1  $at, $f16
/* 02D694 8002CA94 C4EA0094 */  lwc1  $f10, 0x94($a3)
/* 02D698 8002CA98 3C014358 */  li    $at, 0x43580000 # 216.000000
/* 02D69C 8002CA9C 44812000 */  mtc1  $at, $f4
/* 02D6A0 8002CAA0 46105483 */  div.s $f18, $f10, $f16
/* 02D6A4 8002CAA4 00E02025 */  move  $a0, $a3
/* 02D6A8 8002CAA8 3C054040 */  lui   $a1, 0x4040
/* 02D6AC 8002CAAC 46049182 */  mul.s $f6, $f18, $f4
/* 02D6B0 8002CAB0 4606403C */  c.lt.s $f8, $f6
/* 02D6B4 8002CAB4 00000000 */  nop   
/* 02D6B8 8002CAB8 45020005 */  bc1fl .L8002CAD0
/* 02D6BC 8002CABC 94F90256 */   lhu   $t9, 0x256($a3)
/* 02D6C0 8002CAC0 0C007289 */  jal   func_8001CA24
/* 02D6C4 8002CAC4 AFA70018 */   sw    $a3, 0x18($sp)
/* 02D6C8 8002CAC8 8FA70018 */  lw    $a3, 0x18($sp)
.L8002CACC:
/* 02D6CC 8002CACC 94F90256 */  lhu   $t9, 0x256($a3)
.L8002CAD0:
/* 02D6D0 8002CAD0 94EF0046 */  lhu   $t7, 0x46($a3)
/* 02D6D4 8002CAD4 27290001 */  addiu $t1, $t9, 1
/* 02D6D8 8002CAD8 312AFFFF */  andi  $t2, $t1, 0xffff
/* 02D6DC 8002CADC 2941000A */  slti  $at, $t2, 0xa
/* 02D6E0 8002CAE0 35F80010 */  ori   $t8, $t7, 0x10
/* 02D6E4 8002CAE4 A4F80046 */  sh    $t8, 0x46($a3)
/* 02D6E8 8002CAE8 14200002 */  bnez  $at, .L8002CAF4
/* 02D6EC 8002CAEC A4E90256 */   sh    $t1, 0x256($a3)
/* 02D6F0 8002CAF0 A4E00256 */  sh    $zero, 0x256($a3)
.L8002CAF4:
/* 02D6F4 8002CAF4 84EB00C4 */  lh    $t3, 0xc4($a3)
/* 02D6F8 8002CAF8 3C0140A0 */  li    $at, 0x40A00000 # 5.000000
/* 02D6FC 8002CAFC 05620013 */  bltzl $t3, .L8002CB4C
/* 02D700 8002CB00 94EC0000 */   lhu   $t4, ($a3)
/* 02D704 8002CB04 44815000 */  mtc1  $at, $f10
/* 02D708 8002CB08 3C014190 */  li    $at, 0x41900000 # 18.000000
/* 02D70C 8002CB0C 44819000 */  mtc1  $at, $f18
/* 02D710 8002CB10 C4F00094 */  lwc1  $f16, 0x94($a3)
/* 02D714 8002CB14 3C014358 */  li    $at, 0x43580000 # 216.000000
/* 02D718 8002CB18 44814000 */  mtc1  $at, $f8
/* 02D71C 8002CB1C 46128103 */  div.s $f4, $f16, $f18
/* 02D720 8002CB20 00E02025 */  move  $a0, $a3
/* 02D724 8002CB24 3C054190 */  lui   $a1, 0x4190
/* 02D728 8002CB28 46082182 */  mul.s $f6, $f4, $f8
/* 02D72C 8002CB2C 4606503C */  c.lt.s $f10, $f6
/* 02D730 8002CB30 00000000 */  nop   
/* 02D734 8002CB34 45020005 */  bc1fl .L8002CB4C
/* 02D738 8002CB38 94EC0000 */   lhu   $t4, ($a3)
/* 02D73C 8002CB3C 0C00C7D2 */  jal   func_80031F48
/* 02D740 8002CB40 AFA70018 */   sw    $a3, 0x18($sp)
/* 02D744 8002CB44 8FA70018 */  lw    $a3, 0x18($sp)
/* 02D748 8002CB48 94EC0000 */  lhu   $t4, ($a3)
.L8002CB4C:
/* 02D74C 8002CB4C 83AE001F */  lb    $t6, 0x1f($sp)
/* 02D750 8002CB50 24014000 */  li    $at, 16384
/* 02D754 8002CB54 318D4000 */  andi  $t5, $t4, 0x4000
/* 02D758 8002CB58 15A1006A */  bne   $t5, $at, .L8002CD04
/* 02D75C 8002CB5C 000E7880 */   sll   $t7, $t6, 2
/* 02D760 8002CB60 8FB90020 */  lw    $t9, 0x20($sp)
/* 02D764 8002CB64 01EE7823 */  subu  $t7, $t7, $t6
/* 02D768 8002CB68 3C188016 */  lui   $t8, %hi(D_80165070) # $t8, 0x8016
/* 02D76C 8002CB6C 27185070 */  addiu $t8, %lo(D_80165070) # addiu $t8, $t8, 0x5070
/* 02D770 8002CB70 000F7880 */  sll   $t7, $t7, 2
/* 02D774 8002CB74 01F81021 */  addu  $v0, $t7, $t8
/* 02D778 8002CB78 C4500000 */  lwc1  $f16, ($v0)
/* 02D77C 8002CB7C C7320000 */  lwc1  $f18, ($t9)
/* 02D780 8002CB80 C4440004 */  lwc1  $f4, 4($v0)
/* 02D784 8002CB84 C7280004 */  lwc1  $f8, 4($t9)
/* 02D788 8002CB88 46128001 */  sub.s $f0, $f16, $f18
/* 02D78C 8002CB8C C44A0008 */  lwc1  $f10, 8($v0)
/* 02D790 8002CB90 C7260008 */  lwc1  $f6, 8($t9)
/* 02D794 8002CB94 46082381 */  sub.s $f14, $f4, $f8
/* 02D798 8002CB98 46000402 */  mul.s $f16, $f0, $f0
/* 02D79C 8002CB9C AFA70018 */  sw    $a3, 0x18($sp)
/* 02D7A0 8002CBA0 46065081 */  sub.s $f2, $f10, $f6
/* 02D7A4 8002CBA4 460E7482 */  mul.s $f18, $f14, $f14
/* 02D7A8 8002CBA8 46128100 */  add.s $f4, $f16, $f18
/* 02D7AC 8002CBAC 46021202 */  mul.s $f8, $f2, $f2
/* 02D7B0 8002CBB0 0C033850 */  jal   sqrtf
/* 02D7B4 8002CBB4 46082300 */   add.s $f12, $f4, $f8
/* 02D7B8 8002CBB8 3C014040 */  li    $at, 0x40400000 # 3.000000
/* 02D7BC 8002CBBC 44815000 */  mtc1  $at, $f10
/* 02D7C0 8002CBC0 3C013FF0 */  li    $at, 0x3FF00000 # 1.875000
/* 02D7C4 8002CBC4 44818800 */  mtc1  $at, $f17
/* 02D7C8 8002CBC8 460A0383 */  div.s $f14, $f0, $f10
/* 02D7CC 8002CBCC 44808000 */  mtc1  $zero, $f16
/* 02D7D0 8002CBD0 8FA70018 */  lw    $a3, 0x18($sp)
/* 02D7D4 8002CBD4 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 02D7D8 8002CBD8 460071A1 */  cvt.d.s $f6, $f14
/* 02D7DC 8002CBDC 4626803E */  c.le.d $f16, $f6
/* 02D7E0 8002CBE0 00000000 */  nop   
/* 02D7E4 8002CBE4 45000003 */  bc1f  .L8002CBF4
/* 02D7E8 8002CBE8 00000000 */   nop   
/* 02D7EC 8002CBEC 44817000 */  mtc1  $at, $f14
/* 02D7F0 8002CBF0 00000000 */  nop   
.L8002CBF4:
/* 02D7F4 8002CBF4 3C01800F */  lui   $at, %hi(D_800ED7D8)
/* 02D7F8 8002CBF8 D422D7D8 */  ldc1  $f2, %lo(D_800ED7D8)($at)
/* 02D7FC 8002CBFC 46007021 */  cvt.d.s $f0, $f14
/* 02D800 8002CC00 3C014190 */  li    $at, 0x41900000 # 18.000000
/* 02D804 8002CC04 4622003E */  c.le.d $f0, $f2
/* 02D808 8002CC08 00000000 */  nop   
/* 02D80C 8002CC0C 45020018 */  bc1fl .L8002CC70
/* 02D810 8002CC10 94EB0000 */   lhu   $t3, ($a3)
/* 02D814 8002CC14 C4F20094 */  lwc1  $f18, 0x94($a3)
/* 02D818 8002CC18 44812000 */  mtc1  $at, $f4
/* 02D81C 8002CC1C 3C014358 */  li    $at, 0x43580000 # 216.000000
/* 02D820 8002CC20 44815000 */  mtc1  $at, $f10
/* 02D824 8002CC24 46049203 */  div.s $f8, $f18, $f4
/* 02D828 8002CC28 3C014220 */  li    $at, 0x42200000 # 40.000000
/* 02D82C 8002CC2C 44818000 */  mtc1  $at, $f16
/* 02D830 8002CC30 460A4182 */  mul.s $f6, $f8, $f10
/* 02D834 8002CC34 4606803E */  c.le.s $f16, $f6
/* 02D838 8002CC38 00000000 */  nop   
/* 02D83C 8002CC3C 4502000C */  bc1fl .L8002CC70
/* 02D840 8002CC40 94EB0000 */   lhu   $t3, ($a3)
/* 02D844 8002CC44 94E90000 */  lhu   $t1, ($a3)
/* 02D848 8002CC48 3C053F19 */  lui   $a1, (0x3F19999A >> 16) # lui $a1, 0x3f19
/* 02D84C 8002CC4C 34A5999A */  ori   $a1, (0x3F19999A & 0xFFFF) # ori $a1, $a1, 0x999a
/* 02D850 8002CC50 312A0100 */  andi  $t2, $t1, 0x100
/* 02D854 8002CC54 15400005 */  bnez  $t2, .L8002CC6C
/* 02D858 8002CC58 93A4001F */   lbu   $a0, 0x1f($sp)
/* 02D85C 8002CC5C 0C032BB1 */  jal   func_800CAEC4
/* 02D860 8002CC60 AFA70018 */   sw    $a3, 0x18($sp)
/* 02D864 8002CC64 10000027 */  b     .L8002CD04
/* 02D868 8002CC68 8FA70018 */   lw    $a3, 0x18($sp)
.L8002CC6C:
/* 02D86C 8002CC6C 94EB0000 */  lhu   $t3, ($a3)
.L8002CC70:
/* 02D870 8002CC70 316C0100 */  andi  $t4, $t3, 0x100
/* 02D874 8002CC74 55800024 */  bnel  $t4, $zero, .L8002CD08
/* 02D878 8002CC78 8CED00BC */   lw    $t5, 0xbc($a3)
/* 02D87C 8002CC7C 4622003E */  c.le.d $f0, $f2
/* 02D880 8002CC80 3C014190 */  li    $at, 0x41900000 # 18.000000
/* 02D884 8002CC84 93A4001F */  lbu   $a0, 0x1f($sp)
/* 02D888 8002CC88 4502001B */  bc1fl .L8002CCF8
/* 02D88C 8002CC8C 44057000 */   mfc1  $a1, $f14
/* 02D890 8002CC90 C4F20094 */  lwc1  $f18, 0x94($a3)
/* 02D894 8002CC94 44812000 */  mtc1  $at, $f4
/* 02D898 8002CC98 3C014358 */  li    $at, 0x43580000 # 216.000000
/* 02D89C 8002CC9C 44815000 */  mtc1  $at, $f10
/* 02D8A0 8002CCA0 46049203 */  div.s $f8, $f18, $f4
/* 02D8A4 8002CCA4 3C014220 */  li    $at, 0x42200000 # 40.000000
/* 02D8A8 8002CCA8 44813000 */  mtc1  $at, $f6
/* 02D8AC 8002CCAC 3C014120 */  li    $at, 0x41200000 # 10.000000
/* 02D8B0 8002CCB0 460A4002 */  mul.s $f0, $f8, $f10
/* 02D8B4 8002CCB4 4606003C */  c.lt.s $f0, $f6
/* 02D8B8 8002CCB8 00000000 */  nop   
/* 02D8BC 8002CCBC 4502000E */  bc1fl .L8002CCF8
/* 02D8C0 8002CCC0 44057000 */   mfc1  $a1, $f14
/* 02D8C4 8002CCC4 44818000 */  mtc1  $at, $f16
/* 02D8C8 8002CCC8 3C053E99 */  lui   $a1, (0x3E99999A >> 16) # lui $a1, 0x3e99
/* 02D8CC 8002CCCC 34A5999A */  ori   $a1, (0x3E99999A & 0xFFFF) # ori $a1, $a1, 0x999a
/* 02D8D0 8002CCD0 4600803E */  c.le.s $f16, $f0
/* 02D8D4 8002CCD4 00000000 */  nop   
/* 02D8D8 8002CCD8 45020007 */  bc1fl .L8002CCF8
/* 02D8DC 8002CCDC 44057000 */   mfc1  $a1, $f14
/* 02D8E0 8002CCE0 93A4001F */  lbu   $a0, 0x1f($sp)
/* 02D8E4 8002CCE4 0C032BB1 */  jal   func_800CAEC4
/* 02D8E8 8002CCE8 AFA70018 */   sw    $a3, 0x18($sp)
/* 02D8EC 8002CCEC 10000005 */  b     .L8002CD04
/* 02D8F0 8002CCF0 8FA70018 */   lw    $a3, 0x18($sp)
/* 02D8F4 8002CCF4 44057000 */  mfc1  $a1, $f14
.L8002CCF8:
/* 02D8F8 8002CCF8 0C032BB1 */  jal   func_800CAEC4
/* 02D8FC 8002CCFC AFA70018 */   sw    $a3, 0x18($sp)
/* 02D900 8002CD00 8FA70018 */  lw    $a3, 0x18($sp)
.L8002CD04:
/* 02D904 8002CD04 8CED00BC */  lw    $t5, 0xbc($a3)
.L8002CD08:
/* 02D908 8002CD08 00E02025 */  move  $a0, $a3
/* 02D90C 8002CD0C 31AE2000 */  andi  $t6, $t5, 0x2000
/* 02D910 8002CD10 51C0000A */  beql  $t6, $zero, .L8002CD3C
/* 02D914 8002CD14 8FBF0014 */   lw    $ra, 0x14($sp)
/* 02D918 8002CD18 0C023555 */  jal   func_8008D554
/* 02D91C 8002CD1C AFA70018 */   sw    $a3, 0x18($sp)
/* 02D920 8002CD20 8FA70018 */  lw    $a3, 0x18($sp)
/* 02D924 8002CD24 3C014000 */  li    $at, 0x40000000 # 2.000000
/* 02D928 8002CD28 44812000 */  mtc1  $at, $f4
/* 02D92C 8002CD2C C4F2008C */  lwc1  $f18, 0x8c($a3)
/* 02D930 8002CD30 46049203 */  div.s $f8, $f18, $f4
/* 02D934 8002CD34 E4E8008C */  swc1  $f8, 0x8c($a3)
/* 02D938 8002CD38 8FBF0014 */  lw    $ra, 0x14($sp)
.L8002CD3C:
/* 02D93C 8002CD3C 27BD0018 */  addiu $sp, $sp, 0x18
/* 02D940 8002CD40 03E00008 */  jr    $ra
/* 02D944 8002CD44 00000000 */   nop   