import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppUnitedKakooli extends StatefulWidget {
  const AppUnitedKakooli({super.key});

  @override
  State<AppUnitedKakooli> createState() => _AppUnitedKakooliState();
}

class _AppUnitedKakooliState extends State<AppUnitedKakooli> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://unitedkakooli.com/")),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    transparentBackground: false,
                    useShouldOverrideUrlLoading: true,
                  ),
                ),
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    setState(() {
                      loading = false;
                    });
                  }
                },
              ),
              if (loading)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text("Loading ...")
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
