glabel func_80283B6C
/* 1271AC 80283B6C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 1271B0 80283B70 AFBF0014 */  sw    $ra, 0x14($sp)
/* 1271B4 80283B74 0C03282E */  jal   func_800CA0B8
/* 1271B8 80283B78 AFA40018 */   sw    $a0, 0x18($sp)
/* 1271BC 80283B7C 3C051900 */  lui   $a1, (0x19009005 >> 16) # lui $a1, 0x1900
/* 1271C0 80283B80 34A59005 */  ori   $a1, (0x19009005 & 0xFFFF) # ori $a1, $a1, 0x9005
/* 1271C4 80283B84 0C032418 */  jal   func_800C9060
/* 1271C8 80283B88 00002025 */   move  $a0, $zero
/* 1271CC 80283B8C 0C032828 */  jal   func_800CA0A0
/* 1271D0 80283B90 00000000 */   nop   
/* 1271D4 80283B94 8FBF0014 */  lw    $ra, 0x14($sp)
/* 1271D8 80283B98 27BD0018 */  addiu $sp, $sp, 0x18
/* 1271DC 80283B9C 03E00008 */  jr    $ra
/* 1271E0 80283BA0 00000000 */   nop   