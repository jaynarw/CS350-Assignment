declare
  fun {Last Xs N}
    case Xs
    of nil
    then nil
    else
      if {Length Xs} =< N then Xs
      else 
        case Xs
        of _|T then {Last T N}
        end
      end
    end
  end
{Browse {Last [1 2 3 4 5] 3}}