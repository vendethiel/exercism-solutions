{-# LANGUAGE BinaryLiterals #-}

module SecretHandshake (handshake) where

import Data.Bits ((.&.))
import Control.Monad.Writer

handshake :: Int -> [String]
handshake n = reverseIfNeeded n $ execWriter $ do
    when (n .&. 0b0001 > 0) $ tell ["wink"]
    when (n .&. 0b0010 > 0) $ tell ["double blink"]
    when (n .&. 0b0100 > 0) $ tell ["close your eyes"]
    when (n .&. 0b1000 > 0) $ tell ["jump"]
    where
        reverseIfNeeded n =
            if n .&. 0b10000 > 0
            then reverse
            else id