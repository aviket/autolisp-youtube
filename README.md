## Hands on practice video 6

This AutoLISP code performs the following actions in AutoCAD:

1. **Retrieves Polyline Vertices, Function Getvertice**
   - `(vl-load-com)`: Loads functions for accessing AutoCAD object data.
   - `(entsel "\nSelect a polyline: ")`: Prompts the user to select a polyline in the drawing.
   - if block after this , handles the situation of user not selecting any polyline
   - if block after this , handles the situation of user selecting some entity other than lwpolyline
    - `(entget (car ply))`: Retrieves the polyline's entity data, which includes vertex coordinates.
   - `(vl-remove-if-not ...)`: Filters the entity data to keep only the vertex coordinates (group code 10).
   - `(mapcar 'cdr vertices)`: Extracts the coordinates from the filtered vertex data, creating a list of points.
  
2. **Function: SelectEntities**
   The SelectEntities function is an AutoLISP utility for selecting entities in an AutoCAD drawing based on specified criteria. It accepts four parameters: pointList (a list of points defining the selection area), entType (the type of 
    entity to select), layerName (the name of the layer from which to select entities), and mode (the selection mode: "cp" for crossing polygon, "wp" for window polygon, and "fence" for fence selection). The function uses the ssget 
   function to filter and select entities that match the provided type and layer according to the selection mode. If an invalid mode is provided, it displays an error message.

4. **Selects Objects at Vertices:**
   - `(setq vlist (c:getvertices))`: Calls the `c:getvertices` function to get the polyline vertices.
   - (print (sslength (SelectEntities ptlst "LINE" "house" "cp"))) : calls SelectEntities function and prints length of selectionset returnsed by it.


**In summary:**

The code allows the user to select a polyline, then automatically identifies all the vertices of that polyline. It then calls SelectEntities function and prints length of selectionset returned by SelectEntities.

**Note:** The commented-out lines suggest alternative selection methods (window or crossing polygon) that you could use instead of the fuzzy window selection.

