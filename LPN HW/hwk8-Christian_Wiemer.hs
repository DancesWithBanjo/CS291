--Chrsitian Wiemer

--Excersize 1
--['a', 'b', 'c'] :: [Char]

--('a', 'b', 'c') :: (Char, Char, Char)

--[(False, '0'), (True, '1')] :: [(Bool,Char)]

--([False, True], ['0', '1']) :: ([Bool], [Char])

--[tail, init, reverse] :: [[a] -> [a]]


--Excersize 2

second xs = head (tail xs) -- :: [a] -> a

swap (x, y) = (y, x) -- :: (a,b) -> (b,a)

pair x y = (x, y) -- :: a -> b -> (a,b)

double x = x * 2 -- :: Num a => a -> a

palindrome xs = reverse xs == xs -- :: Eq a => [a] -> Bool

twice f x = f (f x) -- :: (a -> a) -> a -> a


--Excersize 3

--[0, 1)  should be: [0,1] :: Num a -> [a]  well formed

--double -3  doesn't work, should be double (-3)

--double (-3) :: Num a => a -> a  well formed

--double double 0  doesn't work, should be double (double 0)

--if 1==0 then 2==1  breaks, mine at least says there's intendation mismatch

--"++" == "+" ++ "+" :: Bool  well formed

--[(+),(-)]  :: Num a => [a->a->a]  well formed

--[[],[[]],[[[]]]] :: [[[[a]]]]  well formed

--concat ["tea", "for", '2']  doesn't work, should be conact ["tea", "for", "2"]

--concat ["tea", "for", "2"] :: [Char]  well formed
