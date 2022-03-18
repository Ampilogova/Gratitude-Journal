import UIKit

func isPalindrome(_ x: Int) -> Bool {
    
    guard x >= 0 else {
        return false
    }
    
    if x < 10 {
        return true
    }
    
    var temp = x
    var rev = 0
    
    while temp != 0 {
        rev = (rev * 10) + (temp % 10)
        temp /= 10;
    }
    
    
    return  rev == x
}

isPalindrome(121)

var temp = 121
var rev = 0

while temp != 0 {
    rev = (rev * 10) + (temp % 10)
    print(rev)
    temp /= 10;
}
rev * 10
temp % 10
