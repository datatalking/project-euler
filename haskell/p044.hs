-- Pentagon numbers
-- Problem 44

-- Pentagonal numbers are generated by the formula, Pn=n(3n−1)/2. The
-- first ten pentagonal numbers are:

-- 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

-- It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their
-- difference, 70 − 22 = 48, is not pentagonal.

-- Find the pair of pentagonal numbers, Pj and Pk, for which their sum
-- and difference are pentagonal and D = |Pk − Pj| is minimised; what
-- is the value of D?

import Control.Monad (guard)
import Math.NumberTheory.Powers.Squares (isSquare, exactSquareRoot)

p n = n * (3*n - 1) `div` 2

pents = map p [1..]

isPentagonal :: Integral a => a -> Bool
isPentagonal n = case (exactSquareRoot $ 24 * n + 1) of
  Nothing -> False
  Just r -> r `mod` 6 == 5

array = do
  m <- [1..]
  k <- [1..m-1]
  guard (isPentagonal $ p m + p k)
  guard (isPentagonal $ p m + p k + p k)
  return (p m)

problem44 = head array

-- main = print problem44
main = print "15 seconds"
