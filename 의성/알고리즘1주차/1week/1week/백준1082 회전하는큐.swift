//
//  백준1082 회전하는큐.swift
//  1week
//
//  Created by uiskim on 2023/08/09.
//

import Foundation

class CircularLinkedListNode {
    var next: CircularLinkedListNode?
    var prev: CircularLinkedListNode?
    var value: Int?
    
    init(next: CircularLinkedListNode? = nil, prev: CircularLinkedListNode? = nil, value: Int?) {
        self.next = next
        self.prev = prev
        self.value = value
    }
}

struct CircularLinkedList {
    var head: CircularLinkedListNode?
    var tail: CircularLinkedListNode?
    
    var result: Int = 0
    
    /// circular linked list에서 고려해야할 부분
    /// 1. node가 하나도 없을때
    mutating func append(_ value: Int) {
        /// node가 하나도 없으면 head와 tail에 첫 node를 넣어준다
        if head == nil {
            let newNode = CircularLinkedListNode(value: value)
            head = newNode
            tail = newNode
            return
        }
        
        /// node가 하나라도 있으면 tail의 다음 노드에 새로운 node를 연결시켜주고
        let newNode = CircularLinkedListNode(value: value)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        
        tail?.next = head
        head?.prev = tail
    }
    
    /// circularLinkedList에서 Head를 제거하면 Head의 다음노드가 Head가 되어야한다
    /// 다음 Head와 기존 Tail을 연결시켜주면 기존 Head는 자동으로 할당해제된다
    mutating func removeHead() {
        let nextHead = head?.next
        nextHead?.prev = tail
        tail?.next = nextHead
        head = nextHead
    }
    
    /// 가운데를 기준으로 내가 찾는 요소의 index가 왼쪽에 있는지 오른쪽에 있는지를 찾기 위한 메서드
    func lastNodeIndex() -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != tail?.value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    /// Q : 왜 왼쪽에서부터 index를 찾나요?? tail이 있으니까 오른쪽에서 찾는게 효율적일때가 있지 않나요?
    /// A : 어차피 왼쪽에서 시작했을때의 index와 오른쪽에서 시작했을 때의 index를 비교해야해서 굳이 두번하지말고 둘중하나만하자라는 생각
    func findIndex(from value: Int) -> Int {
        var count = 0
        var currentNode = head
        while currentNode?.value != value {
            currentNode = currentNode?.next
            count += 1
        }
        return count
    }
    
    /// Circular Linked List에서 문제에서 처럼 왼쪽과 오른쪽으로 움직이기 위해서는 head와 tail을 바꿔주기만 하면된다
    /// turnLeft의 경우엔 head가 head의 다음 node가 되고 tail이 tail의 다음 node(기존의 head)가 된다
    /// turnRight의 경우엔 head가 기존의 tail(기존 head의 prev)가 되고 tail의 경우엔 기존 tail의 prev가 된다
    mutating func turnLeft() {
        head = head?.next
        tail = tail?.next
        result += 1
    }
    
    mutating func turnRight() {
        head = head?.prev
        tail = tail?.prev
        result += 1
    }
    
}

func solution(size: Int, values: [Int]) {
    var testCircularLinkedList = CircularLinkedList()
    for i in 1...size {
        testCircularLinkedList.append(i)
    }
    
    for value in values {
        let lastNodeIndex = testCircularLinkedList.lastNodeIndex()
        let indexCenter = lastNodeIndex / 2
        
        /// 문제에서 내가 뽑아내고 싶은 요소의 index를 반환
        let valueIndex = testCircularLinkedList.findIndex(from: value)
        
//        /// 내가 찾는 요소의 index가 0이라는건 그냥 removeHead()를 실행시키면된다는뜻이다
//        if valueIndex == 0 {
//            testCircularLinkedList.removeHead()
//            continue
//        }
        
        /// 만약에 내가 뽑고 싶은 요소의 index가 오른쪽(tail쪽)에 위치한다면 오른쪽으로 움직여아하고 움직이는 횟수는 (전체인덱스-요소인덱스+1)번이다
        /// 다 움직이고나면 맨앞에 head를 지워주고 다음 반복을 위해 continue를 걸어준다
        if indexCenter < valueIndex {
            let distance = lastNodeIndex - valueIndex + 1
            for _ in 0..<distance {
                testCircularLinkedList.turnRight()
            }
            testCircularLinkedList.removeHead()
            continue
        }
        
        /// 만약에 내가 뽑고 싶은 요소의 index가 왼쪽(head쪽)에 위치한다면 오른쪽으로 움직여야하고 움직이는 횟수는 (요소인덱스)번이다
        /// 다 움직이고나면 맨앞에 head를 지워주고 다음 반복을 위해 continue를 걸어준다
        if indexCenter >= valueIndex {
            let distance = valueIndex
            for _ in 0..<distance {
                testCircularLinkedList.turnLeft()
            }
            testCircularLinkedList.removeHead()
            continue
        }
        
    }
    print(testCircularLinkedList.result)
}

var input = readLine()!.split(separator: " ").map{ Int($0)! }
let size = input[0]
var inputValues = readLine()!.split(separator: " ").map{ Int($0)! }

solution(size: size, values: inputValues)
