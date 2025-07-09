import Foundation

class CalculatorApiImpl: CalculatorApi {
    func add(a: Double, b: Double) throws -> Double {
        return a + b
    }
    
    func subtract(a: Double, b: Double) throws -> Double {
        return a - b
    }
    
    func multiply(a: Double, b: Double) throws -> Double {
        return a * b
    }
    
    func divide(a: Double, b: Double) throws -> Double {
        if b == 0 {
            throw PigeonError(code: "DIVISION_BY_ZERO", message: "Cannot divide by zero", details: nil)
        }
        return a / b
    }
}
