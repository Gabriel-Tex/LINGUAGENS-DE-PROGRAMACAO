% ============== Main  ==============

declare
[PORTAS] = {Module.link ['portas_logicas.ozf']}
[CIRCUITOS] = {Module.link ['circuitos.ozf']}

% portas lógicas
NotG = PORTAS.notGate
AndG = PORTAS.andGate
OrG = PORTAS.orGate
XorG = PORTAS.xorGate
NandG = PORTAS.nandGate
NorG = PORTAS.norGate

local A B in
   A = 1|0|1|0|1|0|1|0|_
   B = 0|0|1|1|0|0|1|1|_

   {Browse 'A ='#A}
   {Browse 'B ='#B}
   {Browse 'NOT A ='#{NotG A}}
   {Browse 'A AND B ='#{AndG A B}}
   {Browse 'A OR B ='#{OrG A B}}
   {Browse 'A XOR B ='#{XorG A B}}
   {Browse 'A NAND B ='#{NandG A B}}
   {Browse 'A NOR B ='#{NorG A B}}
end

{Delay 2000}
% circuitos
HalfAdder = CIRCUITOS.halfAdder
Mux = CIRCUITOS.mux
Demux = CIRCUITOS.demux

% meio somador

local A B R in

   A = 0|0|1|1|_
   B = 0|1|0|1|_

   {HalfAdder A B R}

   {Browse '[HalfAdder] A ='#A}
   {Browse '[HalfAdder] B ='#B}
   {Browse '[HalfAdder] Soma e carry ='#R}
end

{Delay 1000}

% multiplexador 2x1

local A B S R in
   A = 0|0|1|1|0|0|1|1|_
   B = 0|0|0|0|1|1|1|1|_
   S = 0|1|0|1|0|1|0|1|_

   {Mux A B S R}

   {Browse '[Mux] A ='#A}
   {Browse '[Mux] B ='#B}
   {Browse '[Mux] S ='#S}
   {Browse '[Mux] Resultado ='#R}
end

{Delay 1000}
% demultiplexador 1x2
local A S R in
   A = 1|0|1|0|1|0|1|0|_
   S = 0|1|0|1|0|1|0|1|_

   {Demux A S R}

   {Browse '[Demux] A ='#A}
   {Browse '[Demux] S ='#S}
   {Browse '[Demux] Resultado ='#R}
end