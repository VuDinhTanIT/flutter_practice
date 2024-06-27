import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final int price;
  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Mouse', 200),
  ProductInfo('Keyboard', 300),
  ProductInfo('Headset', 400),
  ProductInfo('Monitor', 500),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curentIndex = 0;
  int? _inputtedPrice;
  String _result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 80)),
        Text(products[_curentIndex].name),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          width: 200,
          child: TextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) {
              _inputtedPrice = int.tryParse(value);
            },
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _result = _inputtedPrice == products[_curentIndex].price
                    ? 'Correct'
                    : 'Wrong';
                // _curentIndex++;
              });
              // _curentIndex++;
              print('Curent index: $_curentIndex');
            },
            child: const Text('Check')),
        Visibility(
          visible: _result.isNotEmpty,
          child: Text(_result),
        ),
        Visibility(
          visible: _result.isNotEmpty,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = '';
                  if (_curentIndex < products.length - 1) {
                    _curentIndex++;
                  }
                });
              },
              child: const Text('Next')),
        )
      ],
    )));
  }
}
