//
//  MinBucket.swift
//  
//
//  Created by Andrew Cowley on 20/02/2022.
//

import XCTest
@testable import Heaps

class MinBucketTests: XCTestCase {
   var minBucket = MinBucket<Int>()

    override func setUpWithError() throws {
       minBucket.clear()
    }
    override func tearDownWithError() throws {
       minBucket.clear()
    }

   func testClear() throws {
      minBucket.add(1, value: 1)
      minBucket.add(1, value: 1)
      minBucket.add(1, value: 1)
      minBucket.clear()
      XCTAssertEqual(minBucket.isEmpty,true)
   }
   func testPeek() throws {
      XCTAssertEqual(minBucket.peek(),nil)
      minBucket.add(5, value: 2)
      XCTAssertEqual(minBucket.peek()!,5)
      minBucket.add(3, value: 1)
      XCTAssertEqual(minBucket.peek()!,3)
   }

   func testAdd() {
      minBucket.add(1, value: 3)
      minBucket.add(5, value: 2)
      minBucket.add(10, value: 1)
      XCTAssertEqual(minBucket.peek()!,10)
   }
   func testAddUnique() {
      minBucket.add(11, value: 3)
      minBucket.add(5, value: 3)
      XCTAssertEqual(minBucket.peek()!,11)
   }

   func testPop() throws {
      minBucket.add(5, value: 2)
      minBucket.add(1, value: 3)
      minBucket.add(10, value: 1)
      print("\n\n\n Contents of minBucket:\n\n")
      print(minBucket)
      var string: String = ""
      while let first = minBucket.pop() {
         print(minBucket)
         string += "\(first):"
      }
      print("\n\n\n")
      XCTAssertEqual(string,"10:5:1:")
   }
   func testZPerformance() throws {
      minBucket.add(0, value: 0)
      let max = 250000
      self.measure {
         for _ in (1...max) {
            _ = minBucket.pop()
            _ = (1...3).map {_ in
               minBucket.addUnique(Int.random(in: 0...99), value: Int.random(in: 0...99))
            }
         }
      }
      print("\n\nBucket calcs done \n\n")
      XCTAssertEqual(minBucket.version,"0.1.0" )
   }
}
