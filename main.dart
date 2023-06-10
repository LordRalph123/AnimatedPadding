import 'package:flutter/material.dart';

void main() => runApp(AnimatedApp());

class AnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedPaddingExample(),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double padValue = 0;

  _updatePadding(double value) => setState(() => padValue = value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              onPressed: () {
                setState(() {
                  padValue = padValue == 0 ? 100 : 0;
                });
              },
              child: const Text("Change Padding")),
          Text(
            "Padding = $padValue",
            style: TextStyle(
                color: Colors.green, fontSize: 14, fontStyle: FontStyle.italic),
          ),
          AnimatedPadding(
            padding: EdgeInsets.all(padValue),
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
