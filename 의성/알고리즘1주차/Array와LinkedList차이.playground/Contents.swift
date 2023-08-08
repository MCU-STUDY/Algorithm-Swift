/// Array와 LinkedList의 차이

/// 1. 메모리 할당
/// Array(구조체긴하지만 heap영역에 데이터가 저장되고 stack에 주소가 저장되는 reference type처럼 동작함, collection type의 경우)
/// Array의 경우 배열선언하는 순간 컴파일타임에 크기가정해지고 특정크기 이상이되면(append나 insert를 통해) 메모리 영역을 두배씩 늘리는 방식으로 메모리를 할당하는 방식을 채용한다(in Swift) 이를 amortized constant-time performance라고 한다
/// ⭐️Array는 Static Memory Allocation이라는 '정적메모리할당'방식으로 메모리에 할당된다

/// LinkedList
/// LinkedList의 경우 node가 선언되고 연결되는 순간순간 런타임에 메모리가 할당되는 방식이다
/// ⭐️LinkedList는 Dynamic Memory Allocation이라는 '동적메모리할당'방식으로 메모리에 할당된다

/// 2. 요소접근
/// Array
/// Array의 경우 Random Access를 지원한다
/// Random Access란 index를 가지고 특정 요소에 접근하는 경우 index를 훑으면서 가는것이 아닌 연산한번에 결과를 얻을 수있는 방식이다
/// Random Access란 : adress에 접근하는 시간이 동일하다는 특징
/// ⭐️요소접근의 경우 Array의 시간복잡도 : O(1)
///
/// LinkedList
/// LinkedList의 경우 Sequential Access을 지원한다
/// Sequential Access란 index를 가지고 특정 요소에 접근하는 경우 index를 훑으면서 가야하기때문에 한번의 결과를 얻기위해 n번의 연산이 필요하다
/// ⭐️요소접근의 경우 LinkedList의 시간복잡도 : O(n)

/// 3. 삽입 및 삭제
/// 삽입과 삭제의 순간의 관점에서 바라봤을때(접근하는 과정은 삽입삭제의 과정에 포함시키지 않음)
/// Array
/// Array의 경우 삭제 혹은 삽입 후 뒤의 요소들을 땡기거나 한칸식 미루는 과정이 n번 필요하다
/// ⭐️삽입과 삭제의 경우 Array의 시간 복잡도 : O(n)

/// LinkedList
/// LinkedList의 경우 삭제 혹은 삽입 후 연결상태만 한번 바꿔주면 되기때문에 연산한번에 과정이 끝난다
/// ⭐️삽입과 삭제의 경우 LinkedList의 시간 복잡도 : O(n)

/// 결론
/// 데이터 접근이 주 업무일 경우 → Array
/// 데이터 수정이 주 업무일 경우 → Linked List

/// 궁금한점
/// Array에 데이터 추가 및 삭제할 때는 O(N)이 소요되지만 Linked List는 O(1)로 가능하다.
/// 개인적으로 궁금한부분 Array의 경우 데이터접근은 O(1) 하지만 삭제는 O(n), LinkedList의 경우 데이터접근은 O(n) 삭제는 O(1)
/// 그럼 조삼모사아니야...?

