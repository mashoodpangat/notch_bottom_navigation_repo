import 'package:flutter/material.dart';
import 'inward_top_notch_clipper.dart';

class CustomNotchBottomNavigation extends StatefulWidget {
  final List<Widget> pages;
  final List<IconData> icons;
  final VoidCallback? onFabTap;
  final IconData fabIcon;
  final Color fabColor;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomNotchBottomNavigation({
    super.key,
    required this.pages,
    required this.icons,
    this.onFabTap,
    this.fabColor = Colors.blueGrey,
    this.fabIcon = Icons.add,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
  }) : assert(pages.length == icons.length, 'Pages and icons must be the same length');

  @override
  State<CustomNotchBottomNavigation> createState() => _CustomNotchBottomNavigationState();
}

class _CustomNotchBottomNavigationState extends State<CustomNotchBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const double notchWidthRatio = 0.3;
    const double notchDepthRatio = 0.35;
    const double circleSize = 60;
    const double listUp = 20;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth - 30;
    final double notchWidth = containerWidth * notchWidthRatio;
    const double notchDepth = 68 * notchDepthRatio;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          widget.pages[_currentIndex],
          Positioned(
            bottom: listUp,
            left: (screenWidth - containerWidth) / 2,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                PhysicalShape(
                  clipper: InwardTopNotchClipper(notchWidth, notchDepth),
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.black12,
                  child: SizedBox(
                    height: 68,
                    width: containerWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(widget.icons.length + 1, (i) {
                        // Insert spacing in the middle
                        if (i == (widget.icons.length ~/ 2)) {
                          return const SizedBox(width: 10);
                        }
                        // Adjust index to skip spacing index
                        final actualIndex = i > (widget.icons.length ~/ 2) ? i - 1 : i;
                        return navItem(icon: widget.icons[actualIndex], index: actualIndex);
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  child: Material(
                    shape: const CircleBorder(),
                    elevation: 0,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: widget.onFabTap,
                      child: Container(
                        height: circleSize,
                        width: circleSize,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.fabColor),
                        child: Icon(widget.fabIcon, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({required IconData icon, required int index}) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: isSelected ? widget.selectedColor : widget.unselectedColor),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(shape: BoxShape.circle, color: widget.selectedColor),
            ),
        ],
      ),
    );
  }
}
