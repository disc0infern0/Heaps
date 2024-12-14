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

//Used for MinBucket
protocol MinBucketType: BaseHeap {
   var store: [Int:[DataType]] {get set}
   func add(_: DataType, value: Int)
}

//Used for MinHeap
protocol BinaryHeapType: BaseHeap where DataType: Hashable{
    var store: [DataType] {get set}
    func add(_: DataType) -> Bool
    var comparefn: (DataType, DataType) -> Bool {get}
}
