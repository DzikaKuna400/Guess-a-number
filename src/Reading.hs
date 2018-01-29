module Reading (readUntilValid) where

import Text.Read

readUntilValid :: IO Int
readUntilValid = do
  s <- getLine
  case (readMaybe s :: Maybe Int) of
    Nothing -> putStrLn "Invalid value. It should be a number! Type again:" >> readUntilValid
    Just x -> if (x<0 || x>100) then   putStrLn "Type a number between 0 and 100:" >> readUntilValid
              else return x
