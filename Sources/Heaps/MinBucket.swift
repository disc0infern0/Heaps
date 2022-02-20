//
//  File.swift
//  
//
//  Created by Andrew Cowley on 20/02/2022.
//

import Foundation

public class MinBucket<DataType: Equatable>: MinBucketType, CustomStringConvertible {
   public let version = "0.1.0"
   /// The backing storage for our  Bucket heap
   var store: [Int:[DataType]] = [:]

   public var isEmpty:Bool { store.isEmpty }

   public init() { }

   public func clear() -> Void {
      store = [:]
   }
   public func add(_ data: DataType, value: Int) {
      var list = store[value] ?? []
      list.append(data)
      store[value] = list
   }
   public func addUnique(_ data: DataType, value: Int) {
      if var scoreList = store[value], !scoreList.contains(data) {
         scoreList.append(data)
         store[value] = scoreList
      }
   }
   public func pop() -> DataType? {
      var returnValue: DataType? = nil
      if let firstkey = store.keys.sorted(by: <).first {
         var list = store[firstkey]!
         returnValue = list.popLast()
         if list == [] {
            store[firstkey] = nil
         } else {
            store[firstkey] = list
         }
      }
      return returnValue
   }
   public func peek() -> DataType? {
      guard !store.isEmpty else { return nil}
      return store[store.keys.sorted(by: <).first!]!.first
   }

   public var description: String { store.description }

}
