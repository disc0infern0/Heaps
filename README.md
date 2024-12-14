# Heaps

A binary heap is defined as a binary tree with two additional constraints:

- Shape property: a binary heap is a complete binary tree; that is, all levels of the tree, except possibly the last one (deepest) are fully filled, and, if the last level of the tree is not complete, the nodes of that level are filled from left to right.
- Heap property: the key stored in each node is either greater than or equal to (≥) or less than or equal to (≤) the keys in the node's children, according to some total order.

per Wikipedia, a heap is a common implementation of a priority queue, which is commonly used for in place sorting. 
A priority queue is defined thus: 
"Each element in a priority queue has an associated priority. In a priority queue, elements with high priority are served before elements with low priority. In some implementations, if two elements have the same priority, they are served in the same order in which they were enqueued. In other implementations, the order of elements with the same priority is undefined."


**This package contains an implementation of two heaps:-**      
- A (binary) min heap   
- A min bucket heap

#Binary MinHeap   

See [https://en.wikipedia.org/wiki/Binary_heap](this wikipedia entry) for details of a binary heap.
This class exposes the following methods: 
- `pop()` Return the lowest item and remove it from the heap.
- `add(_:)` Add an item to the heap
- `addUnique(_:)` Adds an item if it is not already in the heap.   
- `clear()`: Remove all items in the heap.
- `peek()`: Retrieve the first item in the heap (i.e. the lowest value)

##Usage:
**`MinHeap<DataType: Equatable, Hashable>(using: (DataType,DataType) -> Bool)**
   
Example of an interger min heap:
```swift
MinHeap<Int>(using: <)
```

The `using` parameter is a function/closure that takes two elements and returns true if the first element is less than the second.   
i.e. it should be equivalen to the `<` operator.

#Binary MinBucket

It must be useful for something, but as at time of writing, I can't recall quite what. Answers on a postcard please.   

MinBucket uses a dictionary to store an array of `<DataType>` values, keyed by an integer value.
This class exposes the following methods: 
- `pop()` Find the array with the smallest key value,  then remove the last item in the array and return it.
- `add(_ : DataType, value: Int)` Add an item to the heap with a key of `value`
- `addUnique(_:, value: Int)` Add an item to the heap with a key of `value` if it is not already in the heap.   
- `clear()`: Remove all items in the heap.
- `peek()`: Get the smallest key value from the dictionary, then retrieve the first item in the array 
