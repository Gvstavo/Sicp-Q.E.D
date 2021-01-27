(define (sum term a next b)
	(if (> a b)
		0
	(+ (term a) (sum term (next a) next b))))


(define (cube x) (* x x x))

(define (simpson f a b n)

	(define (inc x) (+ x 1))
	
	(define h (/ (- b a) n))

	(define (y k ) (f (+ a (* k h ))))		

	(define (term k)
		
		(* (cond
			((or (= k 0)(= k n)) 1)
			((odd? k) 4)
			((even? k) 2)
		) (y k))
	)
	( / (* h (sum term 0 inc n) ) 3)
)

(display (simpson cube 0 1 100))

(display (simpson cube 0 1 1000))





