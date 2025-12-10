local Fib in
    fun {Fib X}
        if X=<2 then 1
        else {Fib X-1}+{Fib X-2} end
    end

    {Browse {Fib 35}}
end

local Fib in
    fun {Fib X}
        if X=<2 then 1
        else thread {Fib X-1} end + {Fib X-2} end
    end

    {Browse {Fib 35}}
end