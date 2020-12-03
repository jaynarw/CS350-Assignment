# Q1. Maybe Monad
## Defination
```
return x = Just x -- (1)
```
```
>>= m g = case m of  
	        | Nothing -> Nothing  
	        | Just x  -> g x  -- (2)
  ```

## Proof: Left Identity
`return a >>= f :: m a`
```
-> return a >>= f  
-> (Just a) >>= f  -- from (1)  
-> f x             -- from (2) following (case Just x)  
```
**Hence Proved**

## Proof: Right Identity
`(m >>= return) = (m)`

### case m of Nothing  
```
-> (m >>= return)
-> (Nothing >>= return)
->  Nothing                -- (From (2))
Proved for case m == Nothing
```
### case m of (Just x)
```
-> (m >>= return)
-> ((Just x) >>= return)
-> (return x)            -- from (2) following (case Just x -> return x) 
-> Just x                -- From (1)
Proved for case m == Just x
```
## Proof: Associativity
`m >>= f >>= g is equivalent to m >>= (\ x -> f x >>= g)`

### case m of Nothing
```
-> (Nothing >>= f) >>= g
-> Nothing >>= g                 - from (2)
-> Nothing                       - from (2)
-> Nothing >>= (\x -> f x >>= g) - [from (2) as for any function f, Nothing >>= f = Nothing]
```
Proved for case m == Nothing

### case m of Just x
```
-> ((Just x)>>= f) >>= g
-> f x >>= g                    -- From (2)
-> (\y -> f y >>= g) x          -- Converting as application of lambda function
-> Just x >>= (\y -> f y >>= g) --From applying (2) in reverse
```
Proved for case m == Just x  
**Hence Proved**


# Q2. List Monad
## Defination

```
return x = [x] -- (1)
```
```
(>>=) :: (Monad m) => m a -> (a -> m b) -> m b  
>>= xs g = concat $ map g xs -- (2)
```

## Proof: Left Identity
```
return a >>= f = [f a]
-> [a] >>= f            -- (From (1))
-> concat $ map f [a]   -- (From (2))
-> concat [(f a)]       -- (By defination of map)
-> (f a)                -- (By defination of concat)
```
LHS = RHS

## Proof: Right Identity  
`(m >>= return) = (m)`

### Base case: m = []
```
-> [] >>= return
-> concat $ map return [] -- (From (2))
-> concat $ []            -- (Map on [] returns [])
-> []                     -- (Concat Defination)
Proved for Base case.
```

Now assuming true for all xs which are tail of x and their tails,
### Case: m = (x:xs)
```
-> (x:xs) >>= return
-> concat $ map return (x:xs)                   -- From (2)
-> concat $ (return x):(map return xs)          -- From defination of map
-> ([]++(return x)) ++ (concat $ map return xs) -- From defination of concat (foldl (++) [])
-> ([] ++ return x) ++ (xs)                     -- From assumption
-> [x]++(xs)                                    -- From (1)
-> x:xs
Hence Proved by Induction.
```

## Proof: Associativity
`m >>= f >>= g is equivalent to m >>= (\ x -> f x >>= g)`

```
Lemma: ([] >>= f) = [] for all functions f
Proof: 
-> ([] >>= f)
-> (concat $ map f [])
-> (concat [])         -- Map on empty list
-> []                  -- By defination of concat
```


### Base Case m == []
```
-> (m >>= f) >>= g
-> [] >>= g          -- By lemma
-> []                -- By lemma
-> [] >>= (\x -> f x >>= g) -- By reverse applying lemma
Proved for base case
```


### Induction Step
Assuming associativity is True for all tails of x and their tails.  
Mathematically: for m == (x:xs)  
Hypothesis: `xs >>= f >>= g is equivalent to xs >>= (\ y -> f y >>= g)`

```
Lemma1: (x:xs >>= f) = [x]>>=f ++ (xs>>=f)
Proof:
-> (x:xs >>= f)
-> concat $ map f x:xs                         -- From(2)
-> concat $ (f x):(map f xs)                   -- From defination of map
-> [(f x)] ++ (concat $ map f xs)              -- From defination of concat (foldl (++) [])
-> (concat $ map f [x]) ++ (concat $ map f xs) -- Reversing concat and map
-> ([x]>>=f) ++ (xs>>=f)                       -- Reverse applying (2)
```
```
Lemma2: ([(f x)] >>= g) = ([x] >>= (\y->fy>>=g))
Proof:
From RHS
-> [x] >>= (\y->fy>>=g)
-> concat $ map (\y->fy>>=g) [x]      -- From (2)
-> concat $ [((\y->fy>>=g) x)]        -- Applying map
-> concat $ [(f x) >>= g]             -- Applying function
-> concat $ [concat $ map g [(f x)]]  -- From (2)
-> concat $ [concat $ [g (f x)]]      -- Applying Map
-> concat $ [[g (f x)]]               -- Applying Concat
-> [g (f x)]                          -- Applying Concat
Proved Lemma, RHS=LHS
```

```
For m == x:xs
-> (m >>= f) >>= g
-> ([x]>>= f ++ xs>>=f) >>= g     -- From Lemma1
-> (f x):(xs>>=f) >>= g         -- Applying (2) to ([x]>>=f)
-> ([(f x)] >>= g) ++ (xs>>=f >>= g) -- Reverse applying Lemma1
-> ([(f x)] >>= g) ++ (xs >>= (\ y -> f y >>= g)) -- From hypothesis
-> ([x] >>= (\y->fy>>=g)) ++ (xs >>= (\ y -> f y >>= g)) -- From Lemma2
-> (x:xs) >>= (\y->fy>>=g)) --From Lemma1
```
True for m, proof by structural induction

## Q3.
Solved in [Assignment4.hs](Assignment4.hs),  
Usage: `fibonacci n`

## Q4.
Solved in [Assignment4.hs](Assignment4.hs),  
### Part (a)
Usage: `addNumsWithDo`
### Part (b)
Usage: `addNumsWithoutDo`