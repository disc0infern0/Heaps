# Heaps

A binary heap is defined as a binary tree with two additional constraints:

- Shape property: a binary heap is a complete binary tree; that is, all levels of the tree, except possibly the last one (deepest) are fully filled, and, if the last level of the tree is not complete, the nodes of that level are filled from left to right.
- Heap property: the key stored in each node is either greater than or equal to (≥) or less than or equal to (≤) the keys in the node's children, according to some total order.

per Wikipedia, a heap is a common implementation of a priority queue, which is commonly used for in place sorting. 
A priority queue is defined thus: 
"Each element in a priority queue has an associated priority. In a priority queue, elements with high priority are served before elements with low priority. In some implementations, if two elements have the same priority, they are served in the same order in which they were enqueued. In other implementations, the order of elements with the same priority is undefined."


Implementation of two heaps; 
##a (binary) min heap
##a min bucket heap

#MinHeap<DataType: Equatable>
As per the MinHeapType protocol, this class exposes the following methods: 
- `pop()` : Return the lowest item added.
- `add(_:)` Add an item to the heap
- `addUnique(_:)` adds an item if it is not already in the heap.   

A comparison function needs to be supplied to the init of the class, that will operate in the same way that the less than operator `<` does. i.e. it takes two operands, and should return true if the left hand side is less than the right hand side.

#MinBucket

