import Foundation

///A BinaryHeapType implementation based on a Heap data structure.
// Hashable is required for the 'contains' dictionary
public class MinHeap <DataType: Hashable>: BinaryHeapType {
   /// The backing storage for our min heap
   var store: [DataType]
   let version = "0.1.0"
   let comparefn: (DataType, DataType) -> Bool
   public init( using comparefn: @escaping (DataType, DataType) -> Bool) {
      store = [DataType]()
      self.comparefn = comparefn
   }

   // Avoid checking against queue.contains; track with hash.
   private var contains: [DataType: Bool] = [:]
   /// The current size of the queue.
   public var size: Int { store.count }

   @discardableResult
   public func add(_ item: DataType) -> Bool {
      store.append(item)
      if size > 1 {
         heapifyUp()
      }
      contains[item] = true
      return true
   }
   @discardableResult

   public func addUnique(_ item: DataType) -> Bool {
      // queue.contains is expensive in terms of cpu so use a hashtable
      return (contains[item] ?? false) == false ? add(item) : false
   }

   public func peek() -> DataType? {
      return store.first
   }

   public func clear() {
      store.removeAll()
      contains = [:]
   }

   /// - Description: Pops the first item in the queue
   /// restores the min heap order of the queue by moving the root item towards the end of the queue.
   /// - returns: The first item in the queue, or nil if queue is empty
   public func pop() -> DataType? {
      // Whilst we return the first item, the only thing that we actually
      // remove is the last item, (which may be the first)
      guard store.first != nil else { return nil }
      let firstItem = store.first
      if let lastItem = store.popLast() {
         if firstItem != lastItem {
            store[0] = lastItem
            heapifyDown()
         }
      }
      contains[firstItem!] = false
      return firstItem
   }

   /// Restores the min heap order of the queue by moving an item towards the beginning of the queue.
   private func heapifyUp() {
      var child = store.endIndex - 1
      var parent = child.parent
      while child != store.startIndex, comparefn(store[child], store[parent]) {
         swap(parent, with: child)
         child = parent
         parent = child.parent
      }
   }
   /// Restores the min heap order of the queue by moving the root item towards the end of the queue.
   private func heapifyDown() {
      var parent = store.startIndex

      while parent.leftChild < store.endIndex {
         let leftChild = parent.leftChild
         var minChild = leftChild
         let rightChild = parent.rightChild
         if rightChild < store.endIndex,
            comparefn(store[rightChild], store[leftChild] ) {
            minChild = rightChild
         }
         if comparefn(store[minChild],store[parent]) {
            self.swap(parent, with: minChild)
            parent = minChild
         } else {
            break
         }
      }
   }

   /// Swaps the items located at two different indices in our backing storage.
   /// - parameter firstIndex: The index of the first item to swap.
   /// - parameter secondIndex: The index of the second item to swap.
   private func swap(_ firstIndex: Array.Index, with secondIndex: Array.Index) {
      (store[firstIndex], store[secondIndex]) = (store[secondIndex], store[firstIndex])
   }
}

extension MinHeap: CustomStringConvertible {
   public var description: String {
      return store.description
   }
}

fileprivate extension Array.Index {
   var leftChild: Array.Index { return self+self+1 }
   var rightChild: Array.Index { return self+self+2 }
   var parent: Array.Index { return (self-1)/2 }
}
