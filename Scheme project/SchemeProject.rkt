#lang racket
;Jackson Pettus
;jqp0002@auburn.edu
;02-25-2018
;COMP 3220




;Procedure ball-vall.
;Takes a single argument of a single ball.
;Returns the value of that ball.
(define (ball-val ball)
  ;ball is Red, return 5.
  (if (equal? ball 'R) 5
      ;ball is Green, return 4.
      (if(equal? ball 'G) 4
         ;ball is Blue, return 3.
         (if(equal? ball 'B) 3
            ;ball is White, return 1.
            (if(equal? ball 'W) 1
               ;ball is not a valid color
               "Not a valid ball"
            )
          )
       ) 
  )
)

;Procedure count-balls.
;Takes a color argument and a bucket of balls argument
;Returns the number of balls with the specified color contained by the bucket.
(define (count-balls color bucket)
  ;if the bucket is empty, return 0.
  (cond((null? bucket) 0)
     ;if the first element is the color, add one to the recursive call of the rest of the bucket.
     ((equal? color (car bucket)) (+ 1 (count-balls color (cdr bucket))))
     ;if the first element is not the specified color, just make the recursive call on the rest of the bucket.
     (else (+ 0 (count-balls color (cdr bucket))))
     )
  )

;Procedure color-counts.
;Takes a bucket in as an argument.
;Returns a list of the number reds, greens, blues, and whites in that order.
(define (color-counts bucket)
  (list(count-balls 'R bucket) (count-balls 'G bucket) (count-balls 'B bucket) (count-balls 'W bucket))
  )

;Procedure bucket-val.
;Takes in a bucket as an argument
;Returns the value of all the individual ball values added together.
(define (bucket-val bucket)
  ;if the bucket is empty, return 0.
  (cond((null? bucket) 0)
       ;Get the value of the first ball, and then add to the recursive bucket-val call on the rest of the bucket.
       ((+(ball-val (car bucket)) (bucket-val (cdr bucket))))
       )
  )

;Procedure judge.
;Takes in two buckets as arguments.
;Returns a string telling which bucket wins based on the bucket-val.
(define (judge bucket_1 bucket_2)
  (if (< (bucket-val bucket_1) (bucket-val bucket_2))
      "Bucket 2, Won..!"
      (if(> (bucket-val bucket_1) (bucket-val bucket_2))
         "Bucket 1, Won..!"
         "It's a Tie..!"
         )))

