import 'package:flutter/material.dart';

class ColorPalette {
  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.black,
    Color.fromARGB(255, 191, 119, 119),
    Colors.amber,
    Colors.grey
  ];
}

class ColorPicker extends StatefulWidget {
  final ValueChanged<Color> onColorSelected;

  const ColorPicker({super.key, required this.onColorSelected});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color _selectedColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 12,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: ColorPalette.colors.length,
      itemBuilder: (context, index) {
        final color = ColorPalette.colors[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
            widget.onColorSelected(color);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                color:
                    _selectedColor == color ? Colors.black : Colors.transparent,
                width: 2.0,
              ),
            ),
            width: 30,
            height: 30,
            child: Center(
              child: _selectedColor == color
                  ? const Icon(Icons.check, color: Colors.white, size: 15)
                  : null,
            ),
          ),
        );
      },
    );
  }
}
