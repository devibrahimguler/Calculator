//
//  SingletonCalculatorAppTests.swift
//  SingletonCalculatorAppTests
//
//  Created by İbrahim Güler on 1.10.2021.
//

import XCTest
@testable import SingletonCalculatorApp

class CalculateTests: XCTestCase {
    
    // We want to adding two numbers.
    func test_toAdd_twoNumber(){
        XCTAssertEqual(calculater.toAdd(num1: 2, num2: 2), 4)
    }
    
    // We have got first number but we haven't second number so we want to second number is zero and not nil func.
    func test_toAdd_hasFirstNumber_hasntSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toAdd(num1: 2), 2)
        XCTAssertNotNil(calculater.toAdd(num1: 2))
    }
    
    // We have got second number but we haven't first number so we want to first number is zero and not nil func.
    func test_toAdd_hasntFirstNumber_hasSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toAdd(num2: 2), 2)
        XCTAssertNotNil(calculater.toAdd(num2: 2))
    }
    
    // We want to subtract two numbers.
    func test_toSubtract_twoNumber(){
        XCTAssertEqual(calculater.toSubtract(num1: 2, num2: 2), 0)
    }
    
    // We have got first number but we haven't second number so we want to second number is zero and not nil func.
    func test_toSubtract_hasFirstNumber_hasntSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toSubtract(num1: 2), 2)
        XCTAssertNotNil(calculater.toSubtract(num1: 2))
    }
    
    // We have got second number but we haven't first number so we want to first number is zero and not nil func.
    func test_toSubtract_hasntFirstNumber_hasSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toSubtract(num2: 2), -2)
        XCTAssertNotNil(calculater.toSubtract(num2: 2))
    }
    
    // We want to multiply two numbers.
    func test_toMultiply_twoNumber(){
        XCTAssertEqual(calculater.toMultiply(num1: 2, num2: 2), 4)
    }
    
    // We have got first number but we haven't second number so we want to second number is zero and not nil func.
    func test_toMultiply_hasFirstNumber_hasntSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toMultiply(num1: 2), 0)
        XCTAssertNotNil(calculater.toMultiply(num1: 2))
    }
    
    // We have got second number but we haven't first number so we want to first number is zero and not nil func.
    func test_toMultiply_hasntFirstNumber_hasSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toMultiply(num2: 2), 0)
        XCTAssertNotNil(calculater.toMultiply(num2: 2))
    }
    
    // We want to divide two numbers.
    func test_toDivide_twoNumber(){
        XCTAssertEqual(calculater.toDivide(num1: 2, num2: 2), 1)
    }
    
    // We have got first number but we haven't second number so we want to second number is zero and we want to result is zero.
    func test_toDivide_hasFirstNumber_hasntSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toDivide(num1: 2), 0)
        XCTAssertNotNil(calculater.toDivide(num1: 2))
    }
    
    // We have got second number but we haven't first number so we want to first number is zero and we want to result is zero.
    func test_toDivide_hasntFirstNumber_hasSecondNumber_andNotNilFunc(){
        XCTAssertEqual(calculater.toDivide(num2: 2), 0)
        XCTAssertNotNil(calculater.toDivide(num2: 2))
    }
    
    // Helper
    
    var calculater = Calculate()
    

}
