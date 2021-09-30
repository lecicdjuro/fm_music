import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_dimens.dart';
import 'package:fm_music/features/common/ui/empty_screen_widget.dart';
import 'package:fm_music/features/tracks/bloc/tracks_bloc.dart';
import 'package:fm_music/features/tracks/bloc/tracks_event.dart';
import 'package:fm_music/features/tracks/bloc/tracks_state.dart';
import 'package:fm_music/features/tracks/ui/tracks_list_widget.dart';
import 'package:fm_music/utils/debouncer.dart';

class SearchTracksPage extends StatefulWidget {
  const SearchTracksPage({Key? key}) : super(key: key);

  @override
  State<SearchTracksPage> createState() => _SearchTracksPageState();
}

class _SearchTracksPageState extends State<SearchTracksPage> {
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
              height: FmDimens.searchAppBarHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(FmDimens.searchAppBarHeight)),
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
                      hintText: AppLocalizations.of(context)!.searchInputHint,
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
                        horizontal: FmDimens.largePadding,
                        vertical: FmDimens.enormousPadding),
                    child: state.tracks.isEmpty
                        ? EmptyScreenWidget(
                            description:
                                AppLocalizations.of(context)!.noRecords)
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
