% ==================== Questão 1 ====================

% ITEM A)
   
local A1 A2 A4 A8 A16 A32 A64 in
    A1 = 2
    A2 = A1*A1
    A4 = A2*A2
    A8 = A4*A4
    A16 = A8*A8
    A32 = A16*A16
    A64 = A32*A32

    A100 = A64*A32*A4
end
% ITEM B)

declare
local C in

    C = {NewCell 1}
    for I in 1..100 do
        C := @C * I 
    end
    {Browse @C}
end