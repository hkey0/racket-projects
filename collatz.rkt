(define (collatz n)(cond [(= (remainder n 2) 0) (cons n (collatz (/ n 2)))]
                         [(= n 1) (list 1)]
                         [else (cons n (collatz (+ (* 3 n) 1)))]
                         ))
(collatz 5)
