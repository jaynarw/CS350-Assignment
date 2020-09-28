declare
  fun {Approximate S Epsilon}
    local Aux in
      fun {Aux S Epsilon Sum Prev}
        case S 
        of H|T then
          if ({Abs H-Prev} =< Epsilon) then
            Sum+H
          else
            {Aux T Epsilon Sum+H H}
          end
        else
          Sum
        end
      end
      case S
      of H|T then
        case T 
        of nil then
          H
        else
          {Aux T Epsilon H H}
        end
      else
        0
      end
    end
  end
  {Browse {Approximate [1 5 7 6] 0}}