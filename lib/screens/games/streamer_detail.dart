import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';
import 'package:sweden_roleplay/utils/constants.dart';
import 'package:sweden_roleplay/utils/data.dart';

class StreamerDetail extends StatefulWidget {
  final Streamer streamer;
  final Function onPress;

  const StreamerDetail(
      {Key? key, required this.streamer, required this.onPress})
      : super(key: key);

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
            Image.asset(
              widget.streamer.imageUrl,
              fit: BoxFit.cover,
              height: 300,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.streamer.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}