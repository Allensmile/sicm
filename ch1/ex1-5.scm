;; Exercise 1.5: Solution process
;; :PROPERTIES:
;; :header-args+: :tangle ch1/ex1-5.scm :comments org
;; :END:

;; The goal of this exercise is really just to watch the minimization process that
;; they've given us.


(load "ch1/utils.scm")


;; #+RESULTS:
;; : ;Loading "ch1/utils.scm"...
;; : ;  Loading "ch1/exdisplay.scm"... done
;; : ;... done
;; : #| check-f |#

;; #+begin_quote
;; We can watch the progress of the minimization by modifying the procedure
;; parametric-path-action to plot the path each time the action is computed.
;; #+end_quote

;; The functions they've provided define a window, and then a version of
;; =parametric-path-action= that updates the graph as it minimizes:


(define win2 (frame 0.0 :pi/2 0.0 1.2))

(define ((L-harmonic m k) local)
  (let ((q (coordinate local))
        (v (velocity local)))
    (- (* 1/2 m (square v)) (* 1/2 k (square q)))))

(define ((parametric-path-action Lagrangian t0 q0 t1 q1)
         intermediate-qs)
  (let ((path (make-path t0 q0 t1 q1 intermediate-qs)))
    ;; display path
    (graphics-clear win2)
    (plot-function win2 path t0 t1 (/ (- t1 t0) 100))
    ;; compute action
    (Lagrangian-action Lagrangian path t0 t1)))


;; #+RESULTS:
;; : #| win2 |#
;; :
;; : #| L-harmonic |#
;; :
;; : #| parametric-path-action |#

;; This final command runs the minimization and updates the graph as it goes.


(find-path (L-harmonic 1.0 1.0) 0.0 1.0 :pi/2 0.0 2)
