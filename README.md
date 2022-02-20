# Heaps

Implementation of two heaps; 
##a (binary) min heap
##a min bucket heap

#MinHeap
As per the MinHeapType protocol, this class exposes a ```pop()``` method, which 
will always return the lowest item added
The ```add(_:)``` method will add items, and ```addUnique(_:)``` adds an item if
it is not already in the heap.
A comparison function needs to be supplied to the init of the class, that will operate im the same way that the less than operator ```<``` does. i.e. it takes two operands, and should return true if the left hand side is less than the right hand side.
