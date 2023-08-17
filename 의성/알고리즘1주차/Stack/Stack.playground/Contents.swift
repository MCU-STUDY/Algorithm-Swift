import Foundation

/// Stack: 후입선출(Last In First Out)의 LIFO(리포라고 하는거같음) 자료구조
/// 기본적으로 Swift에선은 Stack을 Array로 구현할 수 있음
///
/// Stack의 필수연산자
/// 1. push : 말그대로 stack에 element를 넣어주는 연산(맨위로 올라감)
/// 2. pop : 말그대로 stack에 element를 제거해주는 연산(맨위에있는걸 제거해줌)
///
/// Stack의 비필수연산자
/// 1. peak : stack의 맨 위에있는 element를 제거하지않고 출력해주는 연산
/// 2. isEmpty : stack이 비어있는지를 bool type으로 반환해주는 연산
/// 3. count : stack의 element갯수를 반환해주는 연산

/// 1.굳이 class로 해가면서 heap영역을 낭비할 필요가 없음 -> 상속받을일이 전혀없음
/// 2. stack에는 int가 들어갈수도 string이 들어갈수도있기때문에(하지만 들어가는 타입은 한가지로 통일, 생성시점에 정해짐) generic을 사용
struct Stack<T> {
    /// 기본 stack구현인데 외부에서 접근하면안되기때문에 private으로 선언해줌
    private var stack: [T] = []
    
    /// struct는 기본적으로 initalize를 제공해줌 아래 코드는 굳이 필요없음
    // init() {}
    
    /// 1.필수연산자 push 구현
    /// 우선 처음든 생각은 무조건 element가 들어가는게 가장마지막에 들어가는거니까 list의 append를 쓰면되지않을까...?
    /// Swift의 Value Type 은 기본적으로 내부에서 인스턴스 메서드를 통해 내부 값을 수정할 수 없는데 mutating키워드를 사용하면 가능
    /// ⭐️mutating키워드는 메서드에 붙는 키워드임 계산속성(함수처럼 동작하지만 함수는아님)에서는 사용 불가⭐️
    /// 🔥mutating키워드 공부해서 정리하기(COW와 함께)🔥
    mutating func push(_ element: T) {
        self.stack.append(element)
    }
    
    /// 2.필수연산자 pop 구현
    /// mutating키워드 필요, 마지막걸 빼는 메서드 필요
    mutating func pop() -> T? {
        /// "." 찍고 찾아보니 두가지 메서드가 존재하는데 popLast는 element?를 반환해주고 removeLast는 element를 반환해준다
        /// 즉, removeLast를 사용하게되면 혹여나 그 순간 list가 empty인 상태라면 nil을 반환해준다는 분기처리가 더 필요함(굳이?)
        /// 두함수모두 설명란에 "Removes and returns the last element of the collection."라고 적혀있는걸로보아 제거후 제거한거 출력해줌
        // self.stack.removeLast()
        self.stack.popLast()
    }
    
    /// 3.비필수연산자 peak
    /// 굳이 함수로만들필요없겠다 싶었음
    var peak: T? {
        self.stack.last
    }
    
    /// 4.비필수연산자 isEmpty
    var isEmpty: Bool {
        self.stack.isEmpty
    }
    
    /// 5.비필수연산자 count
    var count: Int {
        self.stack.count
    }
}

var exampleStack = Stack<Int>()

exampleStack.push(1) // [1]
exampleStack.push(3) // [1,3]
exampleStack.peak    // 3, [1,3]
exampleStack.pop()   // 3, [1]
exampleStack.isEmpty // false
exampleStack.count   // 1

print(exampleStack)  // [1]

