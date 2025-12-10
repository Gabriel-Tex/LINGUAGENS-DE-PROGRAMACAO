% eu sei la se isso ta certo
local QuickSort Particiona in
    fun {QuickSort L}
        proc {Ordena L ?S ?T}  
            case L
            of nil then S = T
            [] Piv|Resto then
                local Menores Maiores in
                    {Particiona Resto Piv Menores Maiores}
                    local S1 T1 S2 T2 in
                        {Ordena Menores S1 T1}  
                        {Ordena Maiores S2 T2}
                        S = S1
                        T1 = Piv|S2
                        T = T2
                    end
                end
            end
        end
    
    proc {Particiona L Piv ?Menores ?Maiores}
        case L
        of nil then
            Menores=nil 
            Maiores=nil
        [] X|Xr then Sr Br in
            {Particiona Xr Piv Sr Br}
            if X < Piv then
                Menores=X|Sr 
                Maiores=Br
            else 
                Menores=Sr 
                Maiores=X|Br 
            end
        end
    end
    
    S T
    in
    {Ordena L S T}
    S
    end

    {Browse {QuickSort [10 5 1 -33 8 2 7 4]}}
end