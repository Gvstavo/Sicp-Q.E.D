(define (square x)(* x x ))


(define (compose f g)(lambda (x) (f (g x)) ))


(define (repeated f n)
	(if (= n 1)
		f
	 (repeated (compose f f) (- n 1))
	)
)

(display ((repeated square 2) 5))