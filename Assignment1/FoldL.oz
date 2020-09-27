declare
  fun {FoldL BinOp Xs I}
    case Xs
    of nil then I
    [] H|T then {FoldL2 BinOp T {BinOp I H}}
    end
  end
declare
fun {Sum X Y}
  Y + X
end

{Browse {FoldL Sum [1 2 3] 0}}