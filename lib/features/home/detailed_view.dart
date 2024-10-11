import 'package:flutter/material.dart';
import 'package:taaza_khabar/palette.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailedView extends StatefulWidget {
  final String url;
  const DetailedView({super.key, required this.url});

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.blueColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
