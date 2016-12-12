#lang racket

(require "handle_file.rkt")

(define (read_point file)
  (foldr
    (lambda ( next carry )
      (append (list ( parse_point next )) carry))
    '()
    (file->lines file)))

(define (parse_point dirty_point)
  (list
    (first (string-split dirty_point ":"))
    (handle_coords (string-trim (second (string-split dirty_point ":"))))))

(provide read_point)
(provide parse_point)
