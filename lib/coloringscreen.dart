import 'package:flutter/material.dart';

void main() {
  runApp(ColoringBookApp());
}

class ColoringBookApp extends StatelessWidget {
  const ColoringBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Coloring Book'),
        ),
        body: ColoringPage(),
      ),
    );
  }
}

class ColoringPage extends StatefulWidget {
  const ColoringPage({super.key});

  @override
  _ColoringPageState createState() => _ColoringPageState();
}

class _ColoringPageState extends State<ColoringPage> {
  Color _selectedColor = Colors.black;
  final List<Color> _chunkColors = List.generate(
      7, (_) => Colors.transparent); // List of colors for each chunk

  void _changeColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _colorChunk(int index) {
    setState(() {
      _chunkColors[index] = _selectedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> chunkImages = [
      'assets/svg/images/chunk1.png',
      'assets/svg/images/chunk2.png',
      'assets/svg/images/chunk3.png',
      'assets/svg/images/chunk4.png',
      'assets/svg/images/chunk5.png',
      'assets/svg/images/chunk6.png',
      'assets/svg/images/chunk7.png',
    ];

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Color Picker
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                ),
                onPressed: () => _changeColor(Colors.red),
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () => _changeColor(Colors.blue),
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                ),
                onPressed: () => _changeColor(Colors.green),
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () => _changeColor(Colors.yellow),
              ),
              IconButton(
                icon: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purple,
                ),
                onPressed: () => _changeColor(Colors.purple),
              ),
            ],
          ),
          const SizedBox(
              height: 8), // Add some spacing between color picker and chunks
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(chunkImages.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                        bottom: 8.0), // Add space between chunks
                    child: GestureDetector(
                      onTap: () => _colorChunk(index), // Color the tapped chunk
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _chunkColors[index].withOpacity(0.3),
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          chunkImages[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
