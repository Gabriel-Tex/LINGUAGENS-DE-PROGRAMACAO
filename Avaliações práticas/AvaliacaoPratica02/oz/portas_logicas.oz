
% ============== portas lógicas ==============

functor
export
    andGate: AndG
    orGate: OrG
    xorGate: XorG
    nandGate: NandG
    norGate: NorG
    notGate: NotG
define

   % porta lógica NOT
    fun {NotLoop Xs}
        case Xs of X|Xr then (1-X)|{NotLoop Xr} end
    end

    fun {NotG Xs}
        thread {NotLoop Xs} end
    end

    % função genérica que constrói qualquer porta lógica de duas entradas
    fun {GateMaker F}
        fun {$ Xs Ys}
            fun {GateLoop Xs Ys}
                case Xs#Ys of (X|Xr)#(Y|Yr) then
                    {F X Y}|{GateLoop Xr Yr}
                end
            end
        in
            thread {GateLoop Xs Ys} end
        end
    end

    % portas lógicas de duas entradas
    AndG ={GateMaker fun {$ X Y} X*Y end}
    OrG  ={GateMaker fun {$ X Y} X+Y-X*Y end}
    NandG={GateMaker fun {$ X Y} 1-X*Y end}
    NorG ={GateMaker fun {$ X Y} 1-X-Y+X*Y end}
    XorG ={GateMaker fun {$ X Y} X+Y-2*X*Y end}

    % porta lógica de atraso para executar circuitos sequenciais (evita deadlock)
    fun {DelayG Xs}
        thread 0|Xs end
    end

end


