(defun c:getvertices ()
  (vl-load-com) ; Ensure functions for accessing object data are loaded

  (setq  ply (entsel "\nSelect a polyline: "))  ; Get polyline from user
  (if (not ply)
     (progn
          (princ "No Polyline Selected")
          (vl-exit-with-value -1)
     )
  )

  (if (not (eq (cdr (assoc 0 (entget (car ply)))) "LWPOLYLINE")) 
         (progn
                (princ "\nInvalid selection. \nPlease select a polyline.")
                (vl-exit-with-value -1)
         )
  )  




  
  (setq pdata (entget (car ply))) ; Retrieve polyline data

  ; Filter vertex data (represented by group code 10)
  (setq vertices
        (vl-remove-if-not '(lambda (x) (= (car x) 10)) pdata)
  ) 

  ; Extract coordinates from vertex data
  (mapcar 'cdr vertices) 
)


(defun SelectEntities (pointList entType layerName mode)
  (cond    
     ((equal mode "cp")
      (ssget "CP" pointList (list (cons 0 entType)  (cons 8 layerName )))
     )
    ((equal mode "wp")
     (ssget "WP" pointList (list (cons 0 entType)  (cons 8 layerName )))
    )
    ((equal mode "fence")
     (ssget "F" pointList (list (cons 0 entType)  (cons 8 layerName )))
    )
    (t (prompt "\nInvalid selection mode. Use 'cp', 'wp', or 'fence'."))
  )
)

 ;; Example usage:
(setq ptlst (c:getvertices))
(print (sslength (SelectEntities ptlst "LINE" "house" "cp")))
; (print (sslength (SelectEntities ptlst "LINE" "*" "cp")))



 ;; Example usage:
; (setq ptlst (c: getvertices))
; (setq treelines (sslength (SelectEntities ptlst "LINE" "trees" "cp")))
; (setq houselines (sslength (SelectEntities ptlst "LINE" "house" "cp")))
; (print (strcat "Lines on the tree layer:" (itoa treelines)))
; (print (strcat "Lines on the house layer:" (itoa houselines)))



