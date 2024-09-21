import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class TikTokWebView extends StatefulWidget {
  final Streamer streamer;

  const TikTokWebView({super.key, required this.streamer});

  @override
  _TikTokWebViewState createState() => _TikTokWebViewState();
}

class _TikTokWebViewState extends State<TikTokWebView> {
  final _controller = WebviewController();
  bool _isWebViewReady = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      await _controller.initialize();
      await _controller.loadUrl(_getTikTokUrl());
      if (!mounted) return;
      setState(() {
        _isWebViewReady = true;
      });
    } on Exception catch (e) {
      print('Error: $e');
    }
  }

  String _getTikTokUrl() {
    // Using the specific livestream URL for abasfeyli
    return 'https://www.tiktok.com/@abasfeyli/live';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: const Text("abasfeyli's TikTok Live"),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isWebViewReady
                ? Webview(_controller)
                : const Center(child: CircularProgressIndicator()),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "abasfeyli",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Live on TikTok",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  "Watch abasfeyli's live TikTok stream",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}