; a little toki pona sentence generator

(SETF *PRINT-CASE* :DOWNCASE)
(load "common")
(block nil (setq *random-state* (make-random-state t)) (return))

; OR  "one of" ->  a b c
; AND "all of" -> (a b c)
(defparameter *toki-pona*
  '((sentence -> (noun-phrase verb-phrase object-phrase))
    (noun-phrase -> np-meyou np-jan np-reg)
    (np-meyou -> mi sina)
    (np-jan -> (np-jan-name li))
    (np-jan-name -> (jan Name))
    (np-reg -> (np-reg-name Adj* li))
    (np-reg-name -> soweli waso kala)
    (Adj* -> () lili suli nasa)
    (Name -> () lili suli toki kalama)
    (verb-phrase -> Pre-Verb Verb)
    (Pre-Verb -> () ken sona wile)
    (Verb -> olin alasa sona lawa kalama lukin toki kute open utala moku pali)
    (object-phrase -> () e-phrase e-lon-phrase)
    (Object -> telo akesi palisa mani pipi soweli waso kala kili waso ijo)
    (Objects -> (Object Adj*))
    (e-phrase -> (e Objects))
    (e-lon-phrase -> (e-phrase lon-phrase))
    (lon-phrase -> (lon Locations))
    (Locations -> (Location LAdj*))
    (Location -> telo ma tomo nena)
    (LAdj* -> () sewi noka)))

(defparameter *grammar* *toki-pona*)

(repeat 10 (format t "~{~a~^ ~}~%" (generate 'sentence)))
