import Foundation

class Node<T> {
    var prev: Node?
    var value: T?
    var next: Node?
    
    init(prev: Node? = nil, value: T?, next: Node? = nil) {
        self.prev = prev
        self.value = value
        self.next = next
    }
}

struct DoublyLinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func append(_ value: T) {
        if head == nil {
            let newNode = Node(value: value)
            head = newNode
            tail = newNode
            return
        }
        
        /// 이렇게 해도 head가 next를 가지고 있을 수 있는 이유
        /// 만약에 첫번째 요소인 0을 추가한 상태라면 바로위의 과정을 거쳐서 head라는 변수와 tail이라는 변수가 [prev: nil, value: 0, next: nil]이라는 node를 바라보고 있음
        /// 두번째 요소인 value로 1을 가지는 node[prev: nil, value: 1, next: nil]이라는 노드를 추가해주기위해서 우선 기존 tail의 next를 value가 1인 노드로 설정해줌
        /// 이 순간 이미 head와 tail이 바라보는node가 동일하기 때문에 head도 새로운 node를 바라보게 되는거임
        /// 그리고나서 새로운 node의 prev를 기존 tail이 바라보는 노드에 연결시켜주면 새로운 node도 head와 기존 tail이 바라보는 node를 바라보게됨
        /// [prev: nil, value: 0, next: value가1인노드] [prev: value가 0인 노드, value: 1, next: nil]
        /// 이상태에서 tail만 바꿔주면됨
        let newNode = Node(value: value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    mutating func removeLast() {
        if head == nil || tail == nil {
            return
        }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        /// tail의 이전노드의 nex에 기존 tail의 next인 nil을 할당해줌
        tail?.prev?.next = tail?.next
        /// 기존 tail을 바라보고 있는게 없어서 RC가 0이됨 -> 자동으로 메모리해제
        tail = tail?.prev
    }
    
    mutating func removeFirst() {
        if head == nil || tail == nil {
            return
        }
        
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        head?.next?.prev = head?.prev
        head = head?.next
    }
    
    var headValue: T? {
        return head?.value
    }
    
    var tailValue: T? {
        return tail?.value
    }
}

var testDoublyLinkedList = DoublyLinkedList<Int>()
testDoublyLinkedList.append(0)
testDoublyLinkedList.append(1)
testDoublyLinkedList.append(2)
testDoublyLinkedList.append(3)
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
print("초기세팅")
print(testDoublyLinkedList.headValue!)
print(testDoublyLinkedList.tailValue!)

testDoublyLinkedList.removeLast()
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
print("tail삭제후")
print(testDoublyLinkedList.headValue!)
print(testDoublyLinkedList.tailValue!)

testDoublyLinkedList.removeFirst()
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
print("head삭제후")
print(testDoublyLinkedList.headValue!)
print(testDoublyLinkedList.tailValue!)

