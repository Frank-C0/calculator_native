import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculator_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Native',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorPage(title: 'Calculator Native'),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _result = '';
  final CalculatorApi _calculatorApi = CalculatorApi();

  Future<void> _performOperation(String operation) async {
    try {
      final double firstNumber = double.parse(_firstNumberController.text);
      final double secondNumber = double.parse(_secondNumberController.text);
      
      double result;
      switch (operation) {
        case 'add':
          result = await _calculatorApi.add(firstNumber, secondNumber);
          break;
        case 'subtract':
          result = await _calculatorApi.subtract(firstNumber, secondNumber);
          break;
        case 'multiply':
          result = await _calculatorApi.multiply(firstNumber, secondNumber);
          break;
        case 'divide':
          result = await _calculatorApi.divide(firstNumber, secondNumber);
          break;
        default:
          throw Exception('Unknown operation');
      }
      
      setState(() {
        _result = 'Result: ${result.toString()}';
      });
    } catch (e) {
      setState(() {
        if (e is PlatformException && e.code == 'DIVISION_BY_ZERO') {
          _result = 'Error: Cannot divide by zero';
        } else {
          _result = 'Error: ${e.toString()}';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _performOperation('add'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('subtract'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('multiply'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _performOperation('divide'),
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _result.isEmpty ? 'Result will appear here' : _result,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }
}
