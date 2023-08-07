import Foundation

/// Queue: 선입후출(First In First Out)의 FIFO(피포라고 하는거같음) 자료구조
/// 기본적으로 Swift에선은 Queue을 Array로 구현할 수 있음
///
/// Queue의 필수연산자
/// 1. enqueue : 말그대로 queue에 element를 넣어주는 연산(맨위로 올라감)
/// 2. dequeue : 말그대로 queue에 element를 제거해주는 연산(맨아래에있는걸 제거해줌)
///
/// Queue의 비필수연산자
/// 1. peek : queue의 맨 아래에있는 element를 제거하지않고 출력해주는 연산
/// 2. isEmpty : queue이 비어있는지를 bool type으로 반환해주는 연산
/// 3. count : queue의 element갯수를 반환해주는 연산

/// Queue도 Stack과 마찬가지로 value type인 구조체로 구현, array에는 한가지 타입만 들어갈수있고 모든타입이 들어갈수있기에 generic으로 구현

struct Queue<T> {
    /// 외부에서 접근하면 안되는 core한 data이기때문에 private으로 선언
    private var queue: [T] = []
    
    /// Queue의 필수연산자
    mutating func enqueue(_ element: T) {
        /// 기본적으로 append의 경우에 기존 array의 데이터갯수에 상관없이 연산 1번에 끝나기때문에 시간복잡도는 O(1)이다
        self.queue.append(element)
    }
    
    mutating func dequeue() -> T? {
        /// 문제는 dequeu연산인데 removeFirst라는 메서드는 애플공식문서에서도 O(n)이라는 시간복잡도를가지고 있다
        /// Complexity : O(n), where n is the length of the collection.
        /// 왜그럴까를 생각해보면 removeFirst를하게되면 모든 array element들이 index를 초기화 시키기 위해 n개의 요소를 옮기는 연산을 해야한다
        /// 즉 연산 한번에 n번의 연산을 해야 되는 결과가 발생한다
        isEmpty ? nil : self.queue.removeFirst()
    }
    
    /// Queue의 비필수연산자
    var isEmpty: Bool { queue.isEmpty }
    var count: Int { queue.count }
    var peak: T? { queue.first }
}

var testArray = [1,1,2,2,4,5,6,7,8,9,9]
/// 3번째 요소를 삭제하고 리턴
/// mutating func
//testArray.remove(at: 3)  return: 2  result: [1,1,2,4,5,6,7,8,9,9]

/// 앞에서부터 7개 삭제
/// mutating func
//testArray.removeFirst(7)  return: X  restul: [7,8,9,9]

/// 앞에서부터 7개삭제하고 남은 array 리턴(실제삭제X)
/// 애초에 Array는 struct인데 mutating함수가 아님
//testArray.dropFirst(7)  return: [7,8,9,9]  restul: [1,1,2,2,4,5,6,7,8,9,9]
