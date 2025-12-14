% ============== circuitos do livro ==============

functor
import
    PORTAS at 'portas_logicas.ozf'
define
    NotG = PORTAS.notGate
    AndG = PORTAS.andGate
    OrG = PORTAS.orGate
    XorG = PORTAS.xorGate
    DelayG = PORTAS.delayGate

    % somador completo
    proc {FullAdder X Y Z ?C ?Sum}
        K L M
    in
        K={AndG X Y}
        L={AndG Y Z}
        M={AndG X Z}
        C={OrG K{OrG L M}}
        Sum={XorG Z {XorG X Y}}
    end

    % circuito latch 
    fun {Latch C DI}
        DO X Y Z F
    in
        F={DelayG DO}
        X={AndG F C}
        Z={NotG C}
        Y={AndG Z DI}
        DO={OrG X Y}
        DO
    end
end