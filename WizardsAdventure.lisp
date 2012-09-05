(defparameter *nodes* '
	((wohnzimmer (du bist im wohnzimmer. auf dem sofa schnarcht ein zauberer.))
	(garten (du bist in einem schoenen garten. vor dir befindet sich ein brunnen.))
	(dachboden (du bist auf dem dachboden. in der ecke steht ein schweissbrenner.))))

(defparameter *edges* '
	((wohnzimmer 	(garten westen tuer)
					(dachboden oben leiter))
	(garten (wohnzimmer osten tuer))
	(dachboden (wohnzimmer unten leiter))))


(defun beschreibe-standort (standort nodes)
	(cadr (assoc standort nodes)))


(defun beschreibe-pfad (edge)
	`(Hier kannst du eine ,(caddr edge) nach ,(cadr edge) benutzen.))

(defun beschreibe-pfade (standort edges)
	(apply #'append (mapcar #'beschreibe-pfad (cdr (assoc standort edges)))))

(defparameter *objekte* '(whiskyflasche eimer frosch kette))
(defparameter *objekt-standorte* '((whiskyflasche wohnzimmer)
									(eimer wohnzimmer)
									(kette garten)
									(frosch garten)))

(defun objekte-an (ort objekte obj-ort)
	(labels ((an-ort-p (obj)
				(eq (cadr (assoc obj obj-ort)) ort)))
		(remove-if-not #'an-ort-p objekte)))

(defun beschreibe-objekte (ort objekte obj-ort)
	(labels ((beschreibe-obj (obj)
	`(du siehst das objekt ,obj auf dem boden.)))
	(apply #'append (mapcar #'beschreibe-obj (objekte-an ort objekte obj-ort)))))

(defparameter *standort* 'wohnzimmer)

(defun schaue()
	(append (beschreibe-standort *standort* *nodes*)
			(beschreibe-pfade *standort* *edges*)
			(beschreibe-objekte *standort* *objekte* *objekt-standorte*)))

(defun gehe (richtung)
	(let ((next (find richtung
					(cdr (assoc *standort* *edges*))
					:key #'cadr)))
	(if next
		(progn (setf *standort* (car next))
				(schaue))
	'(dorthin kannst du nicht gehen.))))

(defun nimm (objekt)
	(cond ((member objekt
					(objekte-an *standort* *objekte* *objekt-standorte*))
			(push (list objekt 'koerper) *objekt-standorte*)
				`(du hast das objekt ,objekt im inventar.))
			(t '(das kannst du nicht nehmen.))))

(defun inventar()
	(cons 'objekte- (objekte-an 'koerper *objekte* *objekt-standorte*)))