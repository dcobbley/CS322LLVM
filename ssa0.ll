; declare external runtime library functions
declare void @Xprint(i32)

; function definitions
define void @XinitGlobals() {
entry:
  ret void
}

@zero = global i32 0

define void @Xmain() {
  ; int i=0;
  ; int t=0;
  ; while (i<10) {
  ;    t = t+i
  ;    i = i+1
  ; }
  ; print t

entry:
  %i.0 = load i32* @zero
  %t.0 = load i32* @zero
  br label %test

test:
  %i = phi i32 [ 0, %entry ], [ %i.1, %body ]
  %t = phi i32 [ 0, %entry ], [ %t.1, %body ]

  %cmp = icmp slt i32 %i, 10
  br i1 %cmp, label %body, label %done

body:
  %t.1 = add i32 %t, %i
  %i.1 = add i32 %i, 1
  br label %test

done:
  call void @Xprint(i32 %t)
  ret void
}

