glabel func_80043A54
/* 044654 80043A54 00001825 */  move  $v1, $zero
/* 044658 80043A58 00801025 */  move  $v0, $a0
/* 04465C 80043A5C 24060001 */  li    $a2, 1
.L80043A60:
/* 044660 80043A60 24630001 */  addiu $v1, $v1, 1
/* 044664 80043A64 04410003 */  bgez  $v0, .L80043A74
/* 044668 80043A68 00022843 */   sra   $a1, $v0, 1
/* 04466C 80043A6C 24410001 */  addiu $at, $v0, 1
/* 044670 80043A70 00012843 */  sra   $a1, $at, 1
.L80043A74:
/* 044674 80043A74 14A6FFFA */  bne   $a1, $a2, .L80043A60
/* 044678 80043A78 00A01025 */   move  $v0, $a1
/* 04467C 80043A7C 03E00008 */  jr    $ra
/* 044680 80043A80 00601025 */   move  $v0, $v1