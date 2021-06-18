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

(define (my-reverse l)
	(define (reverse-iter lx n)
		(if (= n (my-length l))
			lx
			(reverse-iter (cons (my-list-ref l n) lx ) (+ n 1))
		)
	)

	(define (reverse-rec n)
		(if (= n 0)
			(list (car l))
			(cons (my-list-ref l n) (reverse-rec (- n 1)))
		)
	)
	(reverse-iter (list ) 0)
)
(define (same-parity . l)

	(define (filter-evens lx n)
		(if (= n (my-length l))
			lx
			(if (even? (my-list-ref l n))
				(filter-evens (cons  (my-list-ref l n) lx) (+ n 1))
				(filter-evens lx (+ n 1))				
			)
		)
	)

	(define (filter-odds lx n)
		(if (= n (my-length l))
			lx
			(if (not (even? (my-list-ref l n)))
				(filter-odds (cons (my-list-ref l n) lx) (+ n 1))
				(filter-odds lx (+ n 1))				
			)
		)
	)

	(if (even? (car l))
		(my-reverse(filter-evens (list ) 0))
		(my-reverse(filter-odds (list ) 0))

	)

)
(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
(newline)



