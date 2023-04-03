import 'package:flutter/material.dart';
import '../colors.dart' as color;

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.21,
        height: size.height * 0.045,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst,
              color.AppColor.gradientFirst.withOpacity(0.8),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
