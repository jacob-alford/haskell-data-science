{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( getCovidData,
  )
where

import Control.Monad.IO.Class (MonadIO (liftIO))
import Data.Aeson (KeyValue ((.=)))
import qualified Data.Aeson as J
import Data.Text (Text)
import Network.HTTP.Req ((/:))
import qualified Network.HTTP.Req as R

getCovidData :: IO ()
getCovidData = R.runReq R.defaultHttpConfig $ do
  r <-
    R.req
      R.GET
      (R.https "api.covidtracking.com" /: "v1" /: "states" /: "nm" /: "daily.json")
      R.NoReqBody
      R.jsonResponse
      mempty
  liftIO $ print (R.responseBody r :: J.Value)