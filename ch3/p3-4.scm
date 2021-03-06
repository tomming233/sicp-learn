(define (make-account balance pwd)
    (define count 0)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"))
    (define (deposit amount)
        (begin (set! balance (+ balance amount))
        balance))
    (define (dispatch p m)
        (cond
            ((eq? p pwd)
                (cond
                    ((eq? m 'withdraw) withdraw)
                    ((eq? m 'deposit) deposit)
                    (else (error "Unkonwn request -- MAKE-ACCOUNT" m))))
            ((>= count 7) "call-the-cops")
            (else (set! count (+ 1 count)) (error ("Incorrect password")))
            ))
    dispatch
)
