import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ssplugin/ssplugin.dart';

class WebClient extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final String baseUrl;
  final String title;

  WebClient({Key key, this.baseUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listenToChanges();
    return WebviewScaffold(
      primary: true,
      url: this.baseUrl,
      appBar: AppBar(title: Text(this.title), backgroundColor: Colors.pink,),
      headers: null,
      withJavascript: true,
      clearCache: false,
      clearCookies: false,
      enableAppScheme: true,
      userAgent: null,
      withZoom: false,
      withLocalStorage: true,
      scrollBar: true
    );
  }

  void listenToChanges() {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      var parts = url.split("#");
      if (parts.length > 1) {
        Ssplugin.getData(parts[1]).then((response) {
          flutterWebviewPlugin.evalJavascript("window.selfService.notifyData(\"$response\")");
        });
      }
    });

  }
}
