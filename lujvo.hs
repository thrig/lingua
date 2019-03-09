-- make https://github.com/lynn/jvoxaskei useful from CLI environment
--   cp lujvo.hs .../path/to/jvoxaskei/main.hs
--   cd .../path/to/jvoxaskei
--   ghc --make main.hs
--   strip main
--   mv main ...
import System.Environment
import Lojban
import Lujvo

main = do
  tanru <- getArgs
  mapM_ print $ take 5 $ scoredLujvoList tanru
