(defmodule anagram
  (export (find 2)))

(defun anagram-of (s)
  (lambda (x_)
    (let ((x (string:casefold x_)))
      (andalso (!= x s)
               (== (lists:sort x) (lists:sort s))))))

(defun find (w xs)
  (lists:filter (anagram-of (string:casefold w)) xs))