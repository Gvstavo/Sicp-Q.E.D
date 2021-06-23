(define (my-list-ref items n)
	(if (= n 0)
		(car items)
		(list-ref (cdr items) (- n 1))
	)
)

(define (my-length items)
	(define (length-iter a count)
		(if (null? a)
			count
			(length-iter (cdr a) (+ 1 count))
		)
	)
	(length-iter items 0)
)


(define (deep-reverse l)

	(define (reverse-iter lx n)
		(if (= n (my-length l))
			lx
			(reverse-iter (cons  (if (pair? (my-list-ref l n)) (my-reverse (my-list-ref l n)) (my-list-ref l n) ) lx ) (+ n 1))
		)
	)
	(define (my-reverse items)
		(if (null? items)
			items
			(append (my-reverse (cdr items)) (list (car items)))
		)
	)



	(reverse-iter (list ) 0)
	
)

(define x (list (list 1 2) (list 3 4) 5 6))

(display (deep-reverse x))
(newline)
;(display (deep-reverse (list 1 4 9 16 25)))
