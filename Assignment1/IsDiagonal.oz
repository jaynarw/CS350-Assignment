declare
  fun {IsDiagonal M}
    local AuxI AuxI_J in
      fun {AuxI_J M_i_j I J}
        case M_i_j
        of nil then true
        [] H|T then
          if I==J then
            {AuxI_J T I J+1}
          else
            if H==0 then
              {AuxI_J T I J+1}
            else
              false
            end
          end
        end
      end
      fun {AuxI M_i I}
        case M_i
        of nil then true
        [] H|T then
          if {AuxI_J H I 0} then {AuxI T I+1}
          else false
          end
        end
      end
      {AuxI M 0}
    end
  end
  % {Browse {IsDiagonal [[1 0] [0 2]]}}
  {Browse {IsDiagonal [[1 0 0] [0 9 0] [0 1 ~1]]}}