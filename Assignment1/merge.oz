declare
  fun {Merge Xs Ys}
    case Xs
    of nil
    then Ys
    [] H|T then
      case Ys
        of nil then Xs
        [] H2|T2 then
          if H =< H2 then
            H|{Merge T Ys}
          else H2|{Merge Xs T2}
        end
      end
    end
  end
  {Browse {Merge [~1 2 3] [~1 1 1]}}