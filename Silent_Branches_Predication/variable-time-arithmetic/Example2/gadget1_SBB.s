
gadget1_SBB：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   QWORD PTR [rip+0x2f92]        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f93]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <.plt>
    103f:	90                   	nop

Disassembly of section .plt.got:

0000000000001040 <dummy@plt>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 85 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f85]        # 3fd0 <dummy>
    104b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9d]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001060 <__printf_chk@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 3fc8 <__printf_chk@GLIBC_2.3.4>
    106b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	31 ed                	xor    ebp,ebp
    1076:	49 89 d1             	mov    r9,rdx
    1079:	5e                   	pop    rsi
    107a:	48 89 e2             	mov    rdx,rsp
    107d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1081:	50                   	push   rax
    1082:	54                   	push   rsp
    1083:	45 31 c0             	xor    r8d,r8d
    1086:	31 c9                	xor    ecx,ecx
    1088:	48 8d 3d 1f 03 00 00 	lea    rdi,[rip+0x31f]        # 13ae <main>
    108f:	ff 15 43 2f 00 00    	call   QWORD PTR [rip+0x2f43]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1095:	f4                   	hlt    
    1096:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    109d:	00 00 00 

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 49 30 00 00 	lea    rdi,[rip+0x3049]        # 40f0 <__TMC_END__>
    10a7:	48 8d 05 42 30 00 00 	lea    rax,[rip+0x3042]        # 40f0 <__TMC_END__>
    10ae:	48 39 f8             	cmp    rax,rdi
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 26 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f26]        # 3fe0 <_ITM_deregisterTMCloneTable>
    10ba:	48 85 c0             	test   rax,rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    rax
    10c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10c8:	c3                   	ret    
    10c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 19 30 00 00 	lea    rdi,[rip+0x3019]        # 40f0 <__TMC_END__>
    10d7:	48 8d 35 12 30 00 00 	lea    rsi,[rip+0x3012]        # 40f0 <__TMC_END__>
    10de:	48 29 fe             	sub    rsi,rdi
    10e1:	48 89 f0             	mov    rax,rsi
    10e4:	48 c1 ee 3f          	shr    rsi,0x3f
    10e8:	48 c1 f8 03          	sar    rax,0x3
    10ec:	48 01 c6             	add    rsi,rax
    10ef:	48 d1 fe             	sar    rsi,1
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 f5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ef5]        # 3ff0 <_ITM_registerTMCloneTable>
    10fb:	48 85 c0             	test   rax,rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    rax
    1102:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1108:	c3                   	ret    
    1109:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	80 3d e5 2f 00 00 00 	cmp    BYTE PTR [rip+0x2fe5],0x0        # 4100 <completed.8061>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   rbp
    111e:	48 83 3d d2 2e 00 00 	cmp    QWORD PTR [rip+0x2ed2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1125:	00 
    1126:	48 89 e5             	mov    rbp,rsp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d d6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ed6]        # 4008 <__dso_handle>
    1132:	e8 19 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 bd 2f 00 00 01 	mov    BYTE PTR [rip+0x2fbd],0x1        # 4100 <completed.8061>
    1143:	5d                   	pop    rbp
    1144:	c3                   	ret    
    1145:	0f 1f 00             	nop    DWORD PTR [rax]
    1148:	c3                   	ret    
    1149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>

0000000000001159 <topTwoIdx>:
    1159:	f3 0f 1e fa          	endbr64 
    115d:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
    1164:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
    116b:	00 
    116c:	48 85 f6             	test   rsi,rsi
    116f:	74 3f                	je     11b0 <topTwoIdx+0x57>
    1171:	b8 00 00 00 00       	mov    eax,0x0
    1176:	eb 15                	jmp    118d <topTwoIdx+0x34>
    1178:	4c 3b 41 08          	cmp    r8,QWORD PTR [rcx+0x8]
    117c:	76 07                	jbe    1185 <topTwoIdx+0x2c>
    117e:	4c 89 41 08          	mov    QWORD PTR [rcx+0x8],r8
    1182:	88 42 01             	mov    BYTE PTR [rdx+0x1],al
    1185:	48 ff c0             	inc    rax
    1188:	48 39 c6             	cmp    rsi,rax
    118b:	74 23                	je     11b0 <topTwoIdx+0x57>
    118d:	4c 8b 04 c7          	mov    r8,QWORD PTR [rdi+rax*8]
    1191:	4c 8b 09             	mov    r9,QWORD PTR [rcx]
    1194:	4d 39 c8             	cmp    r8,r9
    1197:	76 df                	jbe    1178 <topTwoIdx+0x1f>
    1199:	4c 89 49 08          	mov    QWORD PTR [rcx+0x8],r9
    119d:	4c 8b 04 c7          	mov    r8,QWORD PTR [rdi+rax*8]
    11a1:	4c 89 01             	mov    QWORD PTR [rcx],r8
    11a4:	44 0f b6 02          	movzx  r8d,BYTE PTR [rdx]
    11a8:	44 88 42 01          	mov    BYTE PTR [rdx+0x1],r8b
    11ac:	88 02                	mov    BYTE PTR [rdx],al
    11ae:	eb d5                	jmp    1185 <topTwoIdx+0x2c>
    11b0:	c3                   	ret    

00000000000011b1 <victimFunc>:
    11b1:	f3 0f 1e fa          	endbr64 
    11b5:	0f ae 3d 2c 2f 00 00 	clflush BYTE PTR [rip+0x2f2c]        # 40e8 <array1_sz>
    11bc:	0f ae 3d dd 39 00 00 	clflush BYTE PTR [rip+0x39dd]        # 4ba0 <array2+0xa00>
    11c3:	0f b6 05 d6 30 00 00 	movzx  eax,BYTE PTR [rip+0x30d6]        # 42a0 <array2+0x100>
    11ca:	22 05 d0 2f 00 00    	and    al,BYTE PTR [rip+0x2fd0]        # 41a0 <array2>
    11d0:	0f b6 c0             	movzx  eax,al
    11d3:	23 05 c7 6f 00 00    	and    eax,DWORD PTR [rip+0x6fc7]        # 81a0 <temp>
    11d9:	21 f0                	and    eax,esi
    11db:	89 05 bf 6f 00 00    	mov    DWORD PTR [rip+0x6fbf],eax        # 81a0 <temp>
    11e1:	0f ae 3d b8 39 00 00 	clflush BYTE PTR [rip+0x39b8]        # 4ba0 <array2+0xa00>
    11e8:	0f ae e8             	lfence 
    11eb:	0f ae f0             	mfence 
    11ee:	0f ae f8             	sfence 
    11f1:	48 39 3d f0 2e 00 00 	cmp    QWORD PTR [rip+0x2ef0],rdi        # 40e8 <array1_sz>
    11f8:	0f 86 af 01 00 00    	jbe    13ad <victimFunc+0x1fc>
    11fe:	41 57                	push   r15
    1200:	41 55                	push   r13
    1202:	48 83 fe 01          	cmp    rsi,0x1
    1206:	19 c0                	sbb    eax,eax
    1208:	83 e0 dc             	and    eax,0xffffffdc
    120b:	83 c0 28             	add    eax,0x28
    120e:	89 05 0c 2f 00 00    	mov    DWORD PTR [rip+0x2f0c],eax        # 4120 <acc>
    1214:	c1 e0 06             	shl    eax,0x6
    1217:	48 98                	cdqe   
    1219:	48 8d 15 80 2f 00 00 	lea    rdx,[rip+0x2f80]        # 41a0 <array2>
    1220:	48 01 d0             	add    rax,rdx
    1223:	4c 8b 38             	mov    r15,QWORD PTR [rax]
    1226:	4d 01 ff             	add    r15,r15
    1229:	4d 01 ff             	add    r15,r15
    122c:	4d 01 ff             	add    r15,r15
    122f:	4d 01 ff             	add    r15,r15
    1232:	4d 01 ff             	add    r15,r15
    1235:	4d 01 ff             	add    r15,r15
    1238:	4d 01 ff             	add    r15,r15
    123b:	4d 01 ff             	add    r15,r15
    123e:	4d 01 ff             	add    r15,r15
    1241:	4d 01 ff             	add    r15,r15
    1244:	4d 01 ff             	add    r15,r15
    1247:	4d 01 ff             	add    r15,r15
    124a:	4d 01 ff             	add    r15,r15
    124d:	4d 01 ff             	add    r15,r15
    1250:	4d 01 ff             	add    r15,r15
    1253:	4d 01 ff             	add    r15,r15
    1256:	4d 01 ff             	add    r15,r15
    1259:	4d 01 ff             	add    r15,r15
    125c:	4d 01 ff             	add    r15,r15
    125f:	4d 01 ff             	add    r15,r15
    1262:	4d 01 ff             	add    r15,r15
    1265:	4d 01 ff             	add    r15,r15
    1268:	4d 01 ff             	add    r15,r15
    126b:	4d 01 ff             	add    r15,r15
    126e:	4d 01 ff             	add    r15,r15
    1271:	4d 01 ff             	add    r15,r15
    1274:	4d 01 ff             	add    r15,r15
    1277:	4d 01 ff             	add    r15,r15
    127a:	4d 01 ff             	add    r15,r15
    127d:	4d 01 ff             	add    r15,r15
    1280:	4d 01 ff             	add    r15,r15
    1283:	4d 01 ff             	add    r15,r15
    1286:	4d 01 ff             	add    r15,r15
    1289:	4d 01 ff             	add    r15,r15
    128c:	4d 01 ff             	add    r15,r15
    128f:	4d 01 ff             	add    r15,r15
    1292:	4d 01 ff             	add    r15,r15
    1295:	4d 01 ff             	add    r15,r15
    1298:	4d 01 ff             	add    r15,r15
    129b:	4d 01 ff             	add    r15,r15
    129e:	4d 01 ff             	add    r15,r15
    12a1:	4d 01 ff             	add    r15,r15
    12a4:	4d 01 ff             	add    r15,r15
    12a7:	4d 01 ff             	add    r15,r15
    12aa:	4d 01 ff             	add    r15,r15
    12ad:	4d 01 ff             	add    r15,r15
    12b0:	4d 01 ff             	add    r15,r15
    12b3:	4d 01 ff             	add    r15,r15
    12b6:	4d 01 ff             	add    r15,r15
    12b9:	4d 01 ff             	add    r15,r15
    12bc:	4d 01 ff             	add    r15,r15
    12bf:	4d 01 ff             	add    r15,r15
    12c2:	4d 01 ff             	add    r15,r15
    12c5:	4d 01 ff             	add    r15,r15
    12c8:	4d 01 ff             	add    r15,r15
    12cb:	4d 01 ff             	add    r15,r15
    12ce:	4d 01 ff             	add    r15,r15
    12d1:	4d 01 ff             	add    r15,r15
    12d4:	4d 01 ff             	add    r15,r15
    12d7:	4d 01 ff             	add    r15,r15
    12da:	4d 01 ff             	add    r15,r15
    12dd:	4d 01 ff             	add    r15,r15
    12e0:	4d 01 ff             	add    r15,r15
    12e3:	4d 01 ff             	add    r15,r15
    12e6:	4d 01 ff             	add    r15,r15
    12e9:	4d 01 ff             	add    r15,r15
    12ec:	4d 01 ff             	add    r15,r15
    12ef:	4d 01 ff             	add    r15,r15
    12f2:	4d 01 ff             	add    r15,r15
    12f5:	4d 01 ff             	add    r15,r15
    12f8:	4d 01 ff             	add    r15,r15
    12fb:	4d 01 ff             	add    r15,r15
    12fe:	4d 01 ff             	add    r15,r15
    1301:	4d 01 ff             	add    r15,r15
    1304:	4d 01 ff             	add    r15,r15
    1307:	4d 01 ff             	add    r15,r15
    130a:	4d 01 ff             	add    r15,r15
    130d:	4d 01 ff             	add    r15,r15
    1310:	4d 01 ff             	add    r15,r15
    1313:	4d 01 ff             	add    r15,r15
    1316:	4d 01 ff             	add    r15,r15
    1319:	4d 01 ff             	add    r15,r15
    131c:	4d 01 ff             	add    r15,r15
    131f:	4d 01 ff             	add    r15,r15
    1322:	4d 01 ff             	add    r15,r15
    1325:	4d 01 ff             	add    r15,r15
    1328:	4d 01 ff             	add    r15,r15
    132b:	4d 01 ff             	add    r15,r15
    132e:	4d 01 ff             	add    r15,r15
    1331:	4d 01 ff             	add    r15,r15
    1334:	4d 01 ff             	add    r15,r15
    1337:	4d 01 ff             	add    r15,r15
    133a:	4d 01 ff             	add    r15,r15
    133d:	4d 01 ff             	add    r15,r15
    1340:	4d 01 ff             	add    r15,r15
    1343:	4d 01 ff             	add    r15,r15
    1346:	4d 01 ff             	add    r15,r15
    1349:	4d 01 ff             	add    r15,r15
    134c:	4d 01 ff             	add    r15,r15
    134f:	4d 01 ff             	add    r15,r15
    1352:	4d 01 ff             	add    r15,r15
    1355:	4d 01 ff             	add    r15,r15
    1358:	4d 01 ff             	add    r15,r15
    135b:	4d 01 ff             	add    r15,r15
    135e:	4d 01 ff             	add    r15,r15
    1361:	4d 01 ff             	add    r15,r15
    1364:	4d 01 ff             	add    r15,r15
    1367:	4d 01 ff             	add    r15,r15
    136a:	4d 01 ff             	add    r15,r15
    136d:	4d 01 ff             	add    r15,r15
    1370:	4d 01 ff             	add    r15,r15
    1373:	4d 01 ff             	add    r15,r15
    1376:	4d 01 ff             	add    r15,r15
    1379:	4d 01 ff             	add    r15,r15
    137c:	4d 01 ff             	add    r15,r15
    137f:	4d 01 ff             	add    r15,r15
    1382:	4d 01 ff             	add    r15,r15
    1385:	4d 01 ff             	add    r15,r15
    1388:	4d 01 ff             	add    r15,r15
    138b:	4d 01 ff             	add    r15,r15
    138e:	4d 01 ff             	add    r15,r15
    1391:	4d 01 ff             	add    r15,r15
    1394:	4d 01 ff             	add    r15,r15
    1397:	4d 01 ff             	add    r15,r15
    139a:	4d 01 ff             	add    r15,r15
    139d:	4d 01 ff             	add    r15,r15
    13a0:	4d 01 ff             	add    r15,r15
    13a3:	e8 98 fc ff ff       	call   1040 <dummy@plt>
    13a8:	41 5d                	pop    r13
    13aa:	41 5f                	pop    r15
    13ac:	c3                   	ret    
    13ad:	c3                   	ret    

00000000000013ae <main>:
    13ae:	f3 0f 1e fa          	endbr64 
    13b2:	41 54                	push   r12
    13b4:	55                   	push   rbp
    13b5:	53                   	push   rbx
    13b6:	41 bc 07 00 00 00    	mov    r12d,0x7
    13bc:	48 8b 2d 0d 2c 00 00 	mov    rbp,QWORD PTR [rip+0x2c0d]        # 3fd0 <dummy>
    13c3:	e9 c3 00 00 00       	jmp    148b <main+0xdd>
    13c8:	e8 e4 fd ff ff       	call   11b1 <victimFunc>
    13cd:	48 ff cb             	dec    rbx
    13d0:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
    13d4:	74 5d                	je     1433 <main+0x85>
    13d6:	48 89 d8             	mov    rax,rbx
    13d9:	48 c1 f8 3f          	sar    rax,0x3f
    13dd:	48 c1 e8 36          	shr    rax,0x36
    13e1:	48 8d 3c 03          	lea    rdi,[rbx+rax*1]
    13e5:	81 e7 ff 03 00 00    	and    edi,0x3ff
    13eb:	48 29 c7             	sub    rdi,rax
    13ee:	48 ff cf             	dec    rdi
    13f1:	48 89 fe             	mov    rsi,rdi
    13f4:	66 be 00 00          	mov    si,0x0
    13f8:	48 c1 ef 10          	shr    rdi,0x10
    13fc:	48 89 f0             	mov    rax,rsi
    13ff:	48 09 f8             	or     rax,rdi
    1402:	83 e7 2b             	and    edi,0x2b
    1405:	48 83 f7 03          	xor    rdi,0x3
    1409:	48 63 35 70 2d 00 00 	movsxd rsi,DWORD PTR [rip+0x2d70]        # 4180 <secret>
    1410:	48 21 c6             	and    rsi,rax
    1413:	0f ae 3d 86 37 00 00 	clflush BYTE PTR [rip+0x3786]        # 4ba0 <array2+0xa00>
    141a:	0f ae 7d 00          	clflush BYTE PTR [rbp+0x0]
    141e:	0f ae e8             	lfence 
    1421:	0f ae f0             	mfence 
    1424:	0f ae f8             	sfence 
    1427:	b8 0a 00 00 00       	mov    eax,0xa
    142c:	48 ff c8             	dec    rax
    142f:	75 fb                	jne    142c <main+0x7e>
    1431:	eb 95                	jmp    13c8 <main+0x1a>
    1433:	0f ae e8             	lfence 
    1436:	0f 31                	rdtsc  
    1438:	48 c1 e2 20          	shl    rdx,0x20
    143c:	48 09 d0             	or     rax,rdx
    143f:	0f ae e8             	lfence 
    1442:	48 89 c3             	mov    rbx,rax
    1445:	b8 00 00 00 00       	mov    eax,0x0
    144a:	e8 f1 fb ff ff       	call   1040 <dummy@plt>
    144f:	0f 01 f9             	rdtscp 
    1452:	48 c1 e2 20          	shl    rdx,0x20
    1456:	48 09 d0             	or     rax,rdx
    1459:	0f ae e8             	lfence 
    145c:	48 29 d8             	sub    rax,rbx
    145f:	48 89 c1             	mov    rcx,rax
    1462:	48 83 f8 78          	cmp    rax,0x78
    1466:	0f 97 c2             	seta   dl
    1469:	0f b6 d2             	movzx  edx,dl
    146c:	48 8d 35 91 0b 00 00 	lea    rsi,[rip+0xb91]        # 2004 <_IO_stdin_used+0x4>
    1473:	bf 01 00 00 00       	mov    edi,0x1
    1478:	b8 00 00 00 00       	mov    eax,0x0
    147d:	e8 de fb ff ff       	call   1060 <__printf_chk@plt>
    1482:	41 ff cc             	dec    r12d
    1485:	41 83 fc ff          	cmp    r12d,0xffffffff
    1489:	74 2c                	je     14b7 <main+0x109>
    148b:	8b 05 8f 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b8f]        # 4020 <KEY>
    1491:	44 89 e1             	mov    ecx,r12d
    1494:	d3 f8                	sar    eax,cl
    1496:	83 e0 01             	and    eax,0x1
    1499:	89 05 e1 2c 00 00    	mov    DWORD PTR [rip+0x2ce1],eax        # 4180 <secret>
    149f:	c6 05 fa 2d 00 00 01 	mov    BYTE PTR [rip+0x2dfa],0x1        # 42a0 <array2+0x100>
    14a6:	c6 05 f3 36 00 00 28 	mov    BYTE PTR [rip+0x36f3],0x28        # 4ba0 <array2+0xa00>
    14ad:	bb ff 03 00 00       	mov    ebx,0x3ff
    14b2:	e9 1f ff ff ff       	jmp    13d6 <main+0x28>
    14b7:	b8 00 00 00 00       	mov    eax,0x0
    14bc:	5b                   	pop    rbx
    14bd:	5d                   	pop    rbp
    14be:	41 5c                	pop    r12
    14c0:	c3                   	ret    

Disassembly of section .fini:

00000000000014c4 <_fini>:
    14c4:	f3 0f 1e fa          	endbr64 
    14c8:	48 83 ec 08          	sub    rsp,0x8
    14cc:	48 83 c4 08          	add    rsp,0x8
    14d0:	c3                   	ret    
