declare
  fun {ZipWith BinOp Xs Ys}
    case Xs
    of nil
    then nil
    [] H|T then
      case Ys
      of H2|T2 then
        {BinOp H H2}|{ZipWith BinOp T T2}      
      end
    end
  end
  fun {Add X Y}
    X + Y
  end
  {Browse {ZipWith Add [1 2 3 5] [~1 ~2 3 1]}}