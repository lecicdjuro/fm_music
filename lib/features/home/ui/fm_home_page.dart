import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/networking/model/track.dart';
import 'package:fm_music/networking/requests/track_requests.dart';

class FMHomePage extends StatefulWidget {
  const FMHomePage({Key? key}) : super(key: key);

  @override
  State<FMHomePage> createState() => _FMHomePageState();
}

class _FMHomePageState extends State<FMHomePage> {
  late TextEditingController _searchTextController;
  List<Track> tracks = [];

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController.addListener(onSearchInputChanged);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: FmColors.primaryDark,
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: _searchTextController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchTextController.clear();
                          tracks = [];
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      hintText: 'Search for music...',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: tracks.isEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Welcome to Last.fm',
                        style: FmTextStyles.title(),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Search the anything you want to listen! The more you listen, the better your recommendations will get!',
                        textAlign: TextAlign.center,
                        style: FmTextStyles.body(),
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: tracks.length,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.play_circle_fill),
                          title: Text(
                            tracks.elementAt(index).name,
                            style: FmTextStyles.body(),
                          ),
                          trailing: Text(tracks.elementAt(index).artist));
                    })));
  }

  void onSearchInputChanged() async {
    if (_searchTextController.text.isEmpty) {
      return;
    }
    tracks = await TrackRequests()
        .performTrackSearch(searchTerm: _searchTextController.text);
    setState(() {});
  }
}
