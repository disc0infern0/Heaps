//
//  File.swift
//  
//
//  Created by Andrew Cowley on 20/02/2022.
//

import Foundation

protocol BaseHeap {
   associatedtype DataType //: Hashable
   func clear() -> Void
   func pop() -> DataType?
   func peek() -> DataType?
}

protocol BinaryHeapType: BaseHeap {
   var store: [DataType] {get set}
   func add(_: DataType) -> Bool
   var comparefn: (DataType, DataType) -> Bool {get}
}

protocol MinBucketType: BaseHeap {
   var store: [Int:[DataType]] {get set}
   func add(_: DataType, value: Int)
}
