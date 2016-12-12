#lang racket

(define (read_neighborhood_file file)
  (define folded
    (foldl
      (lambda ( next carry )
        (cond
          [(string-contains? next ":") (found_hood_name next carry)]
          [(equal? next "") (found_empty_line next carry)]
          [else (found_coords next carry)])
      )
      '(() () ())
      (file->lines file)))

  (car (cdr (cdr
    (found_empty_line "" folded))))

 )

(define (found_hood_name next carry)
  (list
    (clean_hood_name next)
    '()
    (car (cdr (cdr carry)))))

(define (found_empty_line next carry)
  (list
     next
     '()
     (append
        (car (cdr (cdr carry)))
        (list (list (car carry) (car (cdr carry)))))))

(define (found_coords next carry)
  (list
   (car carry)
   (append (car (cdr carry)) (list (handle_coords next)))
   (car (cdr (cdr carry)))))

(define (handle_coords coord)
  (map string->number (string-split (string-trim coord) ",")))

(define (clean_hood_name name)
  (first (string-split (string-trim name) ":")))

(provide read_neighborhood_file)
(provide handle_coords)
(provide clean_hood_name)