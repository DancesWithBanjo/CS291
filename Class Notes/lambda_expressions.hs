--Lambda expressions are written as \
--These functions don't have names
--Abstracted variables

\x -> x+x

(\x -> x+x) 2
4

odds    :: Int -> [Int]
odds n  = map f [0..n-1]
          where f x = x * 2+1
-- but as a lambda expression
odds n = map (\x -> x *2+1) [0..n-1]
