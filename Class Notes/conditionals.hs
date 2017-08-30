--Conditionals

abs:: Int -> Int
abs n = if n>=0 then n else -n

signum :: Int -> Int
signum n = if n < 0 then -1 else  -- can't have more ifs on this line, must be on a new line
              if n == 0 then 0 else 1 -- just returns one of these values based on condition

--Conditionals MUST have an else branch, has to return something

--Guards
--an alternate to conditionals,
--can choose among a sequence possible return values

abs n | n > 0     = n
      | otherwise = -n

-- | reads as "such that"
-- Conditions are listed in the sequence. "otherwise" handles any condition not listed.

signum n | n < 0     = -n
         | n == 0    = 0
         | otherwise = 1

--patttern matching
-- we can tell haskell which function definition to use by giving a pattern in to match in the argument position

signum'' 0 = 0
signum'' n = if n > 0 then 1 else -1

(/\) :: Bool -> Bool -> Bool
True /\ True = True
_    /\ _    = False

-- Note: you can use the same name for arguments in the same equation: b /\ b = b, can't do that.

fst :: (a,b) -> a
fst (x,_) = x

snd :: (a,b) -> b
snd (_,y) = y

factorial   :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)
