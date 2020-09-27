declare 
  fun {Take L N}
    case L
    of nil
    then nil
    [] H|T then if N =< 0 then nil else if N==1 then [H] else H|{Take T N-1} end end
    end
  end
  {Browse {Take [1 2 3] 100}}
  % end