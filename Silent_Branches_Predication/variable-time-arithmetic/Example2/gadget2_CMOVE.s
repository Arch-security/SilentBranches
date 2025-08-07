
gadget2_CMOVE：     文件格式 elf64-x86-64


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
    1020:	ff 35 9a 2f 00 00    	push   QWORD PTR [rip+0x2f9a]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 9b 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9b]        # 3fc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]

Disassembly of section .plt.got:

0000000000001030 <dummy@plt>:
    1030:	f3 0f 1e fa          	endbr64 
    1034:	f2 ff 25 95 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f95]        # 3fd0 <dummy>
    103b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001040 <__cxa_finalize@plt>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 ad 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fad]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    104b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001050 <_start>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	31 ed                	xor    ebp,ebp
    1056:	49 89 d1             	mov    r9,rdx
    1059:	5e                   	pop    rsi
    105a:	48 89 e2             	mov    rdx,rsp
    105d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1061:	50                   	push   rax
    1062:	54                   	push   rsp
    1063:	45 31 c0             	xor    r8d,r8d
    1066:	31 c9                	xor    ecx,ecx
    1068:	48 8d 3d 6f 03 00 00 	lea    rdi,[rip+0x36f]        # 13de <main>
    106f:	ff 15 63 2f 00 00    	call   QWORD PTR [rip+0x2f63]        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1075:	f4                   	hlt    
    1076:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
    107d:	00 00 00 

0000000000001080 <deregister_tm_clones>:
    1080:	48 8d 3d 69 30 00 00 	lea    rdi,[rip+0x3069]        # 40f0 <__TMC_END__>
    1087:	48 8d 05 62 30 00 00 	lea    rax,[rip+0x3062]        # 40f0 <__TMC_END__>
    108e:	48 39 f8             	cmp    rax,rdi
    1091:	74 15                	je     10a8 <deregister_tm_clones+0x28>
    1093:	48 8b 05 46 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f46]        # 3fe0 <_ITM_deregisterTMCloneTable>
    109a:	48 85 c0             	test   rax,rax
    109d:	74 09                	je     10a8 <deregister_tm_clones+0x28>
    109f:	ff e0                	jmp    rax
    10a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10a8:	c3                   	ret    
    10a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010b0 <register_tm_clones>:
    10b0:	48 8d 3d 39 30 00 00 	lea    rdi,[rip+0x3039]        # 40f0 <__TMC_END__>
    10b7:	48 8d 35 32 30 00 00 	lea    rsi,[rip+0x3032]        # 40f0 <__TMC_END__>
    10be:	48 29 fe             	sub    rsi,rdi
    10c1:	48 89 f0             	mov    rax,rsi
    10c4:	48 c1 ee 3f          	shr    rsi,0x3f
    10c8:	48 c1 f8 03          	sar    rax,0x3
    10cc:	48 01 c6             	add    rsi,rax
    10cf:	48 d1 fe             	sar    rsi,1
    10d2:	74 14                	je     10e8 <register_tm_clones+0x38>
    10d4:	48 8b 05 15 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f15]        # 3ff0 <_ITM_registerTMCloneTable>
    10db:	48 85 c0             	test   rax,rax
    10de:	74 08                	je     10e8 <register_tm_clones+0x38>
    10e0:	ff e0                	jmp    rax
    10e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    10e8:	c3                   	ret    
    10e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010f0 <__do_global_dtors_aux>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	80 3d 05 30 00 00 00 	cmp    BYTE PTR [rip+0x3005],0x0        # 4100 <completed.8061>
    10fb:	75 2b                	jne    1128 <__do_global_dtors_aux+0x38>
    10fd:	55                   	push   rbp
    10fe:	48 83 3d f2 2e 00 00 	cmp    QWORD PTR [rip+0x2ef2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1105:	00 
    1106:	48 89 e5             	mov    rbp,rsp
    1109:	74 0c                	je     1117 <__do_global_dtors_aux+0x27>
    110b:	48 8b 3d f6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ef6]        # 4008 <__dso_handle>
    1112:	e8 29 ff ff ff       	call   1040 <__cxa_finalize@plt>
    1117:	e8 64 ff ff ff       	call   1080 <deregister_tm_clones>
    111c:	c6 05 dd 2f 00 00 01 	mov    BYTE PTR [rip+0x2fdd],0x1        # 4100 <completed.8061>
    1123:	5d                   	pop    rbp
    1124:	c3                   	ret    
    1125:	0f 1f 00             	nop    DWORD PTR [rax]
    1128:	c3                   	ret    
    1129:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001130 <frame_dummy>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	e9 77 ff ff ff       	jmp    10b0 <register_tm_clones>

0000000000001139 <topTwoIdx>:
    1139:	f3 0f 1e fa          	endbr64 
    113d:	48 c7 01 00 00 00 00 	mov    QWORD PTR [rcx],0x0
    1144:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
    114b:	00 
    114c:	48 85 f6             	test   rsi,rsi
    114f:	74 3f                	je     1190 <topTwoIdx+0x57>
    1151:	b8 00 00 00 00       	mov    eax,0x0
    1156:	eb 15                	jmp    116d <topTwoIdx+0x34>
    1158:	4c 3b 41 08          	cmp    r8,QWORD PTR [rcx+0x8]
    115c:	76 07                	jbe    1165 <topTwoIdx+0x2c>
    115e:	4c 89 41 08          	mov    QWORD PTR [rcx+0x8],r8
    1162:	88 42 01             	mov    BYTE PTR [rdx+0x1],al
    1165:	48 ff c0             	inc    rax
    1168:	48 39 c6             	cmp    rsi,rax
    116b:	74 23                	je     1190 <topTwoIdx+0x57>
    116d:	4c 8b 04 c7          	mov    r8,QWORD PTR [rdi+rax*8]
    1171:	4c 8b 09             	mov    r9,QWORD PTR [rcx]
    1174:	4d 39 c8             	cmp    r8,r9
    1177:	76 df                	jbe    1158 <topTwoIdx+0x1f>
    1179:	4c 89 49 08          	mov    QWORD PTR [rcx+0x8],r9
    117d:	4c 8b 04 c7          	mov    r8,QWORD PTR [rdi+rax*8]
    1181:	4c 89 01             	mov    QWORD PTR [rcx],r8
    1184:	44 0f b6 02          	movzx  r8d,BYTE PTR [rdx]
    1188:	44 88 42 01          	mov    BYTE PTR [rdx+0x1],r8b
    118c:	88 02                	mov    BYTE PTR [rdx],al
    118e:	eb d5                	jmp    1165 <topTwoIdx+0x2c>
    1190:	c3                   	ret    

0000000000001191 <victimFunc>:
    1191:	f3 0f 1e fa          	endbr64 
    1195:	41 57                	push   r15
    1197:	55                   	push   rbp
    1198:	53                   	push   rbx
    1199:	48 89 7c 24 f8       	mov    QWORD PTR [rsp-0x8],rdi
    119e:	0f ae 3d fb 39 00 00 	clflush BYTE PTR [rip+0x39fb]        # 4ba0 <array2+0xa00>
    11a5:	0f ae 3d 3c 2f 00 00 	clflush BYTE PTR [rip+0x2f3c]        # 40e8 <array1_sz>
    11ac:	0f ae e8             	lfence 
    11af:	0f ae f0             	mfence 
    11b2:	0f ae f8             	sfence 
    11b5:	48 8d 74 24 f8       	lea    rsi,[rsp-0x8]
    11ba:	48 8d 3d 27 2f 00 00 	lea    rdi,[rip+0x2f27]        # 40e8 <array1_sz>
    11c1:	4c 8d 05 b8 2f 00 00 	lea    r8,[rip+0x2fb8]        # 4180 <secret>
    11c8:	4c 8d 0d d1 2f 00 00 	lea    r9,[rip+0x2fd1]        # 41a0 <array2>
    11cf:	48 8b 2d fa 2d 00 00 	mov    rbp,QWORD PTR [rip+0x2dfa]        # 3fd0 <dummy>
    11d6:	44 8b 1e             	mov    r11d,DWORD PTR [rsi]
    11d9:	0f ae 3f             	clflush BYTE PTR [rdi]
    11dc:	0f ae f0             	mfence 
    11df:	0f ae e8             	lfence 
    11e2:	8b 07                	mov    eax,DWORD PTR [rdi]
    11e4:	44 39 d8             	cmp    eax,r11d
    11e7:	0f 86 eb 01 00 00    	jbe    13d8 <done>
    11ed:	41 8b 18             	mov    ebx,DWORD PTR [r8]
    11f0:	48 c7 c2 40 00 00 00 	mov    rdx,0x40
    11f7:	48 c7 c1 00 0a 00 00 	mov    rcx,0xa00
    11fe:	41 ba 00 00 00 00    	mov    r10d,0x0
    1204:	41 39 da             	cmp    r10d,ebx
    1207:	48 0f 44 ca          	cmove  rcx,rdx
    120b:	4c 01 c9             	add    rcx,r9
    120e:	4c 8b 39             	mov    r15,QWORD PTR [rcx]
    1211:	4d 01 ff             	add    r15,r15
    1214:	4d 01 ff             	add    r15,r15
    1217:	4d 01 ff             	add    r15,r15
    121a:	4d 01 ff             	add    r15,r15
    121d:	4d 01 ff             	add    r15,r15
    1220:	4d 01 ff             	add    r15,r15
    1223:	4d 01 ff             	add    r15,r15
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
    13a3:	4d 01 ff             	add    r15,r15
    13a6:	4d 01 ff             	add    r15,r15
    13a9:	4d 01 ff             	add    r15,r15
    13ac:	4d 01 ff             	add    r15,r15
    13af:	4d 01 ff             	add    r15,r15
    13b2:	4d 01 ff             	add    r15,r15
    13b5:	4d 01 ff             	add    r15,r15
    13b8:	4d 01 ff             	add    r15,r15
    13bb:	4d 01 ff             	add    r15,r15
    13be:	4d 01 ff             	add    r15,r15
    13c1:	4d 01 ff             	add    r15,r15
    13c4:	4d 01 ff             	add    r15,r15
    13c7:	4d 01 ff             	add    r15,r15
    13ca:	4d 01 ff             	add    r15,r15
    13cd:	4d 01 ff             	add    r15,r15
    13d0:	4d 01 ff             	add    r15,r15
    13d3:	e8 58 fc ff ff       	call   1030 <dummy@plt>

00000000000013d8 <done>:
    13d8:	90                   	nop
    13d9:	5b                   	pop    rbx
    13da:	5d                   	pop    rbp
    13db:	41 5f                	pop    r15
    13dd:	c3                   	ret    

00000000000013de <main>:
    13de:	f3 0f 1e fa          	endbr64 
    13e2:	41 54                	push   r12
    13e4:	55                   	push   rbp
    13e5:	53                   	push   rbx
    13e6:	41 bc 07 00 00 00    	mov    r12d,0x7
    13ec:	48 8b 2d dd 2b 00 00 	mov    rbp,QWORD PTR [rip+0x2bdd]        # 3fd0 <dummy>
    13f3:	e9 83 00 00 00       	jmp    147b <main+0x9d>
    13f8:	e8 94 fd ff ff       	call   1191 <victimFunc>
    13fd:	48 ff cb             	dec    rbx
    1400:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
    1404:	74 46                	je     144c <main+0x6e>
    1406:	48 89 d8             	mov    rax,rbx
    1409:	48 c1 f8 3f          	sar    rax,0x3f
    140d:	48 c1 e8 36          	shr    rax,0x36
    1411:	48 8d 3c 03          	lea    rdi,[rbx+rax*1]
    1415:	81 e7 ff 03 00 00    	and    edi,0x3ff
    141b:	48 29 c7             	sub    rdi,rax
    141e:	48 ff cf             	dec    rdi
    1421:	48 c1 ef 10          	shr    rdi,0x10
    1425:	83 e7 2b             	and    edi,0x2b
    1428:	48 83 f7 03          	xor    rdi,0x3
    142c:	0f ae 3d 6d 37 00 00 	clflush BYTE PTR [rip+0x376d]        # 4ba0 <array2+0xa00>
    1433:	0f ae 7d 00          	clflush BYTE PTR [rbp+0x0]
    1437:	0f ae e8             	lfence 
    143a:	0f ae f0             	mfence 
    143d:	0f ae f8             	sfence 
    1440:	b8 0a 00 00 00       	mov    eax,0xa
    1445:	48 ff c8             	dec    rax
    1448:	75 fb                	jne    1445 <main+0x67>
    144a:	eb ac                	jmp    13f8 <main+0x1a>
    144c:	0f ae e8             	lfence 
    144f:	0f 31                	rdtsc  
    1451:	48 c1 e2 20          	shl    rdx,0x20
    1455:	48 09 d0             	or     rax,rdx
    1458:	0f ae e8             	lfence 
    145b:	b8 00 00 00 00       	mov    eax,0x0
    1460:	e8 cb fb ff ff       	call   1030 <dummy@plt>
    1465:	0f 01 f9             	rdtscp 
    1468:	48 c1 e2 20          	shl    rdx,0x20
    146c:	48 09 d0             	or     rax,rdx
    146f:	0f ae e8             	lfence 
    1472:	41 ff cc             	dec    r12d
    1475:	41 83 fc ff          	cmp    r12d,0xffffffff
    1479:	74 2c                	je     14a7 <main+0xc9>
    147b:	8b 05 9f 2b 00 00    	mov    eax,DWORD PTR [rip+0x2b9f]        # 4020 <KEY>
    1481:	44 89 e1             	mov    ecx,r12d
    1484:	d3 f8                	sar    eax,cl
    1486:	83 e0 01             	and    eax,0x1
    1489:	89 05 f1 2c 00 00    	mov    DWORD PTR [rip+0x2cf1],eax        # 4180 <secret>
    148f:	c6 05 4a 2d 00 00 01 	mov    BYTE PTR [rip+0x2d4a],0x1        # 41e0 <array2+0x40>
    1496:	c6 05 03 37 00 00 28 	mov    BYTE PTR [rip+0x3703],0x28        # 4ba0 <array2+0xa00>
    149d:	bb ff 03 00 00       	mov    ebx,0x3ff
    14a2:	e9 5f ff ff ff       	jmp    1406 <main+0x28>
    14a7:	b8 00 00 00 00       	mov    eax,0x0
    14ac:	5b                   	pop    rbx
    14ad:	5d                   	pop    rbp
    14ae:	41 5c                	pop    r12
    14b0:	c3                   	ret    

Disassembly of section .fini:

00000000000014b4 <_fini>:
    14b4:	f3 0f 1e fa          	endbr64 
    14b8:	48 83 ec 08          	sub    rsp,0x8
    14bc:	48 83 c4 08          	add    rsp,0x8
    14c0:	c3                   	ret    
