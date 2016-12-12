#lang racket

; Point-in-polygon algorithm models found here https://en.wikipedia.org/wiki/Point_in_polygon#Ray_casting_algorithm
; Although there are some issues with the ray casting method, mainly that coordinates lying on a polygon perimeter may have issues returning the correct neighborhood, this is the simplest way to check if a point lies within a polygon. Other methods require angle checking and summation, and although they'll be more accurate for points near polygon edges, much more difficult to implement given time restrictions
; odd intersections mean its within the bounds

; Using some straightforward algebra we can find the intersection points of lines as per:
; http://zonalandeducation.com/mmts/intersections/intersectionOfTwoLines1/intersectionOfTwoLines1.html

; this function should return a boolean whether the point is interior to the polygon neighborhood region
(provide within_bounds?)

