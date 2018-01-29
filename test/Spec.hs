import Test.QuickCheck
import Test.Tasty
import Test.Tasty.HUnit
import Text.Read
import GamePlay

main :: IO ()
main = do
  quickCheck (prop_changeSymmetry :: Int -> Bool)
  defaultMain guessedTests

prop_changeSymmetry :: Int -> Bool
prop_changeSymmetry g =
  (change 50 g) == (change 50 (100 - g))


guessedTests :: TestTree
guessedTests = testGroup "Our guessed tests" [guessedTest, guessedWithBonusTest, absolutelyWrongNumberTest, wrongNumberWithoutBonusTest]


guessedTest :: TestTree
guessedTest = testCase "Testing case good number without bonus"
 (assertEqual "Should give change of 1000 points" (change 50 50)(1000))

guessedWithBonusTest :: TestTree
guessedWithBonusTest = testCase "Testing case good number with bonus"
 (assertEqual "Should give change of 2000 points" (change 0 0)(2000))

absolutelyWrongNumberTest :: TestTree
absolutelyWrongNumberTest = testCase "Testing case guessed 100 with generated 0"
 (assertEqual "Should give change of -2000 points" (change 0 100)(-2000))

wrongNumberWithoutBonusTest :: TestTree
wrongNumberWithoutBonusTest = testCase "Testing case guessed 50 with generated 0"
 (assertEqual "Should give change of -1000 points" (change 0 50)(-1000))
