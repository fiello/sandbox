//
//  main.swift
//  
//
//  Created by Dmitry Sinelnikov on 05/12/2015.
//
//

import Foundation
import Cocoa

print("================== start ==================");


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

print("================== optionals ==================");
let opt1: Int? = 9;
let opt2: Int? = nil;
print("Optionals: \(opt1) and \(opt2)")

let int1 = opt1!;
let int2 = opt2 == nil ? 0 : opt2!;

var str1 = "7";
var str2Int = Int(str1);
print(str2Int!);
str1 = "seven";
str2Int = Int(str1);
print(str2Int == nil ? str2Int : str2Int!);

var implicitlyUnwrapped : Int! = 1;
print("Implicitly unwrapped -", implicitlyUnwrapped);
implicitlyUnwrapped = nil;
//print("Implicitly unwrapped -", implicitlyUnwrapped); - error!
if let someName = implicitlyUnwrapped
{
    print("optional binding - unwrapped")
}
else
{
    
    print("optional binding - nillo")
}


print("================== arrays ==================");

var list = ["Alicia", "Bob", "Carl"]
list[2] = "Michael"
print(list[2]);

print("================== conditionals ==================");

var myConditionalList = [12, 23, 45, 67 , 10, 09, 20, 4];
for score in myConditionalList
{
if (score < 20)
{
    print("less");
}
else if (score > 20)
{
    print("moar");
}
else
{
    print("equal");
}
}

var optionalName: String?  = "Carl";
var optionalHello: String? = "Hello";
if let hello = optionalHello where hello.hasPrefix("H"),
   let name = optionalName
{
    print("\(hello), \(name)")
}


let vegetable = "red pepper";
switch vegetable
{
case "cucamber" : print("long and green");
case let x where x.hasSuffix("pepper") : print("it's spicy!");
default: print("unknown");
}

var loop = 0;
for var i in 0..<4
{
    loop += i*2;
}
print(loop);


func sayHello2People(hello: String, name: String) -> String
{
    return String(hello) + ", mr(s) " + String(name);
}

print(sayHello2People("hello", name: "carl"));


print("================== classes ==================");

class Shape
{
    var numberOfSides: Int = 0;
    var name: String = "";
    
    init(name: String, sides: Int)
    {
        self.name = name;
        self.numberOfSides = sides;
    }
    
    func getSides() -> Int
    {
        return numberOfSides;
    }
    
    func getName() -> String
    {
        return name;
    }
}

var square = Shape(name: "Square", sides: 6);
print("\(square.getName()) has \(square.getSides()) sides")

class Circle: Shape
{
    init()
    {
        super.init(name: "circle", sides: 0);
        
    }
};

var crl = Circle();
print(crl.getName(), " has ", crl.getSides(), " sides");




class Sphere : Shape
{
    init()
    {
        super.init(name: "Sphere", sides: -1);
    }
    
    override func getSides() -> Int{
        print("W: \(self.getName()) does not have sides!");
        return numberOfSides;
    
    }
}

let tor = Sphere();
tor.getSides();

print("================== typecasts in classes ==================");

class Square : Shape
{
    init()
    {
        super.init(name: "Square", sides: 4);
    }
}

class Triangle : Shape
{
    var sumOfLength: Double;
    
    init(sumOfLength: Double)
    {
        self.sumOfLength = sumOfLength;
        super.init(name: "Triangle", sides: 3);
    }
}

let shapes = [Triangle(sumOfLength: 3.2), Triangle(sumOfLength:3.1), Square(), Sphere(), 1];


var squares = 0;
var triangles = 0;
var unknown = 0;
for i in shapes
{
    if let shape = i as? Square {
        squares++;
    }
    else if let shape = i as? Triangle {
        triangles++;
    }
    else {
        unknown++;
    }
}

print("So we have \(triangles) triabgles and \(squares) squares", unknown > 0 ? "and \(unknown) unknowns" : "" );


print("================== enums ==================");


enum Rank: Int{
    case Ace = 1;
    case Two, Three, Four, Five, Siz, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func getSimpleDescription() -> String
    {
        switch self
        {
        case .Ace: return "ace"
        case .King: return "king";
        case .Queen: return "queen";
        case.Jack: return "jack";
        default:
            return String(self.rawValue)
            
        }
        
        
    }
}

let ace = Rank.Ace;
let rawAceValue = ace.rawValue;

print("you have \(ace.getSimpleDescription()) which is equal to \(rawAceValue)");
if let convertedRank = Rank(rawValue: 11){
    print("converted var here is \(convertedRank.getSimpleDescription())")
}


print("================== protocols ==================");

protocol SimpleProtocol
{
    var simpleDescription: Int { get };
    func adjust();
}

class Simple : SimpleProtocol
{
    // SimpleProtocol
    var simpleDescription: Int = 1;
    
    func adjust()
    {
        print("this is current description: \(self.simpleDescription), adjusted");
    }
}

class Simple2 : SimpleProtocol
{
    // SimpleProtocol
    var simpleDescription: Int = 2;
    
    func adjust()
    {
        print("Another simple protocol, adjusted!");
    }
}

let protocolArray: [SimpleProtocol] = [Simple(), Simple(), Simple2()]

for proto in protocolArray {
    proto.adjust();
    
}

// a bit more of arrays
var yetAnotherProcotolView = [SimpleProtocol]();
yetAnotherProcotolView.append(Simple());

let preallocatedArray = [Int](count: 3, repeatedValue: 0)

print("================== SWIFT basics ++ ==================");

var newVariable: UInt8 = 0;
for _ in 0..<UInt8.max {
    print("\(++newVariable)", terminator: " ")
    
}
print("")
print("going to go beyond the threshold")
//++newVariable -- runtime error!
print("")

typealias AudioSample = UInt16
let i = 1;
if i == 1 {
    
}

// tuples
let http404ErrorCode = (404, "Not Found")
let (statusCode, statusMessage) = http404ErrorCode

print("================== SWIFT collections ==================");


let numOfColumns = 5;
let numOfRows = 5;
var array = Array<Array<Int>>();
for i in 0..<numOfRows {
    array.append(Array(count:numOfColumns, repeatedValue:Int()));
}
for var row in array {
    for var cell in row {
        print("\(cell)", terminator: " ")
    }
    print("")
}


print("================== SWIFT generics ==================");

func swapValues<T>(inout a: T, inout and b: T)
{
    let temp = b;
    b = a;
    a = temp;
}

var a = 2;
var b = 3;
swapValues(&a, and: &b);
print("a = \(a), b = \(b)")





