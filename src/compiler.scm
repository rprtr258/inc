(load "tests-driver.scm")
(load "tests-1.1-req.scm")

(define (emit-function-header f)
  (emit "  .text")
  (emit "  .globl ~a" f)
  (emit "  .type ~a, @function" f)
  (emit "~a:" f))

(define (emit-program x)
  (unless (integer? x) (error 'compile-program "not an integer"))
  (emit-function-header "scheme_entry")
  (emit "  movl $~s, %eax" x)
  (emit "  ret"))
