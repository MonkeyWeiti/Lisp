(cons 'Narf 'Zort)
(cons 'Narf '(Zort Poit))
(cons 'Narf (cons 'Zort (cons 'Poit (cons 'Zwarg nil))))

(car '(a b c d e f g h i j k l m n o p q r s t u v w x y z))
(cdr '(a b c d e f g h i j k l m n o p q r s t u v w x y z))
(car (cdr '(a b c d e f g h i j k l m n o p q r s t u v w x y z)))
(cadr '(a b c d e f g h i j k l m n o p q r s t u v w x y z))

(list 'a 'b 'c)