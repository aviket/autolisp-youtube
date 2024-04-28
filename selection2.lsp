(defun c:FEATURESELECT () 
  ; Defines a function named 'FEATURESELECT' with the standard 'c:' prefix for custom commands.

  ; Initialization
  (setq selSet nil totLines 0 totPolylines 0 totCircles 0 totPoints 0) 
  ; Initializes variables: 
  ;   - 'selSet' to store the selection set (initially empty)
  ;   - 'totLines', 'totPolylines', 'totCircles'  to store counts of each feature type

  ; Get user selection
  (princ "\nSelect features: ") 
  ; Prints a prompt for the user to select features.
  (setq selSet (ssget)) 
  ; Calls the 'ssget' function to get user's selection and stores the result in 'selSet'.

  (if selSet ; Check if the selection set is valid
    (progn 
      ; Iterate through the selection set
      (setq numEnt (sslength selSet)) 
      ; Gets the number of entities in 'selSet' and stores it in 'numEnt'.
      (setq i 0) 
      ; Initializes a loop counter 'i' to 0.
      (while (< i numEnt) 
        ; Begins a 'while' loop that continues as long as 'i'  is less than 'numEnt'.
        (setq ent (ssname selSet i)) 
        ; Gets the entity at index 'i' of 'selSet' and stores its entity name in 'ent'.

        (cond
          ; Count lines
          ((= (cdr (assoc 0 (entget ent))) "LINE") 
            ; - Gets the entity data of 'ent' using 'entget'
            ; - Finds the pair with code 0 (entity type) using 'assoc'
            ; - Gets the second element of that pair using 'cdr'
            ; - If the second element is "LINE", increments 'totLines'.
            (setq totLines (1+ totLines)) 
          )

          ; Count polylines
          ((= (cdr (assoc 0 (entget ent))) "LWPOLYLINE") 
            ; Same logic as above, but checks for "LWPOLYLINE".
            (setq totPolylines (1+ totPolylines)) 
          )

          ; Count circles
          ((= (cdr (assoc 0 (entget ent))) "CIRCLE") 
            ; Same logic as above, but checks for "CIRCLE".
            (setq totCircles (1+ totCircles)) 
          )

          ; Count points
          ((= (cdr (assoc 0 (entget ent))) "POINT") 
            ; Same logic as above, but checks for "Point".
            (setq totPoints (1+ totPoints)) 
          )

          ;;;; add code for counting texts ;;;;


 
        ) 
        (setq i (1+ i))
        ; Increments the loop counter 'i'.
      ) 

      ; Provide feedback to the user (same logic as your original code)
      (princ (strcat "\nTotal features selected\nLines: " (itoa totLines))) 
      (princ (strcat "\nPolylines: " (itoa totPolylines)))
      (princ (strcat "\nCircles: " (itoa totCircles)))
      (princ (strcat "\nPoints: " (itoa totPoints)))
    )
    (princ "\nNo features selected.\n") 
  )
  (princ) 
) 




