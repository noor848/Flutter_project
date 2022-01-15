import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Weview extends StatelessWidget {

  var url;
  Weview({
    this.url
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Container(

          child: WebView(
            initialUrl: url,
          )



      ),
    );
  }
}
