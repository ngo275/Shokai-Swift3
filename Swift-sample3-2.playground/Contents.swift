//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Time {              // 時間と分のみを持つTime型
    let hour, min : Int    // 定数で時刻を保持。全項目イニシャライザを使う
    func advanced(min:Int) -> Time {       // 分を加算する
        var m = self.min + min
        var h = self.hour
        if m >= 60 {
            h = (h + m / 60) % 24
            m %= 60
        }
        return Time(hour:h, min:m)    // 新しいインスタンスを返す
    }
    func toString() -> String {       // 時刻を文字列として返す
        let h = hour < 10 ? " \(hour)":"\(hour)"
        let m = min < 10 ? "0\(min)":"\(min)"
        return h + ":" + m
    }
}

let t1 = Time(hour:22, min:45)      // 全項目イニシャライザ
let t2 = t1.advanced(min:140)
print(t1.toString())        // "22:45" を出力
print(t2.toString())        // " 1:05" を出力


struct Clock {
    var hour = 0, min = 0
    mutating func advance(min:Int) {
        let m = self.min + min
        if m >= 60 {
            self.min = m % 60
            let t = self.hour + m / 60
            self.hour = t % 24
        }else{
            self.min = m
        }
    }
    mutating func inc() {
        self.advance(min:1);
    }
    func toString() -> String {
        let h = hour < 10 ? " \(hour)":"\(hour)"
        let m = min < 10 ? "0\(min)":"\(min)"
        return h + ":" + m
    }
}

var tic = Clock(hour:19, min:40)
print(tic.toString())
tic.advance(min:19)
print(tic.toString())
tic.inc()
print(tic.toString())


struct SimpleDate {
    var year, month, day: Int
    static func isLeap(_ y: Int) -> Bool { // タイプメソッド
        return (y % 4 == 0) && (y % 100 != 0 || y % 400 == 0)
    }
    static func daysOfMonth(_ m:Int, year:Int) -> Int {
        switch m {
        case 2: return isLeap(year) ? 29 : 28 // self.isLeapでも同じ
        case 4, 6, 9, 11: return 30
        default: return 31
        }
    }
}

print(SimpleDate.isLeap(2000))
print(SimpleDate.isLeap(2002))
print(SimpleDate.isLeap(2008))

print(SimpleDate.daysOfMonth(2, year:2000))
print(SimpleDate.daysOfMonth(2, year:1900))


// 動作しません。
/*struct DateWithString {
    let string: String          // 文字列も保持
    let year, month, day: Int
    init(_ y:Int, _ m:Int, _ d:Int) {
        year = y; month = m; day = d
        string = "\(y)-" + twoDigits(m) + "-" + twoDigits(d)
    }
    func twoDigits(_ n:Int) -> String {   // 数値を２桁の文字列にする
        let i = n % 100
        return i < 10 ? "0\(i)" : "\(i)"
    }
}

let an1 = DateWithString(2015, 6, 22)
print(an1.string)*/


// 動作する
/*struct DateWithString {
    let string: String          // 文字列も保持
    let year, month, day: Int
    init(_ y:Int, _ m:Int, _ d:Int) {
        year = y; month = m; day = d
        string = "\(y)-" + DateWithString.twoDigits(m)
            + "-" + DateWithString.twoDigits(d)
    }
    static func twoDigits(_ n:Int) -> String {   // タイプメソッド
        let i = n % 100
        return i < 10 ? "0\(i)" : "\(i)"
    }
}

let an1 = DateWithString(2015, 6, 22)
print(an1.string)*/


struct DateWithString {
    let string: String
    let year, month, day: Int
    static let mons = ["Jan", "Feb", "Mar", "Apr", "May",
                       "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    static var longFormat = false
    init(_ y:Int, _ m:Int, _ d:Int) {
        year = y; month = m; day = d
        string = DateWithString.longFormat
            ? DateWithString.longString(y, m, d)
            : DateWithString.shortString(y, m, d)
    }
    static func twoDigits(_ n:Int) -> String {
        let i = n % 100
        return i < 10 ? "0\(i)" : "\(i)"
    }
    static func longString(_ y:Int, _ m:Int, _ d:Int) -> String {
        return "\(y)-" + twoDigits(m) + "-" + twoDigits(d)
    }
    static func shortString(_ y:Int, _ m:Int, _ d:Int) -> String {
        return twoDigits(d) + mons[m-1] + twoDigits(y)
    }
}

let a = DateWithString(2025, 1, 20)
print(a.string)
DateWithString.longFormat = true
let b = DateWithString(2025, 1, 21)
print(b.string)


var serialNumber = 2127

struct LCD {
    struct Size { var width, height : Int }   // ネスト型
    static var stdHeight = 1080
    static var stdWidth = 1920
    static var stdSize = Size(width: stdWidth, height:stdHeight)
    // タイププロパティの設定
    static func sn() -> Int { serialNumber += 1; return serialNumber }
    let size: Size
    let serial = "CZ:" + String(LCD.sn())
    // 引数に既定値があるイニシャライザ
    init(size: Size = LCD.stdSize) { self.size = size }
    func show() {
        print(serial, "(\(size.width)x\(size.height))")
    }
}

let display1 = LCD(size: LCD.Size(width:800, height:600))
display1.show()
LCD.stdHeight = 1200
let display2 = LCD()
display2.show()
LCD.stdWidth = 2560
let display3 = LCD()
display3.show()


struct Ounce {
    var mL:Double = 0.0            // 値はミリリットルで保持。初期値は必須。
    static let ounceUS = 29.5735   // 1オンス(米国)
    init(ounce:Double) {
        self.ounce = ounce         // 計算型プロパティを使って初期化
    }
    var ounce: Double { // 計算型プロパティ
        get { return mL / Ounce.ounceUS }
        set { mL = newValue * Ounce.ounceUS }
    }
}

var aa = Ounce(ounce:2.0)
print(aa.mL)
aa.ounce += 8.0
print(aa.ounce)


struct ValueWithCounter {
    private let _value: Double  // privateは可視性の設定
    var count = 0
    init(_ v: Double) { _value = v }
    var value: Double { mutating get {
        count += 1
        return _value
        }}
}

struct ValueInLine {
    private static var _pool: [Double] = []  // 空の配列
    let index: Int
    init(_ v: Double) {
        index = ValueInLine._pool.count
        ValueInLine._pool.append(v)   // 配列に値を追加
    }
    var value: Double {
        get { return ValueInLine._pool[index] }
        nonmutating set { ValueInLine._pool[index] = newValue }
    }
    static func clear() {
        for i in 0..<_pool.count { _pool[i] = 0.0 }
    }
}

var w = ValueWithCounter(0.125)      // letではvalueの値が参照できない
for _ in 0..<5 { print( w.value ) }
print( w.count )

let z = ValueInLine(109.7)
print(z.value)
z.value = 0.0
print(z.value)


/*import Cocoa // MacでAppKitフレームワークを使う
// Linuxでは動作しません。

var landscape : Bool { // 定数sizeにディスプレイの大きさを得る
    let size = NSScreen.main()!.frame.size
    return size.width > size.height
}

print( landscape ? "Landscape" : "Portrait" )*/


struct Stock {
    let buyingPrice: Int
    var high = false
    var count = 0
    init(price:Int) {
        buyingPrice = price
        self.price = price
    }
    var price:Int {
        willSet {
            count += 1
            high = newValue > buyingPrice
        }
        didSet {
            print("\(oldValue) => \(price)")
        }
    }
}

var st = Stock(price:400)
st.price = 410
st.price = 380
st.price = 430
print("\(st.count), \(st.high)")
st.price -= 32
print("\(st.count), \(st.high)")

func inc(_ a: inout Int) { a += 10; a -= 8; a += 3 }
inc(&st.price)
print("\(st.count), \(st.high)")


struct FoodMenu {
    let menu = ["ざる", "かけ", "たぬき"]        // 変更できない文字列の配列
    var submenu = ["とろろ", "天ぷら", "南ばん"] // 変更可能な文字列の配列
    let count = 6
    subscript (i:Int) -> String {  // 添字付けの定義
        get {
            return i < 3 ? menu[i] : submenu[i - 3]
        }
        set {
            if i > 2 && i < 6 {
                submenu[i - 3] = newValue
            }
        }
    }
}

var menu = FoodMenu()
for i in 0 ..< menu.count {
    print(menu[i], terminator:" ");   // 改行しない
}
print("")

func show(_ menu: FoodMenu) {
    for i in 0 ..< menu.count {
        print(menu[i], terminator:" ");   // 改行しない
    }
    print("")
}

menu[0] = "もり"
menu[5] = "くるみ"
show(menu)

func newitem(_ item: inout String) {
    item = "きつね"
}
newitem(&menu[5])
show(menu)


struct Time2 : CustomStringConvertible {
    let hour, min : Int    // 定数で時刻を保持。全項目イニシャライザを使う
    func add(min:Int) -> Time2 {       // 分を加算する
        var m = self.min + min
        var h = self.hour
        if m >= 60 {
            h = (h + m / 60) % 24
            m %= 60
        }
        return Time2(hour:h, min:m)    // 新しいインスタンスを返す
    }
    var description : String {
        let h = hour < 10 ? " \(hour)":"\(hour)"
        let m = min < 10 ? "0\(min)":"\(min)"
        return h + ":" + m
    }
}

let tm = Time2(hour:19, min:40)
print(tm)
let tm2 = tm.add(min:20)
print("時刻は\(tm2)です。")
