(define (square x) (* x x))

(define (sum_of_squares x y) (+ (square x)  (square y)))


(define (sum_two_largest x y z)

	(cond 



		((and (> x y) (> x z) (> y z)) (sum_of_squares x y))
		((and (> x y) (> x z) (> z y)) (sum_of_squares x z))
		((and (> y x) (> y z) (> x z)) (sum_of_squares y x))
		((and (> y x) (> y z) (> z x)) (sum_of_squares y z))
		((and (> z y) (> z x) (> x y)) (sum_of_squares z x))
		((and (> z y) (> z x) (> y x)) (sum_of_squares z y))
	)
)



(display (sum_two_largest 3 1 2))
(display "\n")