(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (mul-interval x y)
  (let (
    (xlo (lower-bound x))
    (xhi (upper-bound x))
    (ylo (lower-bound y))
    (yhi (upper-bound y)))
  (cond 
    ((and (>= xlo 0)(>= xhi 0)(>= ylo 0)(>= yhi 0))
      (make-interval (* xlo ylo) (* xhi yhi)))
    ((and (>= xlo 0)(>= xhi 0)(<= ylo 0)(>= yhi 0))
      (make-interval (* xhi ylo) (* xhi yhi)))
    ((and (>= xlo 0)(>= xhi 0)(<= ylo 0)(<= yhi 0))
      (make-interval (* xhi ylo) (* xlo yhi)))
    ((and (<= xlo 0)(>= xhi 0)(>= ylo 0)(>= yhi 0))
      (make-interval (* xlo yhi) (* xhi yhi)))
    ((and (<= xlo 0)(>= xhi 0)(<= ylo 0)(>= yhi 0))
      (make-interval (min (* xhi ylo) (* xlo yhi))(max (* xlo ylo) (* xhi yhi))))
    ((and (<= xlo 0)(>= xhi 0)(<= ylo 0)(<= yhi 0))
      (make-interval (* xhi ylo) (* xlo ylo)))
    ((and (<= xlo 0)(<= xhi 0)(>= ylo 0)(>= yhi 0))
      (make-interval (* xlo yhi) (* xhi ylo)))
    ((and (<= xlo 0)(<= xhi 0)(<= ylo 0)(>= yhi 0))
      (make-interval (* xlo yhi) (* xlo ylo)))
    ((and (<= xlo 0)(<= xhi 0)(<= ylo 0)(<= yhi 0))
      (make-interval (* xhi yhi) (* xlo ylo))))
  )
)

(define (add-interval x y)
  (make-interval 
    (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))
  )
)

(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0) )
    (error "Cannot divide by 0")
    (mul-interval 
      x
      (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))
    )
  )
)

(define (percent i) (* 100.0 (/ (width i) (center i))))
(define (center i) (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c w)
  (make-interval
    (- c (* c ( / w 100)))
    (+ c (* c ( / w 100)))
  )

)


(define (par1 r1 r2)
  (div-interval 
    (mul-interval r1 r2)
    (add-interval r1 r2)
  )
)

(define (par2 r1 r2)
  (let 
    ((one (make-interval 1 1)))
    (div-interval one 
      (add-interval (div-interval one r1)
      (div-interval one r2))
    )
  )
)


(define eg1 (make-center-percent 10 0.001))
(define eg2 (make-center-percent 8 0.001))

(display (par1 eg1 eg1))
(newline)
(display (par2 eg1 eg1))
(newline)
(display (div-interval eg1 eg1))
(newline)
(display (div-interval eg1 eg2))