import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class StreamerDetail extends StatefulWidget {
  final Streamer streamer;
  final bool isSpotify;

  const StreamerDetail({
    super.key,
    required this.streamer,
    required this.isSpotify,
  });

  @override
  _StreamerDetailState createState() => _StreamerDetailState();
}

class _StreamerDetailState extends State<StreamerDetail> {
  late WebViewController _controller;
  bool _isWebViewReady = false;
  bool _isGlowing = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _initWebView();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _isGlowing = !_isGlowing;
      });
    });
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _isWebViewReady = true;
            });
          },
          onWebResourceError: (WebResourceError error) {
            print('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(_getUrl()));
  }

  String _getUrl() {
    if (widget.isSpotify) {
      return 'https://open.spotify.com/embed/playlist/4uyL9MiDceXJkCwC35KIKV?utm_source=generator&theme=0';
    } else if (widget.streamer.name == "GhostAlby 👻") {
      return 'https://kick.com/ghostalby145';
    } else {
      return 'https://example.com'; // Default URL if no specific condition is met
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(widget.streamer.name),
        backgroundColor: kSecondaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isWebViewReady
                ? WebViewWidget(controller: _controller)
                : const Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.streamer.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (!widget.isSpotify && widget.streamer.name == "GhostAlby 👻")
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: _isGlowing ? Colors.red.withOpacity(0.8) : Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: _isGlowing ? Colors.red.withOpacity(0.5) : Colors.transparent,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "${widget.streamer.visningar} visningar",
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.streamer.info,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}