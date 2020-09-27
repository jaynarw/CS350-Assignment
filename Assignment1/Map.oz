declare
  fun {Sum X Y}
    X + Y
  end
  fun {AddOne X}
    {Sum X 1}
  end
  fun {Squareddd X}
    X * X
  end

  fun {Map Op Xs}
    local XyzOp in
      fun {XyzOp A Bs}
        case A
        of nil then Bs
        else {Op A}|Bs
        end
      end
      {FoldR Xs XyzOp nil}
    end
  end
{Browse {Map AddOne [4 5 6]}}
{Browse {Map Squareddd [1 2 4]}}
