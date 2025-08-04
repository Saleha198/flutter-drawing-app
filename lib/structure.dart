import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:gamingapp/drawing.dart';
// Import the new screen

class GridViewWidget extends StatefulWidget {
  final List<String> items; // List of item data
  final List<String> sounds; // List of sound file paths
  final double itemWidth; // Customizable width of each item
  final double itemHeight; // Customizable height of each item

  const GridViewWidget({
    super.key,
    required this.items,
    required this.sounds,
    this.itemWidth = 100.0, // Default width if not provided
    this.itemHeight = 100.0, // Default height if not provided
  });

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  late List<bool> _visible;
  final int _delay = 1000; // Delay in milliseconds for each item's appearance
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _selectedIndex = -1; // Track the selected item index

  @override
  void initState() {
    super.initState();
    _visible =
        List.filled(widget.items.length, false); // Initialize visibility list
    _showItemsSequentially();
  }

  void _showItemsSequentially() {
    for (int i = 0; i < _visible.length; i++) {
      Future.delayed(Duration(milliseconds: i * _delay), () {
        setState(() {
          _visible[i] = true;
        });
        // Play sound when the image becomes visible
        if (i < widget.sounds.length) {
          _audioPlayer.play(AssetSource(widget.sounds[i]));
        }
      });
    }
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    // Navigate to the detail screen with the selected image
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailScreen(
          imagePath: widget.items[index],
          height: widget.itemHeight, // Pass height to detail screen
          width: widget.itemWidth,
          //  xOffset: 0,
          //  yOffset: 10,// Pass width to detail screen
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Number of columns
        crossAxisSpacing: 2, // Minimum gap between columns
        mainAxisSpacing: 2, // Minimum gap between rows
      ),
      itemCount: widget.items.length, // Number of items
      itemBuilder: (context, index) {
        bool isSelected =
            _selectedIndex == index; // Check if the item is selected
        return GestureDetector(
          onTap: () => _onItemTap(index), // Handle tap event
          child: AnimatedOpacity(
            opacity: _visible[index] ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: widget.itemWidth, // Set the width of the container
              height: widget.itemHeight, // Set the height of the container
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? Colors.blue
                      : Colors.grey.withOpacity(0.2), // Blue border if selected
                  width: 2, // Border width
                ),
              ),
              child: Center(
                child: _visible[index]
                    ? Image.asset(
                        widget.items[index], // Path to the image
                        fit: BoxFit.cover,
                      )
                    : Container(), // Empty container if there's no image
              ),
            ),
          ),
        );
      },
    );
  }
}
