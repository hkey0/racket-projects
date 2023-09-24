; from to weight
(define harita
  (list
      (list 1 2 1)
      (list 1 3 3)
      (list 2 3 2)
      (list 3 2 2)
      (list 2 4 20)
      (list 2 7 10)
      (list 3 5 1)))

(define (alt alist node) (cond [(empty? alist) alist]
                               [(= node (car (car alist))) (cons (rest (first alist)) (alt (rest alist) node))]
                               [else  (alt (rest alist) node)]))

(define (minalt alist) (if (empty? alist) alist (if (empty? (rest alist)) alist (if (> (car (cdr (car alist))) (car (cdr (car (rest alist)))))
                           (minalt (rest alist))
                           (minalt (cons (car alist) (rest (rest alist))))
                           ))))
; (minalt (alt harita 2))
(define (ucs alist start target) (if (empty? alist)
                                     alist
                                     (cons start (if (empty? (minalt (alt alist start)))
                                           null

                                           (ucs (rest alist) (first (first (minalt (alt alist start)))) target)))))

(ucs harita 1 5)
