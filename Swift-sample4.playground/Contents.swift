//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*#!/usr/bin/swift
var num = 0
while let line = readLine() {   // while-let文
    num += 1
    print("\(num)  " + line)
}*/

func nickname(_ name:String?, age:Int) -> String {
    let s = name ?? "名無し"
    return "浪速の" + s + "（\(age)歳）"
}

print( nickname("シンデレラ", age:35) )
print( nickname(nil, age:20) )

var n:String? = "海賊王"
print( nickname(n, age:25) )
n = nil
print( nickname(n, age:25) )

struct Time {
    let in24h: Bool
    var hour = 0, min = 0
    init?(_ h:Int, _ m:Int, in24h:Bool = false) {
        let maxh = in24h ? 23 : 11                 // hourの最大値
        if h < 0 || h > maxh || m < 0 || m > 59 {
            return nil                             // 初期化に失敗
        }
        self.in24h = in24h
        hour = h
        min = m    // 普通に初期化できた時は returnは使わない
    }
    init(time:Time, in24h:Bool) {  // 「失敗のない」初期化
        var h = time.hour
        if !in24h && time.hour > 11 {
            h -= 12
        }
        self.in24h = in24h
        hour = h
        min = time.min
    }
}

extension Time : CustomStringConvertible { // 拡張（11章）を参照
    var description: String {
        let hh = hour < 10 ? " \(hour)" : "\(hour)"
        let mm = min < 10 ? "0\(min)" : "\(min)"
        let mode = in24h ? " (24)" : " (12)"
        return hh + ":" + mm + mode
    }
}

if let w = Time(22, 10, in24h:true) {  // オプショナル束縛構文
    print("\(w.hour):\(w.min)")        // 22:10 と表示
}

// var u:Time = Time(23, 40)!          // 既定値は12時制なので、エラー発生
// print(t!)

var t:Time? = Time(20, 0, in24h:true)  // オプショナル型の変数t
print(t!)
var u = Time(time:t!, in24h:false)     // 変数tには「!」が必要
print(u)

