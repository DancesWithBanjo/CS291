--Christian Wiemer
--Exercise 1

halve :: [a] -> ([a],[a])
halve xs = splitAt (length xs `div` 2) xs

--Exercise 2
product' :: Num a => [a] -> a
product' [] = 1
product' (x:xs) = x * (product' xs)

--Exercise 3
safetail :: [a] -> [a]
safetail xs = if length xs == 0 then [] else tail xs

safetail' :: [a] -> [a]
safetail' xs | length xs == 0 = []
             | otherwise = tail xs

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs

--Exercise 4
sumSquares = sum [x^2 | x <- [1..100]]

--Exercise 5
replicate' :: Int -> a -> [a]
replicate' n x =  [x | n <- [1..n]]
