# MovieTicket
MovieTicket問題をSwiftで
https://twitter.com/minodriven/status/1228896043435094016

# スクリーンショット
| 映画選択 | 座席を選択 | チケット種別を選択 | 購入内容の確認| 支払い完了 |
|--|--|--|--|--|
| ![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 12](https://user-images.githubusercontent.com/1230773/76683496-cd390a00-6647-11ea-9890-48f4d11642cf.png)|![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 15](https://user-images.githubusercontent.com/1230773/76683495-cca07380-6647-11ea-82e6-1b5532b3645e.png)|![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 24](https://user-images.githubusercontent.com/1230773/76683494-cc07dd00-6647-11ea-95bf-9f4771569cfa.png)|![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 27](https://user-images.githubusercontent.com/1230773/76683492-cad6b000-6647-11ea-8b40-1b3ffa253955.png)|![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 29](https://user-images.githubusercontent.com/1230773/76683489-c8745600-6647-11ea-8f4a-d83160d1d44b.png)| ![Simulator Screen Shot - iPhone 8 - 2020-03-14 at 22 58 29](https://user-images.githubusercontent.com/1230773/76683489-c8745600-6647-11ea-8f4a-d83160d1d44b.png)|
 

# チケット部分の実装

```Swift
enum TicketType {
    case normal(NormalTicket)
    case child(ChildTicket)
    case shoolStudent(SchoolStudentTicket)
    case universityStudent(UniversityStudentTicket)
    case senior(SeniorTicket)
    
    var label: String {
        return ticket.label
    }
    
    var ticket: Ticket {
        switch self {
        case .normal(let ticket): return ticket
        case .child(let ticket): return ticket
        case .shoolStudent(let ticket): return ticket
        case .universityStudent(let ticket): return ticket
        case .senior(let ticket): return ticket
        }
    }
    
    static func allCases(movie: Movie, sheet: Sheet, schedule: Schedule) -> [TicketType] {
        return [
        .normal(NormalTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .child(ChildTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .shoolStudent(SchoolStudentTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .universityStudent(UniversityStudentTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .senior(SeniorTicket(movie: movie, sheet: sheet, schedule: schedule))
        ]
    }
    
    func equlatTo(ticket: Ticket) -> Bool {
        switch self {
        case .child:
            return ticket is ChildTicket
        case .normal:
            return ticket is NormalTicket
        case .shoolStudent:
            return ticket is SchoolStudentTicket
        case .universityStudent:
            return ticket is UniversityStudentTicket
        case .senior:
            return ticket is SeniorTicket
        }
    }
}

protocol Ticket {
    var label: String { get }
    var movie: Movie { get }
    var charge: Charge { get }
    var sheet: Sheet { get }
    var schedule: Schedule { get }
}

struct TicketCollection {
    let tickets: [Ticket]
    
    var amount: Charge {
        let amount = tickets.map { $0.charge.value }.reduce(0,+)
        return Charge(value: amount)
    }
}

struct NormalTicket: Ticket {
    let label = "一般"
    let charge = Charge(value: 1900)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct ChildTicket: Ticket {
    let label = "幼児・小学生"
    let charge = Charge(value: 1000)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct SchoolStudentTicket: Ticket {
    let label = "中学生・高校生"
    let charge = Charge(value: 1200)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct UniversityStudentTicket: Ticket {
    let label = "大学生・専門学校生"
    let charge = Charge(value: 1500)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct SeniorTicket: Ticket {
    let label = "シニア"
    let charge = Charge(value: 1200)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}
```

