glabel func_80019890
/* 01A490 80019890 3C0E800E */  lui   $t6, %hi(camera1)
/* 01A494 80019894 0005C080 */  sll   $t8, $a1, 2
/* 01A498 80019898 8DCEDB40 */  lw    $t6, %lo(camera1)($t6)
/* 01A49C 8001989C 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 01A4A0 800198A0 0305C023 */  subu  $t8, $t8, $a1
/* 01A4A4 800198A4 0018C0C0 */  sll   $t8, $t8, 3
/* 01A4A8 800198A8 0305C023 */  subu  $t8, $t8, $a1
/* 01A4AC 800198AC 0018C0C0 */  sll   $t8, $t8, 3
/* 01A4B0 800198B0 AFAE0028 */  sw    $t6, 0x28($sp)
/* 01A4B4 800198B4 01D8C821 */  addu  $t9, $t6, $t8
/* 01A4B8 800198B8 AFBF001C */  sw    $ra, 0x1c($sp)
/* 01A4BC 800198BC AFB10018 */  sw    $s1, 0x18($sp)
/* 01A4C0 800198C0 AFB00014 */  sw    $s0, 0x14($sp)
/* 01A4C4 800198C4 AFB90028 */  sw    $t9, 0x28($sp)
/* 01A4C8 800198C8 A72400AE */  sh    $a0, 0xae($t9)
/* 01A4CC 800198CC 00054040 */  sll   $t0, $a1, 1
/* 01A4D0 800198D0 3C0B8016 */  lui   $t3, %hi(D_80164680) # $t3, 0x8016
/* 01A4D4 800198D4 3C018016 */  lui   $at, %hi(D_801646C0) # 0x8016
/* 01A4D8 800198D8 256B4680 */  addiu $t3, %lo(D_80164680) # addiu $t3, $t3, 0x4680
/* 01A4DC 800198DC 00280821 */  addu  $at, $at, $t0
/* 01A4E0 800198E0 010B6021 */  addu  $t4, $t0, $t3
/* 01A4E4 800198E4 A42046C0 */  sh    $zero, %lo(D_801646C0)($at) # 0x46c0($at)
/* 01A4E8 800198E8 AFA80024 */  sw    $t0, 0x24($sp)
/* 01A4EC 800198EC AFAC0020 */  sw    $t4, 0x20($sp)
/* 01A4F0 800198F0 958D0000 */  lhu   $t5, ($t4)
/* 01A4F4 800198F4 3C118016 */  lui   $s1, %hi(D_801645B0) # 0x8016
/* 01A4F8 800198F8 00045040 */  sll   $t2, $a0, 1
/* 01A4FC 800198FC 022A8821 */  addu  $s1, $s1, $t2
/* 01A500 80019900 2DA10011 */  sltiu $at, $t5, 0x11
/* 01A504 80019904 00A08025 */  move  $s0, $a1
/* 01A508 80019908 10200077 */  beqz  $at, .L80019AE8
/* 01A50C 8001990C 963145B0 */   lhu   $s1, %lo(D_801645B0)($s1) # 0x45b0($s1)
/* 01A510 80019910 000D6880 */  sll   $t5, $t5, 2
/* 01A514 80019914 3C01800F */  lui   $at, %hi(D_800ED328)
/* 01A518 80019918 002D0821 */  addu  $at, $at, $t5
/* 01A51C 8001991C 8C2DD328 */  lw    $t5, %lo(D_800ED328)($at)
/* 01A520 80019920 01A00008 */  jr    $t5
/* 01A524 80019924 00000000 */   nop   
glabel L80019928
/* 01A528 80019928 24050000 */  li    $a1, 0
/* 01A52C 8001992C 0C0054C5 */  jal   func_80015314
/* 01A530 80019930 02003025 */   move  $a2, $s0
/* 01A534 80019934 10000070 */  b     .L80019AF8
/* 01A538 80019938 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L8001993C
/* 01A53C 8001993C 3C05BF80 */  lui   $a1, 0xbf80
/* 01A540 80019940 02003025 */  move  $a2, $s0
/* 01A544 80019944 0C005551 */  jal   func_80015544
/* 01A548 80019948 02203825 */   move  $a3, $s1
/* 01A54C 8001994C 1000006A */  b     .L80019AF8
/* 01A550 80019950 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019954
/* 01A554 80019954 3C053F80 */  lui   $a1, 0x3f80
/* 01A558 80019958 02003025 */  move  $a2, $s0
/* 01A55C 8001995C 0C005551 */  jal   func_80015544
/* 01A560 80019960 02203825 */   move  $a3, $s1
/* 01A564 80019964 10000064 */  b     .L80019AF8
/* 01A568 80019968 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L8001996C
/* 01A56C 8001996C 00113C00 */  sll   $a3, $s1, 0x10
/* 01A570 80019970 00077403 */  sra   $t6, $a3, 0x10
/* 01A574 80019974 3C05BF19 */  lui   $a1, (0xBF19999A >> 16) # lui $a1, 0xbf19
/* 01A578 80019978 34A5999A */  ori   $a1, (0xBF19999A & 0xFFFF) # ori $a1, $a1, 0x999a
/* 01A57C 8001997C 01C03825 */  move  $a3, $t6
/* 01A580 80019980 0C0056A7 */  jal   func_80015A9C
/* 01A584 80019984 02003025 */   move  $a2, $s0
/* 01A588 80019988 1000005B */  b     .L80019AF8
/* 01A58C 8001998C 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019990
/* 01A590 80019990 00113C00 */  sll   $a3, $s1, 0x10
/* 01A594 80019994 00077C03 */  sra   $t7, $a3, 0x10
/* 01A598 80019998 3C053F19 */  lui   $a1, (0x3F19999A >> 16) # lui $a1, 0x3f19
/* 01A59C 8001999C 34A5999A */  ori   $a1, (0x3F19999A & 0xFFFF) # ori $a1, $a1, 0x999a
/* 01A5A0 800199A0 01E03825 */  move  $a3, $t7
/* 01A5A4 800199A4 0C0056A7 */  jal   func_80015A9C
/* 01A5A8 800199A8 02003025 */   move  $a2, $s0
/* 01A5AC 800199AC 10000052 */  b     .L80019AF8
/* 01A5B0 800199B0 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L800199B4
/* 01A5B4 800199B4 00113C00 */  sll   $a3, $s1, 0x10
/* 01A5B8 800199B8 0007C403 */  sra   $t8, $a3, 0x10
/* 01A5BC 800199BC 03003825 */  move  $a3, $t8
/* 01A5C0 800199C0 3C05BF80 */  lui   $a1, 0xbf80
/* 01A5C4 800199C4 0C0058B3 */  jal   func_800162CC
/* 01A5C8 800199C8 02003025 */   move  $a2, $s0
/* 01A5CC 800199CC 1000004A */  b     .L80019AF8
/* 01A5D0 800199D0 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L800199D4
/* 01A5D4 800199D4 00113C00 */  sll   $a3, $s1, 0x10
/* 01A5D8 800199D8 0007CC03 */  sra   $t9, $a3, 0x10
/* 01A5DC 800199DC 03203825 */  move  $a3, $t9
/* 01A5E0 800199E0 3C053F80 */  lui   $a1, 0x3f80
/* 01A5E4 800199E4 0C0058B3 */  jal   func_800162CC
/* 01A5E8 800199E8 02003025 */   move  $a2, $s0
/* 01A5EC 800199EC 10000042 */  b     .L80019AF8
/* 01A5F0 800199F0 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L800199F4
/* 01A5F4 800199F4 24050000 */  li    $a1, 0
/* 01A5F8 800199F8 0C005B0F */  jal   func_80016C3C
/* 01A5FC 800199FC 02003025 */   move  $a2, $s0
/* 01A600 80019A00 1000003D */  b     .L80019AF8
/* 01A604 80019A04 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019A08
/* 01A608 80019A08 00113C00 */  sll   $a3, $s1, 0x10
/* 01A60C 80019A0C 00074403 */  sra   $t0, $a3, 0x10
/* 01A610 80019A10 01003825 */  move  $a3, $t0
/* 01A614 80019A14 24050000 */  li    $a1, 0
/* 01A618 80019A18 0C005DC8 */  jal   func_80017720
/* 01A61C 80019A1C 02003025 */   move  $a2, $s0
/* 01A620 80019A20 10000035 */  b     .L80019AF8
/* 01A624 80019A24 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019A28
/* 01A628 80019A28 00113C00 */  sll   $a3, $s1, 0x10
/* 01A62C 80019A2C 00075403 */  sra   $t2, $a3, 0x10
/* 01A630 80019A30 01403825 */  move  $a3, $t2
/* 01A634 80019A34 24050000 */  li    $a1, 0
/* 01A638 80019A38 0C005FC4 */  jal   func_80017F10
/* 01A63C 80019A3C 02003025 */   move  $a2, $s0
/* 01A640 80019A40 1000002D */  b     .L80019AF8
/* 01A644 80019A44 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019A48
/* 01A648 80019A48 00113C00 */  sll   $a3, $s1, 0x10
/* 01A64C 80019A4C 00074C03 */  sra   $t1, $a3, 0x10
/* 01A650 80019A50 01203825 */  move  $a3, $t1
/* 01A654 80019A54 24050000 */  li    $a1, 0
/* 01A658 80019A58 0C0061C6 */  jal   func_80018718
/* 01A65C 80019A5C 02003025 */   move  $a2, $s0
/* 01A660 80019A60 10000025 */  b     .L80019AF8
/* 01A664 80019A64 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019A68
/* 01A668 80019A68 00113C00 */  sll   $a3, $s1, 0x10
/* 01A66C 80019A6C 00075C03 */  sra   $t3, $a3, 0x10
/* 01A670 80019A70 01603825 */  move  $a3, $t3
/* 01A674 80019A74 3C05BF80 */  lui   $a1, 0xbf80
/* 01A678 80019A78 0C006446 */  jal   func_80019118
/* 01A67C 80019A7C 02003025 */   move  $a2, $s0
/* 01A680 80019A80 1000001D */  b     .L80019AF8
/* 01A684 80019A84 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019A88
/* 01A688 80019A88 00113C00 */  sll   $a3, $s1, 0x10
/* 01A68C 80019A8C 00076403 */  sra   $t4, $a3, 0x10
/* 01A690 80019A90 01803825 */  move  $a3, $t4
/* 01A694 80019A94 3C053F80 */  lui   $a1, 0x3f80
/* 01A698 80019A98 0C006446 */  jal   func_80019118
/* 01A69C 80019A9C 02003025 */   move  $a2, $s0
/* 01A6A0 80019AA0 10000015 */  b     .L80019AF8
/* 01A6A4 80019AA4 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019AA8
/* 01A6A8 80019AA8 00113C00 */  sll   $a3, $s1, 0x10
/* 01A6AC 80019AAC 00076C03 */  sra   $t5, $a3, 0x10
/* 01A6B0 80019AB0 01A03825 */  move  $a3, $t5
/* 01A6B4 80019AB4 3C05BF80 */  lui   $a1, 0xbf80
/* 01A6B8 80019AB8 0C0065A7 */  jal   func_8001969C
/* 01A6BC 80019ABC 02003025 */   move  $a2, $s0
/* 01A6C0 80019AC0 1000000D */  b     .L80019AF8
/* 01A6C4 80019AC4 8FAF0028 */   lw    $t7, 0x28($sp)
glabel L80019AC8
/* 01A6C8 80019AC8 00113C00 */  sll   $a3, $s1, 0x10
/* 01A6CC 80019ACC 00077403 */  sra   $t6, $a3, 0x10
/* 01A6D0 80019AD0 01C03825 */  move  $a3, $t6
/* 01A6D4 80019AD4 3C053F80 */  lui   $a1, 0x3f80
/* 01A6D8 80019AD8 0C0065A7 */  jal   func_8001969C
/* 01A6DC 80019ADC 02003025 */   move  $a2, $s0
/* 01A6E0 80019AE0 10000005 */  b     .L80019AF8
/* 01A6E4 80019AE4 8FAF0028 */   lw    $t7, 0x28($sp)
.L80019AE8:
glabel L80019AE8
/* 01A6E8 80019AE8 24050000 */  li    $a1, 0
/* 01A6EC 80019AEC 0C0054C5 */  jal   func_80015314
/* 01A6F0 80019AF0 02003025 */   move  $a2, $s0
/* 01A6F4 80019AF4 8FAF0028 */  lw    $t7, 0x28($sp)
.L80019AF8:
/* 01A6F8 80019AF8 02203825 */  move  $a3, $s1
/* 01A6FC 80019AFC C5EC0000 */  lwc1  $f12, ($t7)
/* 01A700 80019B00 C5EE0004 */  lwc1  $f14, 4($t7)
/* 01A704 80019B04 0C002F65 */  jal   func_8000BD94
/* 01A708 80019B08 8DE60008 */   lw    $a2, 8($t7)
/* 01A70C 80019B0C 8FB80024 */  lw    $t8, 0x24($sp)
/* 01A710 80019B10 8FB90020 */  lw    $t9, 0x20($sp)
/* 01A714 80019B14 3C018016 */  lui   $at, %hi(D_80164668) # 0x8016
/* 01A718 80019B18 00380821 */  addu  $at, $at, $t8
/* 01A71C 80019B1C A4224668 */  sh    $v0, %lo(D_80164668)($at) # 0x4668($at)
/* 01A720 80019B20 87280000 */  lh    $t0, ($t9)
/* 01A724 80019B24 24010009 */  li    $at, 9
/* 01A728 80019B28 00105080 */  sll   $t2, $s0, 2
/* 01A72C 80019B2C 15010003 */  bne   $t0, $at, .L80019B3C
/* 01A730 80019B30 3C018016 */   lui   $at, %hi(D_80163DD8) # 0x8016
/* 01A734 80019B34 002A0821 */  addu  $at, $at, $t2
/* 01A738 80019B38 AC313DD8 */  sw    $s1, %lo(D_80163DD8)($at) # 0x3dd8($at)
.L80019B3C:
/* 01A73C 80019B3C 8FBF001C */  lw    $ra, 0x1c($sp)
/* 01A740 80019B40 8FB00014 */  lw    $s0, 0x14($sp)
/* 01A744 80019B44 8FB10018 */  lw    $s1, 0x18($sp)
/* 01A748 80019B48 03E00008 */  jr    $ra
/* 01A74C 80019B4C 27BD0030 */   addiu $sp, $sp, 0x30