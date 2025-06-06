(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun divby (x y)
  (= 0 (rem x y)))

(defun empty-or (x y)
  (if (equal x "") y x))

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (empty-or
   (concatenate 'string
               (and (divby n 3) "Pling")
               (and (divby n 5) "Plang")
               (and (divby n 7) "Plong"))
   (write-to-string n)))
