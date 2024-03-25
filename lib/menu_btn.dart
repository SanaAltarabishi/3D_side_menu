import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NenuBtn extends StatefulWidget {
  const NenuBtn({
    super.key,
    required this.press,
    required this.isMenuClose,
  });
  final VoidCallback press;
  final bool isMenuClose;

  @override
  State<NenuBtn> createState() => _NenuBtnState();
}

class _NenuBtnState extends State<NenuBtn> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: widget.press,
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 3), blurRadius: 8),
              ]),
          child: widget.isMenuClose
              ? Icon(
                  Icons.menu,
                  color: Colors.black,
                ).animate().rotate(delay: .4.seconds, duration: .9.seconds)
              : Icon(
                  Icons.close,
                  color: Colors.black,
                ).animate().rotate(delay: .4.seconds, duration: .9.seconds),
        ),
      ),
    );
  }
}
