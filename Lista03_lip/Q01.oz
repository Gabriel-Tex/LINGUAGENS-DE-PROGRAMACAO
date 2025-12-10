local B in
    thread if {IsFree B} then B=true end end
    thread if {IsFree B} then B=false end end
    if B then {Browse yes} end
end

local B in
    thread B=true end
    if B then {Browse yes}
    else thread B=false end end
end