(defparameter *klein* 1)
(defparameter *gross* 100)
(defun errate ()
	(ash (+ *klein* *gross*) -1))
(defun groesser () 
	(setf *klein* (1+(errate)))
	(errate))
(defun kleiner () 
	(setf *gross* (1-(errate)))
	(errate))
(defun start () 
	(defparameter *klein* 1)
	(defparameter *gross* 100)
	(errate))