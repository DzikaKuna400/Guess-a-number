{- |
Module      : HallOfFame
Description : Tool to save scores
Copyright   : (c) Lukasz Stanik 2018
License     : GPL-3
Maintainer  : stanik.lukasz@outlook.com
-}

module HallOfFame (saveScore) where

--imports
  import System.IO

--implementation
-- | Function that append a score to a high scores textfile
  saveScore :: Int -> IO ()
  saveScore score = do
    putStrLn ""
    putStrLn "Enter your name:"
    name <- getLine
    handle <- openFile "highscores.txt" AppendMode
    hPutStr   handle name
    hPutStr   handle " - "
    hPutStr   handle $ show score
    hPutStrLn handle " points"
    hClose handle
    putStrLn ""
    putStrLn "Congratulations! You're score have been saved in our Hall of fame!"
    return ()
