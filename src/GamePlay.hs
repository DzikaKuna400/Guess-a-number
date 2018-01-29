{- |
Module      : GamePlay
Description : A module that providing gameplay for users
Copyright   : (c) Lukasz Stanik, Andrzej Szaflarski 2018
License     : GPL-3
Maintainer  : stanik.lukasz@outlook.com
-}

module GamePlay (gamePlay, game, change) where

--imports
import System.Random
import Data.Char
import Reading
import HallOfFame

--interface
-- | Main function that provide whole gameplay.
game :: Int -> IO ()
-- | Function that makes one turn of a gameplay.
gamePlay :: Int -> IO Int
-- | Function that calculates a change of score.
change :: Int -> Int -> Int
-- | Function used to exit a game.
-- It provides a choice - to save or not to save a score.
exitGame :: Int -> IO ()

--implementation

game score = do
    score <- gamePlay score
    putStr "Your score is now:        "
    print score
    putStrLn ""
    putStrLn "Do you want to exit? (YES / anything else is NO)"
    s <- getLine
    case map toUpper s of
      "YES" -> exitGame score
      otherwise -> game score


gamePlay x = do
    putStrLn ""
    putStrLn "Let's guess a number from 0 to 100:"
    guess <- readUntilValid
    number <- (randomRIO (0,100) :: IO Int)
    mychange <- return (change number guess)
    putStrLn ""
    putStr "Your guess is:            "
    print guess
    putStr "The number to guess was:  "
    print number
    putStr "You're score change is:   "
    print mychange
    return (x+mychange)


change n g = let
    reward = (abs(50-g)*20)
    distance = (abs(n-g))
    in (1000-distance*40+reward)


exitGame score = do
    putStrLn ""
    putStrLn "Do you want to save your score? (YES / anything else is NO)"
    s <- getLine
    case map toUpper s of
      "YES" -> saveScore score
      otherwise -> putStrLn "Thank you for playing!" >> return ()
