//
//  File.swift
//  
//
//  Created by Andrew Cowley on 20/02/2022.
//

import Foundation

public class MinBucket<DataType: Equatable>: MinBucketType, CustomStringConvertible {
   /// The backing storage for our  Bucket heap
   var store: [Int:[DataType]] = [:]

   public var isEmpty:Bool { store.isEmpty }

   public init() { }

   public func clear() -> Void {
      store = [:]
   }
    
   /// Add an entry to the Bucket heap with key of `value`
   public func add(_ data: DataType, value: Int) {
      var list = store[value] ?? []
      list.append(data)
      store[value] = list
   }
    
   /// Add an entry to the Bucket heap with key of `value`, but only if nothing is currently stored in that array
   public func addUnique(_ data: DataType, value: Int) {
      if var scoreList = store[value], !scoreList.contains(data) {
         scoreList.append(data)
         store[value] = scoreList
      }
   }
    
    /// Find the array with the smallest key value,  then remove the last item in the array and return it.
   public func pop() -> DataType? {
      guard 
          !isEmpty,
          let key = store.keys.sorted(by: <).first, 
          var items = store[key]
      else { return nil }
      let popped = items.popLast()
      store[key] = items.isEmpty ? nil : items
      return popped
   }
   /// Find the array with the smallest key value, and then return the first item in that array.
   public func peek() -> DataType? {
      guard 
        !isEmpty,
        let key = store.keys.sorted(by: <).first, 
        let items = store[key]
       else { return nil }
      return items.first
   }

   public var description: String { store.description }

}
