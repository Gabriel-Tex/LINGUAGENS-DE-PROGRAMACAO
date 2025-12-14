
% =========== circuitos lógicos ===========

functor
import
   PORTAS at 'portas_logicas.ozf'
export
   halfAdder: HalfAdder
   mux: Mux_2x1
   demux: Demux_1x2
define
   AndG = PORTAS.andGate
   OrG = PORTAS.orGate
   XorG = PORTAS.xorGate
   NotG = PORTAS.notGate
   
   % meio somador
   proc {HalfAdder A B ?R}
      S C
   in
      S = {XorG A B}  
      C = {AndG A B}  
      R = S#C
   end
   
   % multiplexador
   proc {Mux_2x1 A B S ?R}
      NS And1 And2
   in
      NS = {NotG S}
      And1 = {AndG A NS}
      And2 = {AndG B S}
      R = {OrG And1 And2}
   end
   
   % demultiplexador
   proc {Demux_1x2 A S ?R}
      NS And0 And1
   in
      NS = {NotG S}
      And0 = {AndG A NS}  
      And1 = {AndG A S}     

      R = And0#And1
   end
   
end