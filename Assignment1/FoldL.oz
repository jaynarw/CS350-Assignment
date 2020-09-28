declare
  fun {FoldL BinOp Xs I}
    case Xs
    of nil then I
    [] H|T then {FoldL BinOp T {BinOp I H}}
    end
  end
declare
fun {Test X Y}
  2*X + Y
end

{Browse {FoldL Test [1 2 3] 4}}