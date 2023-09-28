; returns a list of n zeros
(define (nzero-list n) (if
                        (= n 1)
                        (list 0)
                        (cons 0 (nzero-list (- n 1)))))

(define (move-zeros alist nzero) (cond [(empty? alist) (nzero-list nzero)]
                                       [(not (equal? 0 (car alist))) (cons (car alist) (move-zeros (rest alist) nzero))]
                                       [else (move-zeros (rest alist) (+ 1 nzero))]
                                       ))

; move zeros to the end of the list
(move-zeros (list #false 1 0 1 2 0 1 3 "a") 0)
