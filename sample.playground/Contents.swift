import UIKit

enum MyError: Error {
    case customError(message: String)
}

var nilOK: Int?

if let test = nilOK {
    print("nilのため実行されない")
}

nilOK = 10

if let test2 = nilOK {
    print("値があるため実行される")
}

nilOK = nil
guard let test3 = nilOK else {
    print("nilだから実行される")
    throw MyError.customError(message: "test3でエラー。ここで処理が止まる")
}

nilOK = 20
guard let test4 = nilOK else {
    print("nilじゃないため実行されない")
    throw MyError.customError(message: "test4でエラー")
}
