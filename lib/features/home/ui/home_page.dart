import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/features/home/bloc/tracks_bloc.dart';
import 'package:fm_music/features/home/bloc/tracks_event.dart';
import 'package:fm_music/features/home/bloc/tracks_state.dart';
import 'package:fm_music/features/home/ui/empty_screen_widget.dart';
import 'package:fm_music/features/home/ui/tracks_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchTextController;

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
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      hintText: 'Search for music...',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: BlocConsumer<TracksBloc, TracksState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DisplayTracksState) {
                return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: state.tracks.isEmpty
                        ? const EmptyScreenWidget(
                            description:
                                'There are no records for search criteria')
                        : TracksScreenWidget(tracks: state.tracks));
              } else {
                return const EmptyScreenWidget();
              }
            }));
  }

  void onSearchInputChanged() async {
    context
        .read<TracksBloc>()
        .add(SearchEvent(searchValue: _searchTextController.text));
  }
}
