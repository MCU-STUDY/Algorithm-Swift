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

// 1.Swift의 기본메서드를 이용한 구현
// 🔥dequeue의 경우 O(n)이기때문에 시간초과 문제가 발생할 가능성이 높음
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

// 2.Head를 사용한 개선된 Queue
// 🔥dequeue시 조건부긴하지만 removeFirst를 여전히 사용하는 불편함이 존재함, 그리고 removeFirst의 조건을 사용자가 예상해서 값을 하드코딩해야하는 부분이 불편함
struct QueueUsingHead<T> {
    private var queue: [T?] = []
    private var head: Int = 0

    mutating func dequeue() -> T? {
        /// 비어있는거기준으로 하려했는데 애초에 삭제를하는게아니라 nil로 바꾸는거라 이 기준은 맞지 않음
        ///
        /// 구글링하면 나오는 guard문(왜일까?)
        /// guard head < queue.count, let element = queue[head] else { return nil }
        ///
        /// 1. guard head < queue.count가 조건인 이유
        /// head와 count가 같거나 head가 count보다 크면 모든 요소가 nil로 바뀐상황이기때문에 nil을 반환해줘야함
        /// 그러니 그 여집합인 count가 head보다 크면 guard문으로 return nil을 해주면 된다
        ///
        /// 2. queue의 head번째 요소가 추후에 계속 변화가 일어나기때문에(return되기전에 nil로 바뀜) 여기서 변수에 저장
        /// 근데 이건 굳이 안넣어줘도 상관없을거같음
        guard head < queue.count else { return nil }
        let element = queue[head]
        queue[head] = nil
        head += 1

        if queue.count > 50 {
            queue.removeFirst(head)
            head = 0
        }

        return element
    }

    mutating func enqueue(_ element: T) {
        self.queue.append(element)
    }

    /// Queue의 비필수연산자
    var isEmpty: Bool { queue.isEmpty }
    var count: Int { queue.count }
    var peak: T? { queue[head] }
}

// 두개의 Stack을 이용하는방법(.reversed()가 O(1)인걸이용하는 방법)
// ✅내기준으로 가장 깔끔한 방법이라고 생각함
struct QueueWithDoubleStack<T> {
    private var stackForDequeue: [T] = []
    private var stackForEnqueue: [T] = []
    
    mutating func enqueue(_ element: T) {
        self.stackForEnqueue.append(element)
    }
    
    mutating func dequeue() -> T? {
        /// 만약 dequeue stack이 비어있고 enqueue stack이 [1, 2, 3]이라면
        /// dequeue는 dequeue stack에서 할수있도록 코드를 짜놓은 상황이다
        /// [1,2,3]을 reversed하면 [3,2,1]이 되고 1이나가야하므로 reversed된 배열에서 popLast로 꺼내면된다
        /// 하지만 이런경우엔 enqueue에있는 요소들을 dequeue stack으로 보냈으므로 배열을 비워줘야한다
        if stackForDequeue.isEmpty {
            stackForDequeue = stackForEnqueue.reversed()
            stackForEnqueue.removeAll()
        }
        return stackForDequeue.popLast()
    }
    
    /// Queue의 비필수연산자
    var isEmpty: Bool { stackForDequeue.isEmpty && stackForEnqueue.isEmpty }
    var count: Int { stackForDequeue.count + stackForEnqueue.count }
    var peak: T? { stackForEnqueue.isEmpty ? stackForDequeue.first : stackForEnqueue.last }
}
