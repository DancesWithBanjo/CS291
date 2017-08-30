test :: [Char] -> Bool
test ['a', _, _] = True
test _           = False
test ['a','b','c'] = True
--this will always fail unless there are 3 arguments (of Char) and the 1st one is 'a'

--Cons operator
--lists are constructed one element at a time from an empty list using the cons operator
--[1,2,3] is as follows:
1:(2:(3:[]))

--the cons operator is assumed to assocate to the right, so this can be written as:
1:2:3:[]

--the type is:
(:) :: a -> [a] -> [a]

null    :: [a] -> Bool
null [] = True
null (_:_) = False

head :: [a] -> a



add3 :: Int -> Int
add3 n = n+3

add3toAll :: [Int] -> [Int]
add3toAll xs = map add3 xs   -- first arg of map is a function and then a list
                             -- map takes a function and applies it to every element in the list

map :: (a->b) -> [a] -> [b]


--List comprehensions
--a way to construct lists from previously existing lists
--kind like loops
-- | is read as "such that"
-- <- is read as "is drawn from"

> [x^2 | x <- [1..5]]
[1,4,9,16,25]

> [(x,y) | x <- [1..3], y <- [x..3]]
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


factors :: Int -> [Int]
factors n = [x | x <- [1..n], n 'mod' x == 0]  --only adds into the list if the mod stuff is true
