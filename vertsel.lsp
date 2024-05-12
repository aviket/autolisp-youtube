(defun c:getvertices ()
  (vl-load-com) ; Ensure functions for accessing object data are loaded

  (setq  ply (entsel "\nSelect a polyline: "))  ; Get polyline from user
  (setq pdata (entget (car ply))) ; Retrieve polyline data

  ; Filter vertex data (represented by group code 10)
  (setq vertices
        (vl-remove-if-not '(lambda (x) (= (car x) 10)) pdata)
  ) 

  ; Extract coordinates from vertex data
  (mapcar 'cdr vertices) 
)

(setq vlist (c:getvertices))
; (setq entities (ssget "wp" vlist))
; (setq entities (ssget "cp" vlist))
(setq entities (ssget "f" vlist))

(command "chprop" entities "" "C" "1" "")


