import Foundation

class Node {
    var next: Node?
    var prev: Node?
    var value: Int?
    
    init(next: Node? = nil, prev: Node? = nil, value: Int?) {
        self.next = next
        self.prev = prev
        self.value = value
    }
}

struct CircularLinkedList {
    var head: Node?
    var tail: Node?
    
    var solution: Int = 0
    
    mutating func append(_ value: Int) {
        if head == nil {
            var newNode = Node(value: value)
            head = newNode
            tail = newNode
            return
        }
        
        var newNode = Node(value: value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        
        tail?.next = head
        head?.prev = tail
    }
    
    var returnHead: Int? {
        return head?.value
    }
    
    var returhTail: Int? {
        return tail?.value
    }
    
    mutating func removeHead() {
        var nextHead = head?.next
        nextHead?.prev = tail
        tail?.next = nextHead
        head = nextHead
    }
    
    func currentIndexCount() -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != tail?.value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    func findIndex(from value: Int) -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    mutating func turnLeft() {
        head = head?.next
        tail = tail?.next
        solution += 1
    }
    
    mutating func turnRight() {
        head = head?.prev
        tail = tail?.prev
        solution += 1
    }
    
}

func solution(size: Int, pickNumberList: [Int]) {
    
    var testCircularLinkedList = CircularLinkedList()
    for i in 1...size {
        testCircularLinkedList.append(i)
    }
    
    for i in pickNumberList {
        let currentNodeCount = testCircularLinkedList.currentIndexCount()
        let centerCount = currentNodeCount / 2
        let valueIndex = testCircularLinkedList.findIndex(from: i)
        
        if valueIndex == 0 {
            testCircularLinkedList.removeHead()
            continue
        }
        
        if centerCount < valueIndex {
            for _ in 0..<(currentNodeCount-valueIndex+1) {
                testCircularLinkedList.turnRight()
            }
            testCircularLinkedList.removeHead()
            continue
        }
        
        if centerCount >= valueIndex {
            for _ in 0..<valueIndex {
                testCircularLinkedList.turnLeft()
            }
            testCircularLinkedList.removeHead()
            continue
        }
        
    }
    print(testCircularLinkedList.solution)
}

var input = readLine()!.split(separator: " ").map{ $0 }



