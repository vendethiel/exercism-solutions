(defpackage :yacht
  (:use :cl)
  (:export :score))
(in-package :yacht)

(defun yacht-score (scores)
  (if (apply #'= scores)
      50
      0))

(defun nfaces-score (category scores)
  (let ((n (ecase category
             ((:ones) 1)
             ((:twos) 2)
             ((:threes) 3)
             ((:fours) 4)
             ((:fives) 5)
             ((:sixes) 6))))
    (* n (count n scores))))

(defun full-housep (scores)
  (and
   (not (apply #'= scores))
   (apply #'= (subseq scores 0 3))
   (apply #'= (subseq scores 3 5))))

(defun full-house-score (scores)
  (if (or (full-housep scores) (full-housep (reverse scores)))
      (reduce #'+ scores)
      0))

(defun foakp (scores)
  (apply #'= (subseq scores 0 4)))

(defun foak (scores)
  (cond
    ((foakp scores) (reduce #'+ (subseq scores 0 4)))
    ((foakp (reverse scores)) (reduce #'+ (subseq scores 1 5)))
    (t 0)))

(defun straight (category scores)
  (let ((expected (if (eq category :little-straight)
                      '(1 2 3 4 5)
                      '(2 3 4 5 6))))
    (if (equal scores expected)
        30
        0)))

(defun choice (scores)
  (reduce #'+ scores))

(defun score (scores category)
  (let ((sorted (sort (copy-list scores) #'<)))
    (case category
      ((:yacht) (yacht-score scores))
      ((:ones :twos :threes :fours :fives :sixes) (nfaces-score category scores))
      ((:full-house) (full-house-score sorted))
      ((:four-of-a-kind) (foak sorted))
      ((:little-straight :big-straight) (straight category sorted))
      ((:choice) (choice scores)))))
