; solution of https://exercism.org/tracks/common-lisp/exercises/robot-simulator
; possible directions => list 0 1 2 3
; 0 => west
; 1 => north
; 2 => east
; 3 => south

(define (robot x y direction roadmap) (cond [(empty? roadmap) (list x y direction)]
                                            [(string=? "R" (first roadmap)) (robot x y (+ direction 1) (rest roadmap))]
                                            [(string=? "L" (first roadmap)) (robot x y (- direction 1) (rest roadmap))]
                                            [(string=? "A" (first roadmap))
                                            (cond [(= 1 (remainder direction 4)) (robot x (+ y 1) direction (rest roadmap))]
                                                  [(= 2 (remainder direction 4)) (robot (+ x 1) y direction (rest roadmap))]
                                                  [(= 3 (remainder direction 4)) (robot x (- y 1) direction (rest roadmap))]
                                                  [(= 0 (remainder direction 4)) (robot (- x 1) y direction (rest roadmap))]
                                                  )]
                                           ))

(robot 7 3 1 (list "R" "A" "A" "L" "A" "L"))
