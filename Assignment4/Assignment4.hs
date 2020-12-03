import Control.Monad.State
import Control.Monad.Identity

-- Q3 
memoizedFib :: StateT (Integer, Integer, Integer) Identity Integer
memoizedFib = do
  (x1, x2, n) <- get
  if n == 0
    then return x1
    else put (x2, x1 + x2, n - 1) >> memoizedFib

fibonacci :: Integer -> Integer
fibonacci n = evalState memoizedFib (1, 1, n)

-- Q4 Part(a)
addNumsWithDo = do
  putStrLn "Enter the sequnce of non-negative integers one by one"
  addNums 0
addNums init = do
  new_number <- getLine >>= \x -> return (read x::Int)
  if new_number == -1
    then putStrLn (show init)
  else if new_number < 0
    then putStr "Error: Only non-negative values allowed"
  else addNums $ init + new_number

-- Q4 Part(b)
addNumsWithoutDo = putStrLn "Enter the sequnce of non-negative integers one by one" >> addNumsWithoutDoHelper 0
addNumsWithoutDoHelper init = getLine >>= \x ->
  (\ y
     -> if y == - 1 then putStrLn $ show init else if y < 0
    then putStr "Error: Only non-negative values allowed" else addNums $ init + y)
    (read x :: Int)

