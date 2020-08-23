module Dft
  ( dft
  )
where

import           Numeric.LinearAlgebra          ( (#>)
                                                , Vector
                                                , Matrix
                                                , mkPolar
                                                , Complex
                                                , scale
                                                , fromList
                                                , (><)
                                                , size
                                                , fromList
                                                )
import           Data.List

omega :: Int -> Complex Float
omega n = mkPolar 1 (2 * pi / (fromIntegral n))

omegaPn :: Int -> Int -> Complex Float
omegaPn p = (** (fromIntegral p)) . omega

sqId :: Int -> [(Int, Int)]
sqId n = [ (i, j) | i <- [0 .. n - 1], j <- [0 .. n - 1] ]

dftMat :: Int -> Matrix (Complex Float)
dftMat n = (scale . ((/) 1) . sqrt . fromIntegral) n
  $ (n >< n) [ omegaPn (i * j) n | (i, j) <- sqId n ]

dft :: Vector (Complex Float) -> Vector (Complex Float)
dft x = w #> x where w = dftMat (size x)
