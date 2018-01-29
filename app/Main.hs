{- |
Module      : Main
Description : A randomized game
Copyright   : (c) Lukasz Stanik 2018
License     : GPL-3
Maintainer  : stanik.lukasz@outlook.com

 Program is a "guess a number" game.
-}

module Main where

--imports
import Reading
import GamePlay

--interface
-- | main function
main :: IO ()

--implementation
-- | Description
main =
    do
      putStrLn ""
      putStrLn "Welcome to the 'Guess a number' game!"
      putStrLn "Here are some rules:"
      putStrLn "You start with 1000 points on your account."
      putStrLn "The you have to guess a number from 0 to 100."
      putStrLn "If you guess is exactly a drawn number, you will get 1000 points."
      putStrLn "Otherwise, you will get/lose 1000-(mistake)*40 points,"
      putStrLn "where 'mistake' means a distance between your guess and a drawn number."
      putStrLn "You get also some extra points if your guess is far from 50"
      putStrLn "- it's (distance from 50)*20."
      putStrLn "It may seem complicated, but it isn't ;)"
      putStrLn "You can exit game at any moment to save your score."
      putStrLn ""
      putStrLn "Let's start a game!"
      putStrLn ""
      putStrLn "Your score is: 1000."
      game 1000
      return ()
