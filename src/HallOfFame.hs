module HallOfFame (saveScore) where

  import System.IO

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
