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


;(define (my-reverse l)
;	(if (null? l)
;		l
;		(append (my-reverse (cdr l)) (list (car l)))
;	)
;)


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
	;(reverse-rec (- (my-length l) 1))
)

(display (my-reverse (list (list 1 2) (list 3 4)  )))

;(display (my-reverse (list 1 4 9 16 25)))


