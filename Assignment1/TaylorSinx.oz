
declare
  fun lazy {Sin X}
    local Factorial Term PowInt in
      fun {Factorial N}
        if (N==1) then 1
        else N * {Factorial N-1}
        end
      end
      fun {PowInt A B}
        if (B==0) then 1.0
        else if {IsInt A} then {IntToFloat A}*{PowInt A B-1} else A*{PowInt A B-1} end
        end
      end
      fun {Term X Index}
        local Negative Nr Dr in
          Negative={Pow ~1 Index}
          Nr={PowInt X 2*Index+1} * {IntToFloat Negative}
          Dr={IntToFloat {Factorial 2*Index+1}}
          Nr/Dr | {Term X Index+1}
        end
      end
      {Term X 0}
    end
  end

  fun {Take L N}
    case L
    of nil
    then nil
    [] H|T then if N =< 0 then nil else if N==1 then [H] else H|{Take T N-1} end end
    end
  end
  {Browse {Take {Sin ~3.5} 3}}
  {Browse {Take {Sin 2} 3}}