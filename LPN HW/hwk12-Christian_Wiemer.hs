--Christian Wiemer

--Exercise 1
data Tree = Leaf Int | Node Tree Int Tree

sumtree :: Tree -> Int
sumtree (Leaf n) = n
sumtree (Node left n right) = n + (sumtree left) + (sumtree right)


--Exercise 2
data Tree2 = Leaf2 Int | Node2 Tree2 Tree2

numleaves :: Tree2 -> Int
numleaves (Leaf2 n) = 1
numleaves (Node2 left right) = (numleaves left) + (numleaves right)

balanced :: Tree2 -> Bool
balanced tree | (numleaves tree `mod` 2) == 0 = True
              | otherwise = False

--Exercise 3
clicklists :: Int -> [[[Char]]]
--sequence: Makes a lists of lists where each list takes the first element of the given lists to create a new list
--sequence [[1,2],[1,3],[4]] = [[1,1,4],[1,3,4],[2,1,4],[2,3,4]]

clicklists n = sequence (replicate n ["click","noclick"])
