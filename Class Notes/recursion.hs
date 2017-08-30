import Prelude hiding ((*))
--Recursive Functions
factorial :: Int -> Int
factorial n = product [1..n]

--factorial' :: Int -> Int
--factorial' 0 = 1
--factorial' n = n * factorial' (n-1)

--How do we define (*) in terms of (+)
(*)  :: Num a => a -> a -> a
(*) 0 = 0
(*) a b = a+(*)


(++)  :: [a] -> [a]
[] ++ ys = ys
(x:xs) ++ ys = x:(xs ++ ys)

insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x<=y = x:y:ys
                | otherwise = y:insert x ys

isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

zip' :: [a] -> [a] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n-1) xs

--Mutual recursion.
--check if a num is odd or even
even' :: Int -> Bool
even' 0 = True
even' n = odd' (n-1)

odd' :: Int -> Bool
odd' 0 = False
odd' n = even' (n-1)

--return even or odd indexed els in a list
evens :: [a] -> [a]
evens [] = []
evens (x:xs) = x:odds:xs

odds :: [a] -> [a]
odds [] = []
odds (_:xs) evens xs


--Tips for defining recursive methods
--1: define type
--2: enumerate the cases
--3: define simple cases
--4: define other cases
--5: generalize and simplify

foldr -- encapsulates the pattern of applying a function recursively while passing the value of a function called on a empty list.
product' :: Num a => [a] -> a
product' foldr 1

--Higher order functions
--Functions can take functions as arguments
twice :: (a->a) -> a-> a  -- does the input function twice.
twice f x = f(f x)

--twice (*2) 3  = 12
--twice reverse [1,2,3]  = [1,2,3]

--MAP
map :: (a->b) [a] -> [b]  -- applies a function to every element in a list
map f xs = [f x| x<-xs]

--map (+1) [1,3,5,7]  = [2,4,6,8]
--map isDigit ['a','1','b','2']  = [False,True,False,True]

--map is polymorphic and can be applied to itself to work on lists of lists
--map (map (+1)) [[1,2,3], [4,5]]  = [[2,3,4], [5,6]]

--recursive map definition
map f [] = []
map f [x:xs] = f x: map f xs

--FILTER
filter :: (a->Bool) -> [a] -> [a] -- selects all els of a list that satisfy a truth function (predicate)
filter p xs = [x | x<- xs, p x]

--filter even [1..10]  = [2,4,6,8,10]
--filter (>5) [1..10]  = [6,7,8,9,10]
--filter (/= ' ') "abc def ghi"  = "abcdeghi"

--recursive filter definition
filter' :: (a->Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs) | p x = x: filter' p xs
                 | otherwise = filter' p xs

--ALL returns a single Bool for a condition on a list.
--all even [2,4,6]  = True

or [] = False
or (x:xs) = x || or xs

and [] = True
and (x:xs) = x && and xs

--FOLDR
--foldr encapsulates the basic recursive pattern in a function
--foldr takes an operator and a value corresponding to the empty list case and applies this pattern to the list.
-- f[] = v
-- f(x:xs) = x (operator) fxs

foldr :: (a->b->b) -> b->[a]->b

sum xs = foldr (+) 0 xs
product xs = foldr (*) 1 xs
or xs = foldr (||) False xs
and xs = foldr (&&) True xs

length' xs = foldr (\x y -> (y+1)) 0 xs
--or
length' = foldr (\_ y -> 1+n) 0  -- don't need to have the xs (point free style)

reverseList  xs = foldr (\x y -> y ++ [x]) [] xs
reverse' x xs = xs ++ [x]


--foldl
--foldr but associates to the left
--fv[] = v
--fv(x:xs) = x f(v (operaotr) x) xs

--foldr and foldl can yeild the same thing some times
foldr (+) 0 [1,2,3,4,5] = 15
foldl (+) 0 [1,2,3,4,5] = 15
--foldr: 1+(2+(3+(4+5)))
--foldl: (((4+5)+3)+2)+1

--Lazy evaulation
--How fold handles infinity lists
take 5 $ foldr (:) [] [1..] = [1,2,3,4,5]  -- the $ basically puts everything to the right of it in parethesis = (foldr (:) ...)

foldl (flip (:)) [] [1..5] = [5,4,3,2,1]  -- flip takes a binary function and generates an equivilent function with its arguments reversed

foldl (\xs x -> xs ++ [x]) [] [1..]  -- note the argument order
--(...(((([]++[1])++[2])++[3])++[4])...)

foldr (&&) True (repeat False)  --returns False

foldr (&&) True (repeat True)  --doesn't terminate

foldl (&&) True (repeat False)  -- doesn't terminate -- keeps adding items but never evaluating the first Bool

foldr (\x y -> y) 0 [1..5] = 0 --returns default basecase
foldr (\x y -> x) 0 [1..5] = 1 --retuns the head and essentially removes the tail

foldl (\x y -> y) 0 [1..5] = 5 --returns default basecase
foldl (\x y -> x) 0 [1..5] = 0

--in the Data.List library, there is foldl' which has a step to reduce the leftmost expressions. Great for very large (finite) lists
--ALWAYS USE FOLDL'


--Composition Operator (.)

(.) :: (b->c) -> (a->b) -> (a->c)
f . g = \x-> f (g x)

--instead of
odd n = not (even n)
twice f x = f (f x)
sumsqreven ns = sum (map(^2)) (filter (even ns)) -- takes the sum of all even squared nums in a list

--We can do
odd = not . even
twice f = f . f
sumsqreven = sum . map (^2) . filter even


compose :: [a -> a] -> (a->a)
compose foldr (.) id

id :: a-> a -- identity functions, returns itself
id - \x -> x
