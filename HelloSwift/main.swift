//
//  main.swift
//  
//
//  Created by Dmitry Sinelnikov on 05/12/2015.
//
//

import Foundation
import Cocoa

var myVar = 42
myVar = 50
let myConst = myVar + 2
var str = "Hello, playground"
print(str, ":" ,myVar, "is var and", myConst, "is Const!");

var float = 70.0;
var double: Double = 70;
print (float, double);

var width: Double = 906090
var text = "The width is around "
let final = text + String(width)
let final2 = "Increased width \(width+1)"
print(final);
print(final2);

let opt1: Int? = 9;
let opt2: Int? = nil; 
print("Optionals: \(opt1) and \(opt2)")


