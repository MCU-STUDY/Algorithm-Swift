import Foundation

class Node<T> {
    var value: T?
    var next: Node?
    
    init(value: T?, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

final class SinglyLinkedList<T> {
    /// 맨앞부터 순서대로 지나가야하므로 처음부분이라는 기준점이 필요하다
    private var head: Node<T>?
    
    /// 맨뒤에다가 element를 추가하는 경우
    /// 고려해야할 경우의 수
    /// 1. LinkedList에 아무것도 없는경우
    func append(_ element: T?) {
        /// LinkedList에 아무것도 없는 경우엔 header자체가 없는경우고 이러한 경우엔 header에다가 Node를 넣어주기만 하면된다
        /// 그리고 이런 경우엔 header에 Node만 넣고 함수를 종료시켜야하기때문에 return을 해준다
        if head == nil {
            head = Node(value: element)
            return
        }
        
        /// 현재Node부터 시작해야하기때문에 Head부터 currentNode로 설정해준다
        var currentNode = head
        
        /// currentNode의 다음 Node가 nil이 되는순간 == 마지막 Node에 도달한 순간
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        /// 마지막 노드와 append된 element를 value로 가지는 Node를 연결시켜준다
        currentNode?.next = Node(value: element)
    }
    
    /// index를 통해 element를 추가하는 경우
    /// 고려해야할 경우의 수
    /// 1. LinkedList에 아무것도 없는 경우
    /// 2. (알게된사실)0부터시작하는 range이기때문에 index가 0이면 `0..<-1`이 되어버려서 문제가 발생함 0일때는 따로 분기처리해줘야함
    func insert(element: T?, at index: Int) {
        if head == nil {
            head = Node(value: element)
            return
        }
        
        /// index가 0인곳에 Node를 넣고싶다면 해당 Node의 next를 현재 header와 연결시켜주고 header를 바꿔주면 된다
        if index == 0 {
            var newNode = Node(value: element)
            newNode.next = head
            head = newNode
            return
        }
        
        var newNode = Node(value: element)
        var currentNode = head
        
        for _ in 0..<(index - 1) {
            currentNode = currentNode?.next
        }
        
        /// 현재노드 == 넣고싶은 index의 바로 앞 노드
        /// 넣을 노드의 다음 노드 = 현재노드의 원래 다음 노드
        /// 현재노드의 다음 노드 = 새로운노드
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    /// 지우는 경우도 index를 가지고 insert하는 경우와 고려해야할 경우의 수는 동일하다
    func delete(at index: Int) {
        if head == nil { return }
        
        if index == 0 {
            head = head?.next
            return
        }
        
        var currentNode = head
        for _ in 0..<(index - 1) {
            currentNode = currentNode?.next
        }
        /// 삭제하는 경우는 현재노드(==지우고싶은 index의 바로 앞 노드)의 다음 노드를 다음다음노드와 연결시켜주면
        /// 다음노드는(삭제할index의 노드) arc에 의해 자동으로 메모리에서 해제된다
        currentNode?.next = currentNode?.next?.next
    }
}

var testSinglyLinkedList = SinglyLinkedList<Int>()
testSinglyLinkedList.append(1)                       // [1]
testSinglyLinkedList.append(2)                       // [1,2]
testSinglyLinkedList.append(3)                       // [1,2,3]
testSinglyLinkedList.delete(at: 1)                   // [1,3]
testSinglyLinkedList.insert(element: 8, at: 1)       // [1,8,3]
testSinglyLinkedList.append(6)                       // [1,8,3,6]
