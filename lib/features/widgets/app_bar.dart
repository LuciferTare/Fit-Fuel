import 'package:flutter/material.dart';

PreferredSize appBar({required BuildContext context}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0x7ED9D9D9), width: 1))),
      child: AppBar(
        backgroundColor: Color(0xFF181A20),
        elevation: 8,
        shadowColor: Color(0xFFD9D9D9).withValues(alpha: 0.1),
        surfaceTintColor: Colors.transparent,
        title: Row(
          children: [
            Text('Fit',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Salt',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD9D9D9))),
            Text('&',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Salt',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFCD535))),
            Text('Fuel',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Salt',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD9D9D9))),
          ],
        ),
        // leading: IconButton(
        //   icon: Container(
        //       margin: const EdgeInsets.only(left: 7),
        //       child: Image.asset('assets/Icons/hamburger.png', color: Theme.of(context).appBarTheme.iconTheme?.color)),
        //   hoverColor: Colors.transparent,
        //   highlightColor: Colors.transparent,
        //   onPressed: () {
        //     scaffold.currentState?.openDrawer();
        //   },
        // ),
        // leadingWidth: 47,
      ),
    ),
  );
}
