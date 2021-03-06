-- Even Fibonacci numbers
-- Problem 2

-- Each new term in the Fibonacci sequence is generated by adding the
-- previous two terms. By starting with 1 and 2, the first 10 terms
-- will be:

-- 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

-- By considering the terms in the Fibonacci sequence whose values do
-- not exceed four million, find the sum of the even-valued terms.

fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n
  | odd n  = let m = (n + 1) `div` 2
             in (fib m)^2 + (fib $ m - 1)^2
  | even n = let m = n `div` 2
             in (2 * (fib $ m - 1) + (fib m)) * (fib m)

p002 = sum . takeWhile (<4*10^6) $ map fib [3,6..]

main :: IO ()
main = print p002
