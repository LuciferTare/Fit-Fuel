import 'package:flutter/material.dart';

Widget navButton(
    {required IconData icon,
    required String label,
    required GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: EdgeInsets.all(7.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Color(0xBED9D9D9)),
          // Text(label, style: TextStyle(fontSize: 12, color: Color(0xFFD9D9D9))),
        ],
      ),
    ),
  );
}

Widget activeNavButton(
    {required IconData icon,
    required String label,
    required GestureTapCallback onTap}) {
  return InkWell(
    onTap: onTap,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xBED9D9D9), borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(7.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Color(0xFF181A20)),
          // Text(label, style: TextStyle(fontSize: 12, color: Color(0xFF181A20))),
        ],
      ),
    ),
  );
}
