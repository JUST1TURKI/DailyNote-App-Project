import 'package:flutter/material.dart';

class Missions extends StatefulWidget {
  const Missions({Key? key}) : super(key: key);
  @override
  _Missions createState() => _Missions();
}

class _Missions extends State<Missions> {
  double _left = 1000;
  Color _color = Colors.black87;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: _left,
            child: Container(
              width: size.width * 0.1,
              height: size.height * 0.9,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      'Messi',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _left = (_left == 1000 ? 200 : 1000);
            _color =
                (_color == Colors.black12 ? Colors.black45 : Colors.black12);
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
      ),
    );
  }
}
