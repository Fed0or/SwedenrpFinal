import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class StreamerDetail extends StatefulWidget {
  final Streamer streamer;
  final Function onPress;

  const StreamerDetail({Key? key, required this.streamer, required this.onPress}) : super(key: key);

  @override
  _StreamerDetailState createState() => _StreamerDetailState();
}

class _StreamerDetailState extends State<StreamerDetail> {
  final _controller = WebviewController();
  bool _isWebViewReady = false;
  bool _isGlowing = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _isGlowing = !_isGlowing;
      });
    });
  }

  Future<void> initPlatformState() async {
    if (widget.streamer.name == "GhostAlby 👻") {
      await _controller.initialize();
      await _controller.loadUrl('https://kick.com/ghostalby145');
      if (!mounted) return;
      setState(() {
        _isWebViewReady = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isGhostAlby = widget.streamer.name == "GhostAlby 👻";

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        title: Text(widget.streamer.name),
        backgroundColor: kSecondaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => widget.onPress(),
        ),
      ),
      body: Column(
        children: [
          if (isGhostAlby && _isWebViewReady)
            Expanded(child: Webview(_controller))
          else
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.streamer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isGhostAlby)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                        child: Text(
                          'LIVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "${widget.streamer.visningar} visningar",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(height: 16),
                Text(
                  widget.streamer.info,
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