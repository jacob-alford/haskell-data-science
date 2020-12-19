{-# LANGUAGE OverloadedStrings #-}

module Lib
  ( someFunc,
  )
where

import qualified Network.HTTP as N

someFunc :: IO ()
someFunc = print "Hello"
