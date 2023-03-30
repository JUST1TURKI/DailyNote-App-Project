import 'package:flutter/material.dart';

import '../size_config.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class TryScreen extends StatefulWidget {
  const TryScreen({
    Key? key,
  }) : super(key: key);

  @override
  _TryScreen createState() => _TryScreen();
}

class _TryScreen extends State<TryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: MyButton(
                  label: 'add Task',
                  onTap: () {},
                ),
              ),
              InputField(
                title: 'title',
                hint: 'Enter your title',
                widget: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.access_alarm),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
