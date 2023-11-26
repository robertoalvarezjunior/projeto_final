import 'package:flutter/material.dart';

class AcompanharPedidoPage extends StatefulWidget {
  const AcompanharPedidoPage({super.key});

  @override
  State<AcompanharPedidoPage> createState() => _AcompanharPedidoPageState();
}

class _AcompanharPedidoPageState extends State<AcompanharPedidoPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 2) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: [
          Step(
              title: const Text('Step 1'),
              content: const Text('Content 1'),
              state: _index >= 1 ? StepState.complete : StepState.disabled,
              isActive: _index >= 0),
          Step(
              title: const Text('Step 2'),
              content: const Text('Content 2'),
              state: _index >= 2 ? StepState.complete : StepState.disabled,
              isActive: _index >= 1),
          Step(
              title: const Text('Step 3'),
              content: const Text('Content 3'),
              state: _index >= 3 ? StepState.complete : StepState.disabled,
              isActive: _index >= 2),
          Step(
              title: const Text('Step 4'),
              content: const Text('Content 4'),
              state: _index >= 4 ? StepState.complete : StepState.disabled,
              isActive: _index >= 3),
        ],
      ),
    );
  }
}
