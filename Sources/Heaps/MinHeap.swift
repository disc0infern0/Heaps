import Foundation

///A BinaryHeapType implementation based on a Heap data structure.
// Hashable is required for the 'contains' dictionary
public class MinHeap <DataType: Hashable & Comparable>: BinaryHeapType {
   /// The backing storage for our min heap
   var store: [DataType]
//   let comparefn: (DataType, DataType) -> Bool
    
    /// - parameter using: A function that takes two elements and returns true if the first element is less than the second.
    public init() { // using comparefn: @escaping (DataType, DataType) -> Bool) {
      store = [DataType]()
//      self.comparefn = comparefn
   }

   // Avoid checking against queue.contains; track with dictionary (requires hashable)
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
      // Don't check the backing store directly, check the dictionary instead.
      return (contains[item] ?? false) == false ? add(item) : false
   }

   public func peek() -> DataType? {
      return store.first
   }

   public func clear() {
      store.removeAll()
      contains = [:]
   }

   /// Pop the first item in the queue
   /// restores the min heap order of the queue by moving the root item towards the end of the queue.
   /// - returns: The first item in the queue, or nil if queue is empty
   public func pop() -> DataType? {
      // Whilst we return the first item, the only thing that we actually
      // remove is the last item, (which may be the first)
       
       guard let firstItem = store.first, let lastItem = store.popLast() else { return nil }
       if firstItem != lastItem {
           store[0] = lastItem //overwrite the first item in the heap with (what was) the last
           heapifyDown() //restore heap ordering
       }
       contains[firstItem] = false
       return firstItem
   }

   /// Restores the min heap order of the queue by moving an item towards the beginning of the queue.
   private func heapifyUp() {
      var child = store.endIndex - 1
      var parent = child.parent
       while child != store.startIndex, store[child] < store[parent]  { // comparefn(store[child], store[parent]) {
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
//            comparefn(store[rightChild], store[leftChild] ) {
            store[rightChild] < store[leftChild]  {
            minChild = rightChild
         }
//         if comparefn(store[minChild],store[parent]) {
         if store[minChild] < store[parent] {
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
