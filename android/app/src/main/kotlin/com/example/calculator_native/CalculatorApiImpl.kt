package com.example.calculator_native

class CalculatorApiImpl : CalculatorApi {
    override fun add(a: Double, b: Double): Double {
        return a + b
    }

    override fun subtract(a: Double, b: Double): Double {
        return a - b
    }

    override fun multiply(a: Double, b: Double): Double {
        return a * b
    }

    override fun divide(a: Double, b: Double): Double {
        if (b == 0.0) {
            throw FlutterError("DIVISION_BY_ZERO", "Cannot divide by zero")
        }
        return a / b
    }
}
