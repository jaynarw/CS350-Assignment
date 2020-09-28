
declare
  fun {Factorial N}
    if (N==1) then 1
    else N * {Factorial N-1}
    end
  end
  fun {PowInt A B}
    if (B==0) then 1.0
    else {IntToFloat A*{PowInt A B-1}}
    end
  end
  fun {Take L N}
    case L
    of nil
    then nil
    [] H|T then if N =< 0 then nil else if N==1 then [H] else H|{Take T N-1} end end
    end
  end
  % {Browse {Pow 2 10}}
  fun lazy {Sin X}
    local Term in
      fun {Term X Index}
        local Negative Nr Dr in
          Negative={Pow ~1 Index}
          Nr={IntToFloat {Pow X 2*Index+1} * Negative}
          Dr={IntToFloat {Factorial 2*Index+1}}
          % {Browse {IsNumber 1.0Nr/Dr}}
          Nr/Dr | {Term X Index+1}
        end
      end
      {Term X 0}
    end
  end
  {Browse {Take {Sin 2} 3}}
  % {Browse {Sin 1.0}}
  