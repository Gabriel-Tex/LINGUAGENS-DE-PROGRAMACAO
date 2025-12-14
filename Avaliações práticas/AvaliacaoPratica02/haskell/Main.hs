module Main where

import PortasLogicas
import Circuitos
import Data.List (take, cycle)

-- funções auxiliares para exibir as strings
printStream8 :: String -> BitStream -> IO ()
printStream8 name stream = do
    putStr (name ++ " = ")
    print (take 8 stream) 

printStream4 :: String -> BitStream -> IO ()
printStream4 name stream = do
    putStr (name ++ " = ")
    print (take 4 stream) 

main :: IO ()
main = do
    putStrLn "=== Portas Lógicas ==="
    let a = cycle [1,0,1,0,1,0,1,0]
        b = cycle [0,0,1,1,0,0,1,1]

    printStream8 "A" a
    printStream8 "B" b
    printStream8 "NOT A" (notGate a)
    printStream8 "A AND B" (andGate a b)
    printStream8 "A OR B" (orGate a b)
    printStream8 "A XOR B" (xorGate a b)
    printStream8 "A NAND B" (nandGate a b)
    printStream8 "A NOR B" (norGate a b)

    putStrLn "\n=== Half Adder (meio somador) ==="
    let haA = cycle [0,0,1,1]
        haB = cycle [0,1,0,1]
        (sumH, carryH) = halfAdder haA haB

    printStream4 "[HalfAdder] A" haA
    printStream4 "[HalfAdder] B" haB
    printStream4 "[HalfAdder] Soma" sumH
    printStream4 "[HalfAdder] Carry" carryH

    putStrLn "\n=== Multiplexador 2x1==="
    let muxA = cycle [0,0,1,1,0,0,1,1]
        muxB = cycle [0,0,0,0,1,1,1,1]
        muxS = cycle [0,1,0,1,0,1,0,1]
        muxR = mux_2x1 muxA muxB muxS

    printStream8 "[Mux] A" muxA
    printStream8 "[Mux] B" muxB
    printStream8 "[Mux] S" muxS
    printStream8 "[Mux] Resultado" muxR

    putStrLn "\n=== Demultiplexador 1x2 ==="
    let demuxA = cycle [1,0,1,0,1,0,1,0]
        demuxS = cycle [0,1,0,1,0,1,0,1]
        (demuxR0, demuxR1) = demux_1x2 demuxA demuxS

    printStream8 "[Demux] A" demuxA
    printStream8 "[Demux] S" demuxS
    printStream8 "[Demux] Resultado (R0)" demuxR0
    printStream8 "[Demux] Resultado (R1)" demuxR1