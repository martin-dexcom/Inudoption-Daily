import Foundation
// Swift is very intelligent
let normalNumber = 16

// So intelligent actually, that we can represent multiple types of numbers
// base-2 (binary)
let binaryNumber = 0b010000
// base-16 (hexadecimal)
let hexNumber = 0x000010

// Bitwise math!
let veryBigBinary = 0b111111111
let largerBinary = 0b100000000


// Bitwise-and
veryBigBinary & largerBinary

// Bitwise-or
veryBigBinary | largerBinary

// Shift-bits
    // Every time a bit moves to the right, its value gets divided by a factor of 2
largerBinary >> 1
    // Every time a bit moves to the left, its value gets multiplied by a factor of 2
largerBinary << 1

    // in every numeric system that is supported by Swift!

    // How does the computer know how to convert a hexadecimal value to RGB?
// #FF|FF|FF <- White
// rgb(1,1,1) <- RGB White

    // #FF0000

    // Hex works: 1,2,3,4,5,6,7,8,9,A,B,C,D,E,F -> 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 1A, C0, D0, E0, F0

// 0x0000FF what is the value of this?
let hexColor = 0xFF0000
// 0b111111110000000000000000
(0b111111110000000000000000 >> 16) & 0b000000000000000011111111
0b000000000000000011111111 & 0b000000000000000011111111
(0b111111110000000000000000 >> 8) & 0b000000000000000011111111
0b000000001111111100000000 & 0b000000000000000011111111
0b111111110000000000000000
let bColor = 0b11111111
let red = (hexColor >> 16 & 0xFF)
let green = (hexColor >> 8 & 0xFF)
let blue = (hexColor & 0xFF)

print(red, green, blue)
