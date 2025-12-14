module Circuitos (
    halfAdder,
    mux_2x1,
    demux_1x2
) where

import PortasLogicas

-- meio Somador
halfAdder :: BitStream -> BitStream -> (BitStream, BitStream)
halfAdder a b = (s, c)
  where
    s = xorGate a b
    c = andGate a b

-- multiplexador 2x1 
mux_2x1 :: BitStream -> BitStream -> BitStream -> BitStream
mux_2x1 a b s = orGate and1 and2
  where
    ns   = notGate s
    and1 = andGate a ns
    and2 = andGate b s

-- demultiplexador 1x2 
demux_1x2 :: BitStream -> BitStream -> (BitStream, BitStream)
demux_1x2 a s = (and0, and1)
  where
    ns   = notGate s
    and0 = andGate a ns
    and1 = andGate a s