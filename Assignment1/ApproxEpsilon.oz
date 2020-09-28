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
      end
    end
  end
  {Browse {Approximate [11.12 5.0 7.0 6.0] 3.0}}
  {Browse {Approximate [111 50 70 60] 10}}