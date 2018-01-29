{- |
Module      : Reading
Description : Tools for reading
Copyright   : (c) Lukasz Stanik 2018
License     : GPL-3
Maintainer  : stanik.lukasz@outlook.com
-}
module Reading (readUntilValid) where

--imports
import Text.Read


--implements
-- | Function that provides a valid input of guessing number
readUntilValid :: IO Int
readUntilValid = do
  s <- getLine
  case (readMaybe s :: Maybe Int) of
    Nothing -> putStrLn "Invalid value. It should be a number! Type again:" >> readUntilValid
    Just x -> if (x<0 || x>100) then   putStrLn "Type a number between 0 and 100:" >> readUntilValid
              else return x
