;; ;; Globals
;; (module
;;   (import "js" "print" (func $print (param i32)))
;;   (import "console.log" (func $log (param i32)))
;;   (global $g1 (import "js" "g1") (mut i32))
;;   (global $g i32 (i32.const 1))
;;   (func $getG1 (export "getG1")
;;     global.get $g1
;;     call $log
;;   )
;;   (func $setG1 (export "setG1") (param i32)
;;     local.get 0
;;     global.set $g1
;;     call $getG1
;;   )
;; )

;; (module
;;   (import "imports" "console.log" (func $log (param i32)))
;;   (func (param i32) (result i32) 
;;     local.get 0
;;   )
;;   (func $add (export "add") (param i32) (param $p1 i32) 
;;     local.get  0
;;     call 1
;;     local.get $p1
;;     i32.add
;;     call $log
;;   )
;;   ;; (export "add" (func $add))
;; )

;; Memory
;; (module
;;   (import "imports" "console.log" (func $log (param i32)))
;;   (import "imports" "decode" (func $decode (param i32 i32)))
;;   (import "imports" "mem" (memory 1))
;;   (data (i32.const 0) "Hello, World!")

;;   (func (export "helloWorld")
;;     i32.const 0 
;;     i32.const 13
;;     call $decode
;;   )
  
;;   (func (export "populateMemory")
;;     i32.const 0
;;     i32.const 123
;;     i32.store

;;     i32.const 10
;;     i32.const 23
;;     i32.store
;;   )
;;   (func (export "getAt") (param i32)
;;     local.get 0
;;     i32.load
;;     call $log
;;   )
;; )


;; (module
;; (import "env" "log_bool" (func $log_bool (param i32)))
;; (func $main
;; ;; load ‘10‘ and ‘2‘ onto the stack
;; i32.const 10
;; i32.const 2
;; i32.eq ;; check if ‘10‘ is equal to ‘2‘
;; call $log_bool ;; log the result
;; )
;; (start $main)
;; )

;; (module
;;   (import "imports" "console.log" (func $log (param i64)))
  
;;   (func $get (param $key i64) (param $lookup i64) (param $val i64) (param $left i64) (param $right i64) (result i64)
;;     local.get $key
;;     local.get $lookup
;;     i64.lt_s
;;     i64.extend_i32_s
;;     ;; (if (result i64)
;;     ;;   (then 
;;     ;;     (local.get $val)
;;     ;;     return
;;     ;;   )
;;     ;;   (else
;;     ;;     (local.get $key)
;;     ;;     return
;;     ;;   )
;;     ;; )
    
;;     return
;;   )
;;   (func (export "main")
;;     i64.const 1
;;     i64.const 2
;;     i64.const 3
;;     i64.const 4
;;     i64.const 5
;;     call $get
;;     call $log
;;   )
;; )

(module 
  (func $fac (param $index i32)(result i32)
    
     (if (result i32)  (i32.eq (local.get $index) (i32.const 0)) 
    (then
      i32.const 1
    )
    (else
      (i32.mul 
      (local.get $index) 
      (call $fac (i32.sub (local.get $index) (i32.const 1)) ))
    )
    
     )
  )

  ;; (func $factorial (param $index i32)(result i32)

  ;;   (if (result i32) (i32.eq(local.get $index)(i32.const 0))
    
  ;;    (then
  ;;           i32.const 1
  ;;    )

  ;;    (else

  ;;      i32.mul 
  ;;           (local.get $index)
  ;;            (call $factorial(i32.sub(local.get $index)(i32.const 1)))
        
  ;;    )

  ;;   )
  ;; )
)