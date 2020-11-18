-- Assignment 3, (HW3)
-- CS350
-- Author: Jayesh Narwaria
-- Roll Number: 170325

-- Q1
-- Quicksort with first element as pivot
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = 
  let smallerlist = [y | y <- xs, y < x ]
      biggerlist  = [y | y <- xs, y >= x ]
  in  quicksort smallerlist ++ [x] ++ quicksort biggerlist

-- Q2
-- Uniq: given a list of elements, returns a list of unique elements.
uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:xs) = if x `elem` uniq xs then uniq xs else x:uniq xs

-- Q3
neighbors :: (Ord a1, Ord a2, Num a1, Num a2) => a1 -> a2 -> [(a1, a2)]
neighbors i j = let generateAdjacents i j = [(i+1,j), (i-1,j), (i,j+1), (i,j-1),(i+1,j+1), (i+1,j-1), (i-1,j-1), (i-1,j+1)]
                in quicksort $ filter (\(a,b) -> a >=0 && a<9 && b>=0 && b<9) $ generateAdjacents i j

-- Q4
-- Computes the number of words in a string
count :: String -> Int
count str = length $ concatMap words (lines str)

-- Q5
-- Takes a list of functions, and an initial value, and performs compositions of functions in the list on the second argument.
compose_multiple :: [b -> b] -> b -> b
compose_multiple = foldl1 (.)


-- Q6
-- Part a, Type Constructor
data BinaryTree a =  Nil 
                  | Node a (BinaryTree a) (BinaryTree a) deriving Show

-- Part b, Map Tree
maptree :: (a->b) -> BinaryTree a -> BinaryTree b
maptree _ Nil = Nil
maptree f (Node a b c) = Node (f a) (maptree f b) (maptree f c)

-- Part c, Fold Tree
foldTree :: (a -> b -> b -> b) -> b -> BinaryTree a -> b
foldTree _ identity Nil = identity
foldTree f identity (Node a b c) = f a (foldTree f identity b) (foldTree f identity c)
