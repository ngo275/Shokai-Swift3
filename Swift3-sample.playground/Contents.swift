//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let val = 10032
var i = 1, mask = 2
while mask <= val {
    mask <<= 1       // maskを1ビットずらす
    i += 1
} // ループを出た時のiが、求めるビット数

print(i)

// コラッツの問題
var n = 7
repeat {
    print("\(n) ", terminator:"")
    if n % 2 == 0 {
        n /= 2
    }else {
        n = n * 3 + 1
    }
}while n > 1
print(n)

// トランプの数札
for n in 2...10 {
    for s in ["♠", "♡", "♣", "♢"] {
        print(" \(s)\(n)", terminator:"")
    }
    print("")
}

// ひと月のカレンダーを表示する
let days = 31                 // １か月の日数
let firstDay = 2              // １日目の曜日（0:日曜）
var w = 0                     // 曜日のための変数
while w < firstDay {          // 月初めに空白を入れる
    print("    ", terminator:"")    // 改行しない
    w += 1
}
var d = 1                     // 日にちを示す変数
loop: while true {
    while w < 7 {
        let pad = d < 10 ? " " : ""      // １桁の場合の詰め物
        print(pad + "  \(d)", terminator:"")
        w += 1
        d += 1
        if d > days {         // 月末になったら
            print("")         // 改行する
            break loop        // 外側のループから脱出
        }
    }
    print("")                 // 週の終わり
    w = 0                     // 曜日を日曜に戻す
}

// ４で割り切れ、かつ100で割り切れないか400で割り切れる年
for year in [ 1996, 2000, 2017, 2020, 2100, 2400 ] {
    
    leap: if year % 4 == 0 {
        if year % 100 == 0 {
            if year % 400 == 0 {
                print("\(year)年は400で割り切れるのでうるう年です。")
                break leap
            }
            print("\(year)年は100で割り切れるのでうるう年ではありません。")
            break leap
        }
        print("\(year)年は4で割り切れるのでうるう年です。")
    }else {
        print("\(year)年は4で割り切れないのでうるう年ではありません。")
    }
    
}

// 自然対数の底の計算
var e = 0.0, t = 1.0
for i in 1 ... 20 {
    e += t
    t /= Double(i)      // ループを回るたびに 1/i! が計算される
}
print("e=\(e)")

// 最初の 20個の素数を表示する
let number = 20
var primes = [ 2 ];            // 整数の配列
print(" 2", terminator:"")
var l = 3                      // nが素数かどうか調べる
while primes.count < number {  // 配列の要素数が numberより少ない
    scan: do {                 // ラベル付きのdo文
        for i in primes {      // 素数列から１つずつ取り出す
            if l % i == 0 {    // 割り切れたら n は素数ではない
                break scan     // do文から抜ける
            }
        }
        primes.append(l)       // for-inループを終えたらnは素数
        print(" \(l)", terminator:"")
    }
    l += 2                     // 調べるのは奇数だけ
}
print("")
