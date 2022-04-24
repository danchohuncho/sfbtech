import 'package:flutter/material.dart';

class SetWallpaperButton extends StatelessWidget {
  final String title;

  const SetWallpaperButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 2.5,
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.9),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 2.5,
          alignment: Alignment.center,
/*          padding: const EdgeInsets.symmetric(
              horizontal: 8, vertical: 18),*/
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white60, width: 1),
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x36FFFFFF),
                  Color(0x0FFFFFFF),
                ]),
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
