//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*struct Time {
    let in24h: Bool = false   // 24時制 or 12時制
    var hour = 0, min = 0
}

var t1 = Time()   // 0:00 （12時制）
// var t2 = Time(in24h:true, hour:7, min:0)    // 失敗する
var t2 = Time(hour:7, min:0)    // 成功する。7:00 （12時制）*/

struct SimpleDate {
    var year, month, day: Int
    init() {
        year = 2095; month = 10; day = 31
    } // self.year = 2095 のように書くこともできる
}

var m = SimpleDate()  // 生成とともにカスタムイニシャライザが動作する
print(m.year)         // 2095が出力される

struct Time {
    let in24h: Bool                 // 初期値はない
    var hour = 0, min = 0
    init(hour:Int, min:Int) {       // hour, min は外部引数名になる
        in24h = false               // 定数を初期設定できる
        self.hour = hour            // self.プロパティで引数名と区別
        self.min = min
    }
    init(hourIn24 h:Int) {
        in24h = true                // 定数を初期設定できる
        hour = h
    }
    init(_ hour:Int) {              // 外部引数名を使わない
        self.init(hourIn24: hour)   // 上のイニシャライザを使う
        // in24h = false  これはエラーになる
    }
}

var a = Time(hour:10, min:30)      // 12時制 10:30
var b = Time(hourIn24: 15)         // 24時制 15:00
var c = Time(12)                   // 24時制 12:00
// var d = Time()                             // エラー
// var e = Time(in24h:true, hour:13, min:30)  // エラー

struct DateWithTime {
    var date = SimpleDate()
    var time = Time(hour:0, min:15)
}

var u = DateWithTime()
print(u.date.year)    // 2095が出力される
print(u.time.min)     // 15が出力される

struct SimpleTime {
    var hour, min: Int
    init(_ hour:Int, _ min:Int) {
        self.hour = hour
        self.min = min
    }
}

struct PointOfTime {
    struct Date { var year, month, day: Int }    // ネスト型
    typealias Time = SimpleTime                  // 別名を定義
    var date: Date
    var time: Time
    init(year:Int, month:Int, day:Int, hour:Int, min:Int) {
        date = Date(year:year, month:month, day:day)
        time = Time(hour, min)
    }
}

// 2024年11月7日14時55分
var f = PointOfTime(year:2024, month:11, day:7, hour:14, min:55)
print(f.date.month)
print(f.time.min)

var g = PointOfTime.Date(year:2022, month:11, day:6) // ネスト型
print(g.year)
f.time = PointOfTime.Time(10, 21)   // インスタンスを代入
print(f.time.hour)

// Time型もネスト型として定義した例
/*struct PointOfTime {
    struct Date { var year, month, day: Int }    // ネスト型
    struct Time {
        var hour, min: Int
        init(_ hour:Int, _ min:Int) {
            self.hour = hour
            self.min = min
        }
    }
    var date: Date
    var time: Time
    init(year:Int, month:Int, day:Int, hour:Int, min:Int) {
        date = Date(year:year, month:month, day:day)
        time = Time(hour, min)
    }
}

// 2024年11月7日14時55分
var a = PointOfTime(year:2024, month:11, day:7, hour:14, min:55)
print(a.date.month)
print(a.time.min)

var b = PointOfTime.Date(year:2022, month:11, day:6) // ネスト型
print(b.year)

var c = PointOfTime.Time(10, 21)       // ネスト型
print(c.hour)*/


