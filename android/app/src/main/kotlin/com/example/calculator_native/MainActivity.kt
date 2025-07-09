package com.example.calculator_native

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Register Calculator API
        val calculatorApi = CalculatorApiImpl()
        CalculatorApi.setUp(flutterEngine.dartExecutor.binaryMessenger, calculatorApi)
    }
}
