import UIKit

let testCasesEx1: [[String]] = [
    ["(", ")"],
    ["(", "[", "]", "]"],
    ["(", "[", "{", "}", "]", ")"],
    ["(", "[", "[", "{", "}", "]", "]", "]"],
    [")"],
    ["(", "]", "}", "]", ")"],
    ["(", "[", ")", "]"],
    ["{"]
]

let testCasesEx2: [[String]] = [
    ["TH19", "SG20", "TH2"]
    ,
    ["TH10", "TH3Netflix", "TH1", "TH7"]
]

let testCasesEx3: [[String]] = [
    ["Mother", "Think", "Worthy", "Apple", "Android"],
]

let testCasesEx4_1: [Int] = [
    1989,
    2000,
    68,
    109,
]

let testCasesEx4_2: [String] = [
    "MCMLXXXIX",
    "MM",
    "LXVIII",
    "CIX",
]



let testCasesEx5: [Int] = [
    3008,
    1989,
    2679,
    9163,
]

let testCasesEx6 = [
    (arrData: [], result: 1),(arrData: [5, 2, 0], result: 4),(arrData: [1], result: 2),(arrData: [3, 4, 1], result: 4),(arrData: [1, 3, 5], result: 5),
    (arrData: [2, 2, 2], result: 3),(arrData: [10, 10, 10], result: 4)
]


//Ex 1
func checkBracket(arr: [String]) {
    var open:Array<String> = ["(", "[", "{"]
    var close:Array<String> = [")", "]", "}"]
    var isCheck: Bool = false
    if(arr.count % 2 == 0){
        for i in 0..<arr.count / 2 {
            if open.firstIndex(of: arr[i]) == close.firstIndex(of: arr[(arr.count - 1) - i]){
                isCheck = true
            }else{
                isCheck = false
                break
            }
        }
    }else{
        isCheck = false
    }
    print("\(arr) => \(isCheck)")
}


//EX2
func sortList(arr: [String]) {
    var processedArr: [[String]] = []

    for input in arr {
        var beforeNumbers = ""
        var afterNumbers = ""
        var numbers = ""
        var hasNumberStarted = false

        for character in input {
            if character.isNumber {
                numbers.append(character)
                hasNumberStarted = true
            } else if hasNumberStarted {
                afterNumbers.append(character)
            } else {
                beforeNumbers.append(character)
            }
        }

        processedArr.append([beforeNumbers, numbers, afterNumbers])
    }

    let sortedArr = processedArr.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        }

        let num1 = Int($0[1]) ?? Int.max
        let num2 = Int($1[1]) ?? Int.max
        return num1 < num2
    }

    let resultArray = sortedArr.map { $0.joined() }
    
    print(resultArray)
}



// EX 3
func autocomplete(_ txtSearch: String, _ arr: [String],_ count :Int) -> [String] {
    var newSearchResualt:Array<String> = []
    let lowercasedSearch = txtSearch.lowercased()
    let filteredResult = arr.filter { $0.lowercased().contains(lowercasedSearch) && !$0.lowercased().hasPrefix(lowercasedSearch)}.sorted()
    let prefixSearch = arr.filter{$0.lowercased().hasPrefix(lowercasedSearch)}.sorted()
    newSearchResualt = prefixSearch + filteredResult
    return Array(newSearchResualt.prefix(count))
}

// EX 4-1
func numberToRoman(_ numberInput:Int) {
    var num = numberInput
    var result = ""
    let newNumberToArr: [Int: String] = [1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"]
    let sortedKeys = newNumberToArr.keys.sorted(by: >)
    for key in sortedKeys {
          while num >= key {
              result += newNumberToArr[key]!
              num -= key
          }
      }
    print(result)
}
// EX 4-2
func romanNumber(_ romanNum:String) {
    let number = romanNum
    let numberToArr = Array(number)
    var newNumberToArr: [Int] = []
    var total = 0


    for i in numberToArr {
        switch i {
        case "I": newNumberToArr.append(1)
        case "V": newNumberToArr.append(5)
        case "X": newNumberToArr.append(10)
        case "L": newNumberToArr.append(50)
        case "C": newNumberToArr.append(100)
        case "D": newNumberToArr.append(500)
        case "M": newNumberToArr.append(1000)
        default: print("NotMatch")
        }
    }
    for i in 0..<newNumberToArr.count {
        let currentValue = newNumberToArr[i]
        if (i + 1) < newNumberToArr.count && currentValue < newNumberToArr[i + 1] {
            total -= currentValue
        } else {
            total += currentValue
        }
    }

    print("เลขโรมัน \(number) เท่ากับ \(total)")
}


// EX 5
func sortPositive(_ numberInput:Int) -> Int {
    var num = Array(String(numberInput))
    let numberString = num.sorted(by: > ).map { String($0) }.joined()
    return Int(numberString) ?? 0
}


// EX 6
func tribonacci(_ arr:Array<Int>,countResult:Int){
    var arr = arr
    var countResult = countResult
    if(arr.count != 0 && arr.count != countResult && arr.count >= 3){
        for i in arr.count...countResult-1{
            var cal = 0
            for j in arr.count-3...arr.count-1 {
                cal += arr[j]
            }
            arr.append(cal)
        }
    }
    if(arr.count >= 3){
        print(arr)
    }else{
        print("error")
    }
  
}

//Run EX 1
for i in testCasesEx1 {
    checkBracket(arr: i)
}

//Run EX 2
for i in testCasesEx2 {
    sortList(arr: i)
}

//Run EX 3
for i in testCasesEx3 {
    print(autocomplete("Th",i,2))
}

//Run EX 4-1
for i in testCasesEx4_1 {
    numberToRoman(i)
}

//Run EX 1-2
for i in testCasesEx4_2 {
    romanNumber(i)
}

//Run EX 5
for i in testCasesEx5 {
    print(sortPositive(i))
}

// EX 6
for i in testCasesEx6{
    tribonacci(i.arrData,countResult: i.result)
}














