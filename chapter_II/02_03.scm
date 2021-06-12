(define (make-point x y)
	(cons x y)
)
(define (x-point x) (car x))
(define (y-point y) (cdr y))


(define (make-segment p1 p2)
	(cons p1 p2)
)
(define (start-segment x) (car x))

(define (end-segment y) (cdr y))

(define (square x) (* x x))


(define (segment-length line)

	(sqrt
		(+ 
			(square (- (x-point (end-segment line)) (x-point (start-segment line))))
			(square (- (y-point (end-segment line)) (y-point (start-segment line))))
		)
	)
)

(define (area rectangle)
	(* (width rectangle) (heigth rectangle))
)

(define (perimeter rectangle)
	(* 2 (+ (width rectangle) (heigth rectangle) ))
)

(define (make-rectangle width heigth)
	(cons width heigth)
)


; 1st implementation




;(define (width rectangle) (segment-length (car rectangle)))
;(define (heigth rectangle) (segment-length (cdr rectangle)))


;(display (area (make-rectangle 
;  (make-segment (make-point 4 8 )(make-point 4 16))
;  (make-segment (make-point 4 8 )(make-point 20 8 )))))

;(newline)


;(display (perimeter (make-rectangle 
;  (make-segment (make-point 4 8 )(make-point 4 16))
;  (make-segment (make-point 4 8 )(make-point 20 8 )))))


; 2nd implementation


(define (width rectangle)
	
	(segment-length
		(make-segment (car rectangle) (make-point (x-point (cdr rectangle)) (y-point (car rectangle))))
	)
)

(define (heigth rectangle)

	(segment-length
		(make-segment (car rectangle) (make-point (x-point (car rectangle))  (y-point (cdr rectangle))))
	)

)

(define r2 (make-rectangle 
              (make-point 4 8 )
              (make-point 20 16)))

(display (area r2))
(newline)
(display (perimeter r2))
;(define (width rectangle)

;	(make-segment (car rectangle) (make-point (x-point (car rectangle) (y-point (cdr rectangle)))))

;)
;(define (heigth rectangle)
;	(make-segment (car rectangle) (make-point (x-point (car rectangle) ))
;)