(define (sum term a next b)
	(if (> a b)
		0
	(+ (term a) (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (inc n) (+ n 1))
	(define (sum-cubes a b)
		(sum cube a inc b))



(display (sum-cubes 1 10))