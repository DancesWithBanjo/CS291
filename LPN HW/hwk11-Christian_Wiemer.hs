--Christian Wiemer
import Data.List
import Data.Char
--Exercise 1

--sumpairs :: Int => a -> [a] -> [(a,a)]
--sumpairs [] _ = []
--sumpairs (x:xs) n | x+(fst xs) == n = (x,(fst xs))
--                  | otherwise = sumpairs xs n

--Exercise 2
--combinations :: Int -> [a] -> [[a]]
--combinations [] _ = []
--combinations n xs = filter (length xs == n) (permutations xs)



--Exercise 3
dec2int :: [Int] -> Int
dec2int xs = foldl (\x y -> (y+(x*10))) 0 xs


--Exercise 4
--base2int :: Int -> String -> Int
--base2int n xs = foldl (\x -> [x]) 0 xs

--Exercise 5
-- Caeser Cypher

let2int :: Char -> Int
let2int c | isLower c = ord c - ord 'a'
          | isUpper c = ord c - ord 'A'

int2let :: Int -> Char
int2let n = chr (ord 'a' + n)

int2Cap :: Int -> Char
int2Cap n = chr (ord 'A' + n)

shift :: Int -> Char -> Char  -- shifts the letter in the alphebet by the given num
shift n c | isLower c = int2let((let2int c + n) `mod` 26)
          | isUpper c = int2Cap((let2int c + n) `mod` 26)
          | otherwise = c

      --    > shift 3 'a'
      --    'd'

      --    > shift (-3) 'c'
      --    'z'

-- Use list comprehension and shift to encode a string
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- encode 3 "haskell is fun"
--"kdvnhoo lv ixq"

--encode (-3) "kdvnhoo lv ixq"
--"haskell is fun"

--Tools for cracking the Caeser Cypher
table :: [Float]
table = [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0, 0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
           where n = lowers xs

lowers :: String -> Int
lowers xs = length [x | x <- xs, isLower x]

count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x == x']

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e| (o, e) <- zip os es]  -- compares list of expected frequencies and obtained frequencies

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs -- rotates the elements of a list to the left n times and wraps around

positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i |(x', i) <- zip xs [0..n], x == x']
                  where n = length xs -1


--cracking the code
crack :: String -> String
crack xs = encode (-factor) xs
   where
      factor = head (positions (minimum chitab) chitab) -- find the position of the smallest chitab
      chitab = [chisqr (rotate n table') table|n <- [0..25]] -- gives a list of every possible shifts
      table' = freqs xs -- freqs gives a list of 26 numbers representing a percentage of each letter in a string
