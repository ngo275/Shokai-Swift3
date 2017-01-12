//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*var total = 0

func count(n: Int) -> Int {
    total += n
    return total
}

func reset() { total = 0 }

reset()
let a = 10
let b = count(n: a - 5)
print("\(b)")
print("\(count(n: a))")
reset()
print("\(count(n: -2))")*/


func buyProduct(product:Int, price:Int, quantity:Int) {
    print("Product:\(product), amount = \(price * quantity)")
}

buyProduct(product:19090, price:180000, quantity:1)
buyProduct(product:9982, price:19090, quantity:3)
buyProduct(product:10031, price:108, quantity:2)


let fontSize: Float = 12.0

func setFont(name:String, size:Float = fontSize, bold:Bool = false) {
    print("\(name) \(size)" + (bold ? " [B]" : ""))
}

func setGray(level:Int = 255, _ alpha:Float = 1.0) {
    print("Gray=\(level), Alpha=\(alpha)")
}

setFont(name:"RaglanPunch")
setFont(name:"Courier", bold:true)
setFont(name:"Times", size:16.0, bold:true)
// setFont(name:"Times", bold:true, size:18.0)

setGray()
setGray(level:240)
setGray(level:128, 0.5)

print("")
// 以下は様々な定義パターンの例

func setFont2(name:String, size:Float = 12.0, bold:Bool) {
    print("\(name) \(size)" + (bold ? " [B]" : ""))
}

setFont2(name:"Baskerville", size:18.0, bold:true)
setFont2(name:"Helvetica", bold:true)

func setFont3(_ name:String, _ size:Float = 12.0, _ bold:Bool = false) {
    print("\(name) \(size)" + (bold ? " [B]" : ""))
}

setFont3("Menlo", 14.0, true)
setFont3("Menlo", 18.0)
setFont3("Courier")


// ツェラーの公式（変更前）
/*func dayOfWeek(_ y:Int, _ m:Int, _ d:Int) -> Int {
    let leap = y + y / 4 - y / 100 + y / 400
    return (leap + (13 * m + 8) / 5 + d) % 7
}

print(dayOfWeek(1993, 14, 1))  // 1994.02.01*/


// ツェラーの公式（変更後）
func dayOfWeek(_ y:Int, _ m:Int, _ d:Int) -> Int {
    var y = y, m = m       // 少々トリッキー。変数yは仮引数のyとは違う
    if m < 3 {             // 1,2月だったら
        m += 12; y -= 1    // 前年の13月、14月として計算する
    }
    let leap = y + y / 4 - y / 100 + y / 400
    return (leap + (13 * m + 8) / 5 + d) % 7
}

print(dayOfWeek(1994, 2, 1))  // 1994.02.01
print(dayOfWeek(2016,12,25))


// ひと月のカレンダーを表示する関数

func printMonth(first fday:Int, days:Int) {
    var d = 1 - fday             // 月のはじまりの空白は負と０で表す
    func daystr() -> String {    // 関数内のローカルな関数
        if d <= 0 {              // 変数dは上で定義したもの
            return "    "        // 月初めの空白
        }else {
            return (d < 10 ? "   \(d)" : "  \(d)")
        }
    }
    
    while d <= days {
        var line = ""             // 一週間分の日付を並べる
        for _ in 0 ..< 7 {
            line += daystr()      // ネスト関数を使用
            d += 1
            if d > days { break } // 月末になったら抜ける
        }
        print(line)
    }
}

printMonth(first:2, days:31)
printMonth(first:5, days:29)


func mySwap(_ a: inout Int, _ b: inout Int) {
    let t = a; a = b; b = t
}
var s = 10, t = 20
mySwap(&s, &t)
print("s=\(s), t=\(t)")

func mySwap(_ a: inout Int, _ b: inout Int, _ c: inout Int) {
    let t = a; a = b; b = c; c = t
}

var x = 1, y = 2, z = 3
mySwap(&x, &y, &z)
print("x=\(x), y=\(y), z=\(z)")


func mySwap(_ a: inout String, _ b: inout String) {
    let t = a; a = b; b = t
}

var a = "Alcott", b = "Bodewig"
mySwap(&a, &b)
print("a=\(a), b=\(b)")

func mySwap(little a: inout Int, great b: inout Int) {
    if a > b {
        let t = a; a = b; b = t
    }
}

s = 10; t = 20
mySwap(little:&s, great:&t)
print("s=\(s), t=\(t)")
mySwap(little:&t, great:&s)
print("t=\(t), s=\(s)")


// タプルを使ってフィボナッチ数列を計算する
var fibo1 = 0, fibo2 = 1
print(fibo1, terminator:" ")
for _ in 0 ..< 50 {
    (fibo1, fibo2) = (fibo2, fibo1 + fibo2)  // 新しい項を計算し、値を入れ替え
    print(fibo1, terminator:" ")
}
print("")


// BMIを計算する関数
func BMI(tall:Double, weight:Double) -> (Double, Double) {
    let ideal = 22.0                  // 理想的な値
    let t2 = tall * tall / 10000.0    // cm を m に換算して二乗
    let index = weight / t2           // BMIを計算
    return (index, ideal * t2)        // 目標体重も計算して返す
}

print(BMI(tall:177.0, weight:80.0))
print(BMI(tall:165.0, weight:60.5))
print(BMI(tall:183.0, weight:75.0))





