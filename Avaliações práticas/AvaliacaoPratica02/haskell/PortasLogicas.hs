module PortasLogicas (
    BitStream,
    notGate,
    andGate,
    orGate,
    xorGate,
    nandGate,
    norGate,
) where

import Data.List (zipWith)

type BitStream = [Int]

-- função genérica que cria circuitos de duas entradas
gateMaker :: (Int -> Int -> Int) -> BitStream -> BitStream -> BitStream
gateMaker f xs ys = zipWith f xs ys

-- porta NOT
notGate :: BitStream -> BitStream
notGate = map (\x -> 1 - x)

-- portas de duas entradas
andGate :: BitStream -> BitStream -> BitStream
andGate = gateMaker (\x y -> x * y)

orGate :: BitStream -> BitStream -> BitStream
orGate = gateMaker (\x y -> x + y - x * y)

xorGate :: BitStream -> BitStream -> BitStream
xorGate = gateMaker (\x y -> x + y - 2 * x * y)

nandGate :: BitStream -> BitStream -> BitStream
nandGate = gateMaker (\x y -> 1 - x * y)

norGate :: BitStream -> BitStream -> BitStream
norGate = gateMaker (\x y -> 1 - x - y + x * y)
