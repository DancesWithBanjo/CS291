--Bertsgame -- Christian Wiemer

--Don't need mondaic stuff or do blocks
--Tony uses a lot of recursion and list comprehension
import Data.List.Split -- for chunksOf
data Color = Red | Blue deriving (Show, Eq)  -- Eq allows for equalities
data Clicks = Click | NoClick deriving (Show, Eq)  --Using data could add more clarity rather than just using strings

flipColor Blue = Red
flipColor Red = Blue

isRed :: [Color] -> Bool
isRed [Red] = True
isRed (firstColor:rest) | firstColor == Blue = False
                        | otherwise = isRed rest

--Main function
bertsgame :: Int -> [[Clicks]]
bertsgame n = [clicklist | clicklist <- (clicklists n), (testSols clicklist (makeBoard n))]  -- allRed shall be a boolean function, allRed will filter out the false lists

testSols :: [Clicks] -> [[Color]] -> Bool
testSols clicks [finalRow] = isRed (startClick finalRow clicks)
testSols clickies (firstRow:secondRow:rest) = testSols workingClicks newBoard
                                            where firstRowClicks = startClick firstRow clickies
                                                  workingClicks = fixRow firstRowClicks
                                                  nextRowColors = nextRow secondRow clickies
                                                  newBoard = (nextRowColors:rest)


fixRow :: [Color] -> [Clicks]
fixRow [] = []
fixRow (firstColor:rest) | firstColor == Blue = (Click:(fixRow rest))
                         | otherwise = (NoClick:(fixRow rest))

--Make List of potential solutions for the top row
--n is the length of the board
clicklists :: Int -> [[Clicks]]
clicklists n = sequence (replicate n [Click,NoClick])




makeBoard n = chunksOf n (take (n^2) (repeat Blue))  -- This is such a round about way to do it.


startClick (first:second:rest) (firstClick:clicks) | firstClick == Click = rowClick (first':second':rest) clicks
                                                   | otherwise = rowClick (first:second:rest) clicks
                                                   where first' = flipColor first
                                                         second' = flipColor second

rowClick [nearColor,edgeColor] [click] | click == Click = [flipColor nearColor, flipColor edgeColor]
                                       | otherwise = [nearColor,edgeColor]
rowClick (first:second:third:rest) (firstClick:clicks) | firstClick == Click = (first'):(rowClick (second':third':rest) clicks)
                                                       | otherwise = (first):(rowClick (second:third:rest) clicks)
                                                      where first' = flipColor first
                                                            second' = flipColor second
                                                            third' = flipColor third

nextRow [] [] = []
nextRow (first:rest) (firstClick:clicks) | firstClick == Click = (first'):(nextRow (rest) clicks)
                                         | otherwise = (first):(nextRow (rest) clicks)
                                        where first' = flipColor first
