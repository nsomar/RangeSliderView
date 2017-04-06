//
//  Misc.swift
//  Pods
//
//  Created by Omar Abdelhafith on 06/02/2016.
//
//

import Foundation
import Swift

infix operator |> : AdditionPrecedence


func |> <T, W> (left: T?, right: (T) -> W?) -> W? {
  guard let left = left else { return nil }
  return right(left)
}

func |> <T, W> (left: T, right: (T) -> W) -> W {
  return right(left)
}
