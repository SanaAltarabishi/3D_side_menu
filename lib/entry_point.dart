import 'dart:math';
import 'package:app/animated_menu.dart';
import 'package:app/menu_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isMenuClose = true;
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scalAnimation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17203a),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 150),
              width: 288,
              height: 800,
              left: isMenuClose ? -2 : 0,
              child: SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                    scale: scalAnimation.value,
                    child: ClipRRect(
                        borderRadius: isMenuClose
                            ? BorderRadius.all(Radius.circular(0))
                            : BorderRadius.all(Radius.circular(24)),
                        child: HomeScreen()))),
          ),
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(
              milliseconds: 200,
            ),
            top: 10,
            left: isMenuClose ? 0 : 220,
            child: NenuBtn(
              isMenuClose: isMenuClose,
              press: () {
                if (isMenuClose) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                setState(() {
                  isMenuClose = !isMenuClose;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffcf5),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          stops: [0.6, 0.1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xfffffcf5),
            Color(0xff17203a),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Entry Page..',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17203a),
                ),
              ),
            ),
            Center(
              child: Text(
                'hello ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff17203a),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
