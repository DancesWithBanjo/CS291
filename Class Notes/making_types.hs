--Making Types
type String = [Char]  -- How haskell makes types

type Grid = [Position]
type Position = (Int, Int)

--Type doesn't allow recursive definitions
type Tree = (Int, [Tree])  -- I can't let you do that Starfox!!

--Define completely new types with "data"
data Bool = False|True

data Shape = Cricle Float | Rect Float Float  -- Circle is a shape that takes a float and Rect is a shape that takes two floats

sqaure :: Float -> Shape -- creates a square
sqaure n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x*y
--Circle and Rect are constructor functions here!


data Maybe a = Nothing | Just a  --this is a standard library type
--Just is a constructor that takes in a

--using Maybe
safediv :: Int -> Int -> Maybe Int  -- Always returns an Int. Basically dividing by zero won't break it by defining it with Maybe
safediv _ 0 = Nothing
safediv m n = Just (m `div` n)

safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)

--Maybe is a functor. A Functor can contain values and can be mapped over

> fmap (*2) (Just 200)
Just 400

> fmap (*2) Nothing
Nothing

> fmap (*2) [1,2,3,4,5]
[2,4,6,8,10]

--We can define types recursively!
data Nat = Zero | Succ Nat

> :t Zero
Zero :: Nat

nat2Int :: Nat -> Int
nat2Int Zero = 0
nat2Int (Succ n) = 1 + nat2Int n

--Lets make our own lists with blackjack and hookers!
data List a = Nil | Cons a (List a) deriving (Show) -- this allows you to show the list when simply entering one into GHCi

len :: List a -> Int
len Nil = 0
len (Cons _ xs) = 1 + lens xs

myList =  Cons 'a' (Cons 'b' (Cons 'c' (Nil)))

> foldr (:) [] myList


--MAke a Treee
data Tree = Leaf Int | Node Tree Int Tree  -- (left tree, the number in the top node, right tree)

t :: Tree
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))
    5
  /   \
  3   7
 / \ / \
 1 4 6 9

occurs :: Int -> Tree -> Bool -- checks if a num is in a tree
occurs m (Leaf n) = m == n
occurs m (Node left n right) = m == n || occurs m left || occurs m right

flatten :: Tree -> [Int] -- Takes a tree and puts it into list form
flatten (Leaf n) = [n]
flatten (Node left n right) = flatten left ++ [n] ++ flatten right
