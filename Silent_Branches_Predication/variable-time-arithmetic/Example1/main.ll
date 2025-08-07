; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@global_variable = dso_local global i64 15, align 8
@array = internal global [262144 x i8] zeroinitializer, align 512
@dummy1 = dso_local local_unnamed_addr global i32 0, align 4
@start = dso_local local_unnamed_addr global i64 0, align 8
@end = dso_local local_unnamed_addr global i64 0, align 8
@.str = private unnamed_addr constant [10 x i8] c"%d, %3ld\0A\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"secret : %3d \00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Guess : %3d, --> %d\0A\00", align 1
@tmp = dso_local local_unnamed_addr global i64 0, align 8
@value = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@fast = dso_local local_unnamed_addr global i64 0, align 8
@slow = dso_local local_unnamed_addr global i64 0, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @victim_function(i32 noundef %secret, i32 noundef %bit, i32 noundef %isPublic) local_unnamed_addr #0 {
entry:
  %secret.addr = alloca i32, align 4
  %bit.addr = alloca i32, align 4
  %isPublic.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %tmp = alloca i64, align 8
  %tmp2 = alloca double, align 8
  store i32 %secret, ptr %secret.addr, align 4, !tbaa !5
  store i32 %bit, ptr %bit.addr, align 4, !tbaa !5
  store i32 %isPublic, ptr %isPublic.addr, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr %i) #6
  store volatile i32 0, ptr %i, align 4, !tbaa !5
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load volatile i32, ptr %i, align 4, !tbaa !5
  %cmp = icmp slt i32 %0, 200
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  call void @llvm.lifetime.end.p0(i64 4, ptr %i) #6
  br label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load volatile i32, ptr %i, align 4, !tbaa !5
  %inc = add nsw i32 %1, 1
  store volatile i32 %inc, ptr %i, align 4, !tbaa !5
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond.cleanup
  call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !12
  %2 = load i32, ptr %isPublic.addr, align 4, !tbaa !5
  %3 = load i8, ptr getelementptr inbounds ([262144 x i8], ptr @array, i64 0, i64 2048), align 512, !tbaa !13
  %conv = zext i8 %3 to i32
  %cmp1 = icmp slt i32 %2, %conv
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @llvm.lifetime.start.p0(i64 8, ptr %tmp) #6
  %4 = load i32, ptr %secret.addr, align 4, !tbaa !5
  %5 = load i32, ptr %bit.addr, align 4, !tbaa !5
  %shr = ashr i32 %4, %5
  %and = and i32 %shr, 1
  %tobool = icmp ne i32 %and, 0
  %6 = zext i1 %tobool to i64
  %cond = select i1 %tobool, i64 4679240012837945344, i64 4748437441418039
  store i64 %cond, ptr %tmp, align 8, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 8, ptr %tmp2) #6
  %7 = load i64, ptr %tmp, align 8, !tbaa !14
  %8 = load i64, ptr %tmp, align 8, !tbaa !14
  %mul = mul i64 %7, %8
  %conv3 = uitofp i64 %mul to double
  store volatile double %conv3, ptr %tmp2, align 8, !tbaa !16
  call void asm sideeffect ".REPT 38\0ASQRTSD %xmm0, %xmm0\0AMULSD %xmm0, %xmm0\0A.endr\0A", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !18
  %9 = load volatile i64, ptr @global_variable, align 8, !tbaa !14
  call void @llvm.lifetime.end.p0(i64 8, ptr %tmp2) #6
  call void @llvm.lifetime.end.p0(i64 8, ptr %tmp) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  ret double 0.000000e+00
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %argc, ptr noundef readonly captures(none) %argv) local_unnamed_addr #2 {
entry:
  %tmp_value1 = alloca double, align 8
  %tmp_value = alloca double, align 8
  %tmp_value2 = alloca double, align 8
  %result = alloca [8 x i64], align 16
  %bit_value = alloca [8 x i64], align 16
  %i3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %tmp_value1)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %tmp_value)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %tmp_value2)
  %arrayidx = getelementptr inbounds nuw i8, ptr %argv, i64 8
  %0 = load ptr, ptr %arrayidx, align 8, !tbaa !19
  %call.i = tail call i64 @strtol(ptr noundef nonnull captures(none) %0, ptr noundef null, i32 noundef 10) #6
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !22
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 512 dereferenceable(262144) @array, i8 0, i64 262144, i1 false), !tbaa !13
  %conv.i = trunc i64 %call.i to i32
  store i8 10, ptr getelementptr inbounds nuw (i8, ptr @array, i64 2048), align 512, !tbaa !13
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !23
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %result) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %result, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %bit_value) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(64) %bit_value, i8 0, i64 64, i1 false)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i3)
  store volatile i32 0, ptr %i3, align 4, !tbaa !5
  %i3.0.i3.0.i3.0.i3.0.59 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %cmp560 = icmp slt i32 %i3.0.i3.0.i3.0.i3.0.59, 8
  br i1 %cmp560, label %for.body8, label %for.cond.cleanup7

for.cond.cleanup7:                                ; preds = %for.body8, %entry
  %guess.0.lcssa = phi i32 [ 0, %entry ], [ %or, %for.body8 ]
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i3)
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !24
  br label %for.body29

for.body8:                                        ; preds = %entry, %for.body8
  %guess.061 = phi i32 [ %or, %for.body8 ], [ 0, %entry ]
  %call9 = tail call double @victim_function(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  store volatile double 0.000000e+00, ptr %tmp_value1, align 8, !tbaa !16
  %call10 = tail call double @victim_function(i32 noundef 0, i32 noundef 0, i32 noundef 0)
  store volatile double 0.000000e+00, ptr %tmp_value2, align 8, !tbaa !16
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !25
  tail call void asm sideeffect "clflush 0($0)", "r,~{dirflag},~{fpsr},~{flags}"(ptr nonnull getelementptr inbounds nuw (i8, ptr @array, i64 2048)) #6, !srcloc !26
  tail call void asm sideeffect "clflush 0($0)", "r,~{dirflag},~{fpsr},~{flags}"(ptr nonnull @global_variable) #6, !srcloc !27
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !28
  %i3.0.i3.0.i3.0.i3.0.47 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %call11 = tail call double @victim_function(i32 noundef %conv.i, i32 noundef %i3.0.i3.0.i3.0.i3.0.47, i32 noundef 100)
  store volatile double 0.000000e+00, ptr %tmp_value, align 8, !tbaa !16
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !29
  %1 = tail call { i64, i32 } @llvm.x86.rdtscp()
  %2 = extractvalue { i64, i32 } %1, 1
  store i32 %2, ptr @dummy1, align 4
  %3 = extractvalue { i64, i32 } %1, 0
  store i64 %3, ptr @start, align 8, !tbaa !14
  %4 = load volatile i8, ptr @global_variable, align 8, !tbaa !13
  %5 = tail call { i64, i32 } @llvm.x86.rdtscp()
  %6 = extractvalue { i64, i32 } %5, 1
  store i32 %6, ptr @dummy1, align 4
  %7 = extractvalue { i64, i32 } %5, 0
  %8 = load i64, ptr @start, align 8, !tbaa !14
  %sub = sub i64 %7, %8
  store i64 %sub, ptr @end, align 8, !tbaa !14
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !30
  %9 = load i64, ptr @end, align 8, !tbaa !14
  %cmp14 = icmp ult i64 %9, 131
  %cond = zext i1 %cmp14 to i32
  %i3.0.i3.0.i3.0.i3.0.48 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %idxprom16 = sext i32 %i3.0.i3.0.i3.0.i3.0.48 to i64
  %arrayidx17 = getelementptr inbounds [8 x i64], ptr %result, i64 0, i64 %idxprom16
  store i64 %9, ptr %arrayidx17, align 8, !tbaa !14
  %conv18 = zext i1 %cmp14 to i64
  %i3.0.i3.0.i3.0.i3.0.49 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %idxprom19 = sext i32 %i3.0.i3.0.i3.0.i3.0.49 to i64
  %arrayidx20 = getelementptr inbounds [8 x i64], ptr %bit_value, i64 0, i64 %idxprom19
  store i64 %conv18, ptr %arrayidx20, align 8, !tbaa !14
  %i3.0.i3.0.i3.0.i3.0.50 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %shl = shl nuw i32 %cond, %i3.0.i3.0.i3.0.i3.0.50
  %or = or i32 %shl, %guess.061
  tail call void asm sideeffect "lfence;\0Amfence;\0Asfence", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !31
  tail call void asm sideeffect ".rept 4096;\0Anop;\0A.endr", "~{dirflag},~{fpsr},~{flags}"() #6, !srcloc !32
  %i3.0.i3.0.i3.0.i3.0.51 = load volatile i32, ptr %i3, align 4, !tbaa !5
  %inc22 = add nsw i32 %i3.0.i3.0.i3.0.i3.0.51, 1
  store volatile i32 %inc22, ptr %i3, align 4, !tbaa !5
  %i3.0.i3.0.i3.0.i3.0. = load volatile i32, ptr %i3, align 4, !tbaa !5
  %cmp5 = icmp slt i32 %i3.0.i3.0.i3.0.i3.0., 8
  br i1 %cmp5, label %for.body8, label %for.cond.cleanup7, !llvm.loop !33

for.cond.cleanup28:                               ; preds = %for.body29
  %call38 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %conv.i)
  %cmp39 = icmp eq i32 %guess.0.lcssa, %conv.i
  %cond41 = zext i1 %cmp39 to i32
  %call42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %guess.0.lcssa, i32 noundef %cond41)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %bit_value) #6
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %result) #6
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %tmp_value2)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %tmp_value)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %tmp_value1)
  ret i32 0

for.body29:                                       ; preds = %for.cond.cleanup7, %for.body29
  %indvars.iv = phi i64 [ 0, %for.cond.cleanup7 ], [ %indvars.iv.next, %for.body29 ]
  %arrayidx31 = getelementptr inbounds nuw [8 x i64], ptr %bit_value, i64 0, i64 %indvars.iv
  %10 = load i64, ptr %arrayidx31, align 8, !tbaa !14
  %arrayidx33 = getelementptr inbounds nuw [8 x i64], ptr %result, i64 0, i64 %indvars.iv
  %11 = load i64, ptr %arrayidx33, align 8, !tbaa !14
  %call34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %10, i64 noundef %11)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 8
  br i1 %exitcond.not, label %for.cond.cleanup28, label %for.body29, !llvm.loop !34
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #3

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr noundef readonly captures(none), ...) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn
declare i64 @strtol(ptr noundef readonly, ptr noundef captures(none), i32 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare { i64, i32 } @llvm.x86.rdtscp() #6

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 22.0.0git (git@github.com:llvm/llvm-project.git ab6923b9b7a75de79ee06b400ae73771e130339e)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{i64 2152067583, i64 2152067593, i64 2152067602}
!13 = !{!7, !7, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"long", !7, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"double", !7, i64 0}
!18 = !{i64 932, i64 952, i64 982, i64 1011}
!19 = !{!20, !20, i64 0}
!20 = !{!"p1 omnipotent char", !21, i64 0}
!21 = !{!"any pointer", !7, i64 0}
!22 = !{i64 2152067631, i64 2152067641, i64 2152067650}
!23 = !{i64 2152067679, i64 2152067689, i64 2152067698}
!24 = !{i64 2152068099, i64 2152068109, i64 2152068118}
!25 = !{i64 2152067722, i64 2152067732, i64 2152067741}
!26 = !{i64 2152067777}
!27 = !{i64 2152067862}
!28 = !{i64 2152067927, i64 2152067937, i64 2152067946}
!29 = !{i64 2152067970, i64 2152067980, i64 2152067989}
!30 = !{i64 2152068013, i64 2152068023, i64 2152068032}
!31 = !{i64 2152068056, i64 2152068066, i64 2152068075}
!32 = !{i64 2081, i64 2095, i64 2101}
!33 = distinct !{!33, !10, !11}
!34 = distinct !{!34, !10, !11}
