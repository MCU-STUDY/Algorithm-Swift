import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    // 09:00 ~, 총 n회 t분 간격으로 역에 도착. 하나의 셔틀에 최대 m명
    // 도착시각 중 제일 늦은 시각을 구하여라 (max)
    // 같은 시각에 도착한 크루 중 대기열에서 제일 뒤에 선다
    // 모든 크루는 잠을 자야 하므로 23:59에 집에 돌아간다. 따라서 어떤 크루도 다음날 셔틀을 타는 일은 없다.
    struct Time: Hashable {
        let hour: Int
        let minute: Int
        
        init(_ hour: Int, _ minute: Int) {
            self.hour = hour
            self.minute = minute
        }
    }
    
    var arrive = Set<Time>()
    arrive.insert(Time(9, 0))
    
    var hour = 9
    var minute = 0
    var shuttleCnt = n - 1
    while shuttleCnt != 0 {

        if minute + t >= 60 {
            hour += (minute + t) / 60
            if hour > 23 {
                break
            }
        }
        minute += t % 60
        
        let time = Time(hour, minute)
        arrive.insert(time)
        shuttleCnt -= 1
    }
    // print(arrive)
    
    let arriveArr: [Time] = Array(arrive).sorted { a, b in
        if a.hour == b.hour {
            return a.minute < b.minute
        }
        return a.hour < b.hour
    }
    
    var timetable: [Time] = timetable.map { time in
        let str = time.components(separatedBy: ":")
                                   let hour = Int(str[0])!
                                   let minute = Int(str[1])!
                                   let time = Time(hour, minute)
                                   return time
    }.sorted { a, b in
        if a.hour == b.hour {
            return a.minute < b.minute
        }
        return a.hour < b.hour
    }
    
    var flag = false // 갈 수 있냐 없냐
    var totalM = n * m
    var latestTime: Time = Time(0, 0)

    var canGoLast = false
    
    for arrive in arriveArr {
        var m = m
        // print("이 시간에 갈 수 있나요 ? ", arrive)
        
        for time in timetable {
            
            
            
            if let idx = timetable.firstIndex(of: time) {
                if time.hour < arrive.hour {
                    if time.hour > latestTime.hour {
                        latestTime = time
                    } else if time.hour == latestTime.hour {
                        if time.minute > latestTime.minute {
                            latestTime = time
                        }
                    }
                    
                    // print(time)
                    totalM -= 1
                    m -= 1
                    timetable.remove(at: idx)
                    if m == 0 {
                        break
                    }
                } else if time.hour == arrive.hour {
                    if time.minute <= arrive.minute {
                        if time.hour > latestTime.hour {
                            latestTime = time
                        } else if time.hour == latestTime.hour {
                            if time.minute > latestTime.minute {
                                latestTime = time
                            }
                        }
                        // print(time)
                        totalM -= 1
                        m -= 1
                        timetable.remove(at: idx)
                        if m == 0 {
                            break
                        }
                    }
                }
            }
        }
        
        if m > 0 {
            canGoLast = true
        } else {
            canGoLast = false
        }
    }
    
    // print("제일 마지막에 간 사람 시간 =. ", latestTime)
    
    var answerTime = Time(0, 0)
    if canGoLast {
        // print("마지막에 갈수 있으니까 마지막 시간에 걍 가면 됨")
        answerTime = arriveArr[arriveArr.count - 1]
    } else {
        // print("마지막에 못가니까 얌체행동")
        var hour = latestTime.hour
        var minute = latestTime.minute
        minute -= 1
        if minute < 0 {
            hour -= 1
            minute = 59
        }
        answerTime = Time(hour, minute)
    }
    
    // print("정답 : ", answerTime)
    
    let hourStr = String(format: "%02d", answerTime.hour)
    let minuteStr = String(format: "%02d", answerTime.minute)
    let answer = hourStr + ":" + minuteStr
    
    // print(answer)
    
    
    return answer
}


func solution2(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let initTime = 9*60 // 09:00 을 minute으로 표현.
    let sortedCrewTime = timetable.map { Int($0.prefix(2))! * 60 + Int($0.suffix(2))! }.sorted() // 분으로 표현한 후에, 오름차순 정렬
    
    var crewIndex = 0
    for i in 0..<n {
        var cnt = 0
        while crewIndex < sortedCrewTime.count, sortedCrewTime[crewIndex] <= initTime + (i * t) {
            cnt += 1
            crewIndex += 1
            if cnt == m {
                guard i != n-1 else {
                    return String(format: "%02d:%02d", (sortedCrewTime[crewIndex-1]-1)/60, (sortedCrewTime[crewIndex-1]-1)%60)
                }
                break
            }
        }
    }
    let lastTime = initTime + (n-1) * t
    return String(format: "%02d:%02d", lastTime/60, lastTime%60)
}

let a = solution2(1, 1, 5, ["00:01", "00:01", "00:01", "00:01", "00:01"]    )
print(a)
let b = solution2(2, 10, 2, ["09:10", "09:09", "08:00"]    )
print(b)

