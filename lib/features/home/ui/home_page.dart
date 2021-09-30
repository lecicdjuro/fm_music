import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/utils/debouncer.dart';
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
  late DebounceTimer _debounceTimer;

  @override
  void initState() {
    super.initState();
    _debounceTimer = DebounceTimer(milliseconds: 500);
    _searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    _debounceTimer.dispose();
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
                  onChanged: (String text) => onSearchInputChanged(text),
                  controller: _searchTextController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => onClearSearchPressed(context),
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
                return const Center(
                    child:
                        CircularProgressIndicator(color: FmColors.primaryDark));
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

  void onClearSearchPressed(BuildContext context) {
    _searchTextController.clear();
    onSearchInputChanged(_searchTextController.text);
    FocusScope.of(context).unfocus();
  }

  void onSearchInputChanged(String text) async {
    _debounceTimer.run(
        () => context.read<TracksBloc>().add(SearchEvent(searchValue: text)));
  }
}
