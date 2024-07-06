## Hands on practice video 6

This AutoLISP code performs the following actions in AutoCAD:

1. **Retrieves Polyline Vertices:**
   - `(vl-load-com)`: Loads functions for accessing AutoCAD object data.
   - `(entsel "\nSelect a polyline: ")`: Prompts the user to select a polyline in the drawing.
   - if block after this , handles the situation of user not selecting any polyline
   - if block after this , handles the situation of user selecting some entity other than lwpolyline
    - `(entget (car ply))`: Retrieves the polyline's entity data, which includes vertex coordinates.
   - `(vl-remove-if-not ...)`: Filters the entity data to keep only the vertex coordinates (group code 10).
   - `(mapcar 'cdr vertices)`: Extracts the coordinates from the filtered vertex data, creating a list of points.

3. **Selects Objects at Vertices:**
   - `(setq vlist (c:getvertices))`: Calls the `c:getvertices` function to get the polyline vertices.


**In summary:**

The code allows the user to select a polyline, then automatically identifies all the vertices of that polyline. It then selects any objects located totally inside the polyline boundary and changes their color to red. This can be useful for highlighting points of interest on a polyline or for visually identifying objects that are connected to the polyline's vertices.

**Note:** The commented-out lines suggest alternative selection methods (window or crossing polygon) that you could use instead of the fuzzy window selection.

