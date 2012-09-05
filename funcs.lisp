(defun anzahl (liste)
	(if liste
		(+ 1 (anzahl(cdr liste)))
		0))

(anzahl '(a b c d e f g h i j k l m n o p q r s t u v w x y z ))