import XCTest
@testable import Heaps

final class BinaryHeapTests: XCTestCase {
   let heap = MinHeap<Int>() // (using: <)

   /// Put setup code here. This method is called before the invocation of each test method in the class.
   override func setUpWithError() throws {
      heap.clear()
   }

   /// Put teardown code here. This method is called after the invocation of each test method in the class.
   override func tearDownWithError() throws {
      heap.clear()
   }

   func testClear() throws {
      heap.add(1)
      heap.add(1)
      heap.add(1)
      heap.clear()
      XCTAssertEqual(heap.size,0)
   }
   func testPeek() throws {
      XCTAssertEqual(heap.peek(),nil)
      heap.add(2)
      XCTAssertEqual(heap.peek()!,2)
      heap.add(1)
      XCTAssertEqual(heap.peek()!,1)
   }

   func testAdd() {
      heap.add(2)
      heap.add(1)
      heap.add(3)
      XCTAssertEqual(heap.peek()!,1)
   }

   func testPop() throws {
      heap.add(12)
      heap.add(3)
      heap.add(14)
      heap.add(1)
      var string: String = ""
      while let first = heap.pop() {
         string += "\(first):"
      }
      XCTAssertEqual(string,"1:3:12:14:")
   }

//   func testCompare() throws {
//      XCTAssertEqual(heap.comparefn(1,2), true )
//   }
   // 17.3 - 17.468 seconds with size == queue.count
   func qtestZPerformance() throws {
      heap.add(0)
      let max = 250000
      self.measure {
         for _ in (1...max) {
            _ = heap.pop()
            _ = (1...3).map {_ in
               heap.addUnique(Int.random(in: 0...max))
            }
         }
      }
      print("\n\nHeap size: \(heap.size)\n\n")
      XCTAssertEqual("0.1.0","0.1.0" )
   }
}

