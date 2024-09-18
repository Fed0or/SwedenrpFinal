import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:sweden_roleplay/shared/rounded_label.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class StreamerDetail extends StatefulWidget {
  final Streamer streamer;
  final Function onPress;

  const StreamerDetail({super.key, required this.streamer, required this.onPress});

  @override
  _StreamerDetailState createState() => _StreamerDetailState();
}

class _StreamerDetailState extends State<StreamerDetail> {
  final _controller = WebviewController();
  bool _isWebViewReady = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (widget.streamer.name == "GhostAlby") {
      await _controller.initialize();
      await _controller.loadUrl('https://kick.com/ghostalby145');
      if (!mounted) return;
      setState(() {
        _isWebViewReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isGhostAlby = widget.streamer.name == "GhostAlby";

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (isGhostAlby && _isWebViewReady)
                  Webview(_controller)
                else
                  Image.asset(
                    widget.streamer.imageUrl,
                    fit: BoxFit.cover,
                  ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.onPress();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 36,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                color: Colors.black.withOpacity(0.6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.supervisor_account_rounded,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.streamer.followers,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            if (isGhostAlby)
                              const RoundedLabel(
                                small: true,
                                color: Colors.red,
                                text: "Live",
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ... rest of the widget remains the same
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}