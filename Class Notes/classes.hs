--Basic classes

Eq --things that can be compared for equality or inequality, not functions
(==) :: a->a->Bool
(/=) :: a->a->Bool
Prelude> (True,'a') == ('a',True)

Error -- order matters

Ord -- things that can be linearyly ordered
(<)
(<=)
(>)
(>=)
min
max

Show -- things that can be converted into strings for display (toString)
show :: a -> String --wraps the input as a string


Read -- things that can be converted from strings as input
read :: String -> a

Prelude> read "123" :: Int
123

Num -- numbers
--belongs to Eq, Ord, Show

Integral -- integers
--belongs to Num

Fractional -- non-integral numbers (float, double)
--belongs to Num


--Defining Functions
even :: Integral a => a -> Bool
even n = n 'mod' 2 == 0

splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)  -- splits at the nth index

recip :: Fractional a => a -> a
recip n = 1/n
