--Interactive Programs

--Restrictions with changing worlds
-- 1. Once you've changed the world, you can't go back
-- 2. You can't duplicate the world
-- 3. You can't inspect the compenents of the world

--lets ring a bell
Prelude> putStr "\a"  --this actually rings a bell

putChar :: Char -> IO () --this writes a character to the screen

-- The >> operator enables IO actions to be carried out in a sequence
(>>) :: IO a -> IO b -> IO b

--If we have actions p and q then p >> q first does p and then does q
> return 1 >> return 2
2  --The return value of the first action is discarded

Prelude> putChar 'x' >> putChar '\n'
x
Prelude>


getChar :: IO Char  --waits for a char from the keyboard then echoes the typed in char

return :: a -> IO a  --returns the value as an IO (monad) value. Very different from return in other langauges

--We can use higher order functions like map on IO actions

done = return () --acts as base case
putStrLn' :: String -> IO ()
putStrLn' xs = foldr (>>) done (map putChar xs)  --prints out the inputed list
                >> putChar '\n'

> Foldr (\ele acc -> (ele >> acc)) (return ()) (map putChar "abcd")  -- ele is the current element. acc is the acumulator of all occured actions
abcd

> Foldr (\acc ele -> (ele >> acc)) (return ()) (map putChar "abcd")
dcba


--The >>= operator is called "bind" or "then apply"
(>>=) :: IO a -> (a -> IO b) -> IO b
-- The combination p >>= f first carries out the p action and returns its return value,
-- then does f action, taking the previous return value as input

getLine :: IO String
getLine = getChar >>= f  -- get a character
          where f x = if x == '\n' then return []
                      else getLine >>= g
                      where g xs = return (x:xs)

getLine' :: IO String
getLine' = getChar >>= \x ->  -- returns the string that you typed in
                       if x == '\n'
                       then return []
                       else getLine' >>= \xs ->
                        return (x:xs)

sayHello = putStr "Hello" >>
           putStr " " >>
           putStr "World!" >>
           putStr "\n"

dosayHello = do  -- this function and the one above are equivelant, do will out but all these functions
             putStr "Hello"
             putStr " "
             putStr "World!"
             putStr "\n"

-- Do

--This function
return 'a' >>= putChar
--Can be done with do block like...
do
  x <- return 'a'
  putChar x

doName :: IO ()
doName = do  -- Example of a nice little interactive thing
  putStr "What's your first name?\n"
  first <- getLine
  putStr "And your last name?\n"
  lastN <- getLine
  let full = first ++ " " ++ lastN
  putStrLn ("Please to meet you, " ++ full ++ "!")


--Consider two pure functions f and g
f,g :: Float -> Float

--we can make a debuggable version called f' and g'
f',g' :: Float -> (Float, String)

f' x = ( f x, "f was called. ")
g' x = ( g x, "g was called. ")

--So we could do...
compfg x = let (y,s) = g' x
               (z,t) = f' y in (z,s++t)
