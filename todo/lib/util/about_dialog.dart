import 'package:flutter/material.dart';

class AboutDialogBox extends StatelessWidget {
  const AboutDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.info,
        size: 24,
        color: Colors.black,
      ),
      title: Text(
        "About",
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.yellow,
              content: Container(
                height: 120,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "This is a simple TO-DO app made by me to learn flutter.",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      MaterialButton(
                        color: Colors.yellow.shade300,
                        onPressed: Navigator.of(context).pop,
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
