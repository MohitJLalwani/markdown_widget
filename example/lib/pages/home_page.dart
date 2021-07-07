import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../platform_dector/platform_dector.dart';
import 'markdown_page.dart';
import 'edit_markdown_page.dart';

class HomePage extends StatelessWidget {
  final bool isMobile =
      PlatformDetector.isMobile || PlatformDetector.isWebMobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: Text(
                'markdown',
              ),
              backgroundColor: Colors.black,
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              child: Text('README',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return MarkdownPage(
                    assetsPath: 'assets/demo_en.md',
                  );
                }));
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              child: Text('Markdown Editor',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              onPressed: () {
                rootBundle.loadString('assets/editor.md').then((data) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return EditMarkdownPage(
                      initialData: data,
                    );
                  }));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
