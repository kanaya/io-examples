s :: [Int]
s = [1..10]

sum' :: [Int] -> Int
sum' (x:xs) = x + sum' xs
sum' []     = 0

main :: IO ()
main = print (sum' s)
