#lang racket

; Pull in the methods from lib files
(require "lib/handle_file.rkt")
(require "lib/poly_checker.rkt")
(require "lib/read_points.rkt")

(define neighborhoods (read_neighborhood_file "gr_neighborhoods.txt"))

(define (neighborhood_for_point point)
  (define found
    (findf
      (lambda (neighborhood)
        (within_bounds? point (car (cdr neighborhood))))
      neighborhoods
    ))
  (if found
    (car found)
    "No neighborhood found"))

(define test_file (stream-first (sequence->stream (current-command-line-arguments))))

(map
  (lambda (str)
    (printf "~a\n" str))
  (map
    (lambda (point_tuple)
      (apply string-append point_tuple))
    (map
      (lambda (point_tuple)
        (list (first point_tuple) ": " (neighborhood_for_point (second point_tuple))))
      (read_point test_file))))
