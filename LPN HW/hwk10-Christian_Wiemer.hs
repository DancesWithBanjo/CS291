--Christian Wiemer

--Excersize 1
--mult x y z = x*y*z
mult = (\x y z -> x*y*z)

--Excersize 2
--[(x,y) | x <- [1,2,3], y <- [4,5,6]]

combine = concat ([x | x<-[1,2,3]]:[[y] | y<-[4,5,6]])


--Excersize 3
scalarproduct xs ys = sum [ x*y | (x,y) <- (zip xs ys)  ]

--Excersize 4
--insertAt 'X' "abcd" 2
--"aXbcd"

insertAt x [] _ = [x]
insertAt x (y:ys) num | num==1 = x:y:ys
                      | otherwise = y:insertAt x ys (num-1)

--Excersize 5
--currently only works with adjacent duplicates
removeDup [] = []
removeDup (x1:x2:xs) | x1==x2 = x2:xs
                     | otherwise = removeDup (x2:xs)
