import 'package:app/button_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SideMenuTile extends StatefulWidget {
  final ValueChanged<int> press;
  final ButtonData data;
  final bool isActive;
  final int index;
// final IconData icon;
// final String text;
  const SideMenuTile({
    super.key,
    required this.press,
    required this.data,
    required this.isActive,
    required this.index,
  });

  @override
  State<SideMenuTile> createState() => _SideMenuTileState();
}

class _SideMenuTileState extends State<SideMenuTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        Tween<double>(begin: 0.0, end: 1).animate(_animationController);
  }

  void _startAnimation(int index) {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 300),
                height: 56,
                width: widget.isActive ? 288 : 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 4,
                    right: 4,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 54, 70, 116),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                )),
            ListTile(
              onTap: () {
                widget.press(widget.index);
                _startAnimation(widget.index);
              },
              leading: SizedBox(
                height: 34,
                width: 34,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value * 2 * 3.14,
                      child: Icon(
                        widget.data.icons,
                        color: Colors.white,
                      ).animate().rotate(duration: .3.seconds),
                    );
                  },
                ),
              ),
              title: Text(
                widget.data.buttonText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
