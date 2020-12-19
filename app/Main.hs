module Main where

import Data.Text
import Lib
import qualified Network.HTTP.Req as R

main :: Text -> Text -> IO (R.JsonResponse ())
main = getCovidData
