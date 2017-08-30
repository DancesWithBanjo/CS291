-- This is the type declaration (Optional, but more direct. Haskell will auto find a type, might not be what you want)
squared :: Int -> Int

-- This is the function definition
squared n = n*n

-- Arithmetic
-- follows PEMDAS
-- functions take the highest priority
Prelude> 2+3  -- 5

Prelude> (+) 2 7  -- 9

Prelude> 2-3  -- -1

Prelude> 2*3  -- 6

Prelude> 7/2  -- 3.5

Prelude> 7 'div' 2 -- 3

Prelude> div 9 2  -- 4

Prelude 7 'mod' 2  -- 1

double :: Int -> Int
double n = n+n
Prelude> double 2^3  -- 64
-- doubles 2 then eponates by 3


-- Make a function with another functio

-- $ puts parenthesizes around whatever follows for rest of the line
-- double $ 2^3


-- List Operations
Prelude> head [1,2,3,4]
1

Prelude> tail [1,2,3,4]
[2,3,4]

Prelude> [1,2,3,4]!!2  -- Gives the Nth index of a list. remember, [0,1,2]
3

Prelude> take 4 [1,2,3,4,5]
[1,2,3,5]

Prelude> drop 3 [1,2,3,4,5]  --drops the first N elements
[4,5]

Prelude reverse [1,2,3,4]
[4,3,2,1]

Prelude> tail (take 4 [1,2,3,4,5])
[2,3,4]

Prelude> [1..10]
[1,2,3,4,5,6,7,8,9,10]

Prelude> [2,4..10]
[2,4,6,8,10]



factorial n = product [1..n]
Prelude> factorial 5
120

average ns = sum ns 'div' length ns   --s is a common way to denote a list of something (ns) - list of ints
Prelude> average [1,2,3,4,5]
3

-- functions and arguments must start with lowercase letters
-- types are capital letters ie: Bool, Char, String ([Char]), Int, Integer

-- Querying types
Prelude> :type 'a'
'a' :: Char

Prelude> :type True
True :: Bool

Prelude> :type (!!)
(!!) :: [a] -> Int -> a  -- a represents a general type that could be filled with any type.

 ['a', 'b', 'c'] = "abc" :: [Char]
['a', 'b', 'c'] :: [Char]
"Hello!" :: [Char]
["One", "Two", "Three"] :: [[Char]]

--TUPLES
--Tuples are finite sequences of specific arity which can contain multiple types
(False, True) :: (Bool, Bool)
(False, 'a', True) :: (Bool, Char, Bool)
("Yes", True, 'a') :: ([Char], Bool, Char)

  --lets get functional
add :: (Int, Int) -> Int
add (x,y) = x+y
Prelude> add(2,3)
5

zeroto :: Int -> [Int]
zeroto n = [0..n]
Prelude> zeroto 5
[0,1,2,3,4,5]

--Curried Functions
--these are functions that take a 1st argument and return 2nd function that returns something

add' :: Int -> (Int -> Int)
add' x y = x+y
increment = add' 1 -- note: only putting in one number arg

Prelude> increment 3
4


--Polymorphic types

Prelude> :type head
head :: [a] -> a

Prelude> head [1,2,3]
1

Prelude> head ['x', 'y', 'z']
'x'

Prelude> :type length
length :: Foldable t => t a -> Int

Prelude> length [1,2,3]
3

Prelude> length ['x', 'y', 'z']
3

--More poly types
fst :: (a,b) -> a

head :: [a] -> a

take :: Int -> [a] -> [a] --returns the prefix of a list??

zip :: [a] -> [b] -> [(a,b)]  --take a list of tuples formed by zipping two lists

id :: a->a  --returns the object itself


--Num functions

(-)  :: Num a => a -> a -> a

(*)  :: Num a => a -> a -> a

negate ::

abs ::

signum ::
