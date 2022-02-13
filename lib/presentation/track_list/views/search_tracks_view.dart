import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_dimens.dart';
import 'package:fm_music/presentation/common/ui/empty_screen_widget.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_bloc.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_event.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_state.dart';
import 'package:fm_music/presentation/track_list/views/keys.dart';
import 'package:fm_music/presentation/track_list/widgets/tracks_list_widget.dart';
import 'package:fm_music/utils/debouncer.dart';

class SearchTracksView extends StatefulWidget {
  const SearchTracksView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SearchTracksViewState();
  }
}

class _SearchTracksViewState extends State<SearchTracksView> {
  late TextEditingController _searchTextController;
  late DebounceTimer _debounceTimer;

  @override
  void initState() {
    super.initState();
    _debounceTimer = DebounceTimer(milliseconds: 400);
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
            key: const Key(TracksKeys.searchAppBarKey),
            backgroundColor: FmColors.primaryDark,
            title: Container(
              height: FmDimens.searchAppBarHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(FmDimens.searchAppBarHeight)),
              child: Center(
                child: TextField(
                  key: const Key(TracksKeys.searchTextInputKey),
                  onChanged: (String text) => onSearchInputChanged(text),
                  controller: _searchTextController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        key: const Key(TracksKeys.clearSearchInputKey),
                        icon: const Icon(Icons.clear),
                        onPressed: () => onClearSearchPressed(),
                      ),
                      hintText: AppLocalizations.of(context)!.searchInputHint,
                      border: InputBorder.none),
                ),
              ),
            )),
        body: BlocBuilder<TracksBloc, TracksState>(
          builder: (_, state) {
            if (state is InitialState) {
              return const EmptyScreenWidget(
                key: Key(TracksKeys.initialScreenKey),
              );
            }
            if (state is LoadingState) {
              return const Center(
                  key: Key(TracksKeys.loadingSearchTrackScreenKey),
                  child:
                      CircularProgressIndicator(color: FmColors.primaryDark));
            } else if (state is DisplayTracksState) {
              return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: FmDimens.largePadding,
                      vertical: FmDimens.enormousPadding),
                  child: state.hasTracks
                      ? TracksScreenWidget(tracks: state.tracks!)
                      : EmptyScreenWidget(
                          key: const Key(TracksKeys.emptyScreenKey),
                          description:
                              AppLocalizations.of(context)!.noRecords));
            } else {
              return const EmptyScreenWidget();
            }
          },
        ));
  }

  void onClearSearchPressed() {
    _searchTextController.clear();
    onSearchInputChanged(_searchTextController.text);
    _closeKeyboard();
  }

  void _closeKeyboard() => FocusScope.of(context).unfocus();

  void onSearchInputChanged(String text) async {
    _debounceTimer.run(
        () => context.read<TracksBloc>().add(SearchEvent(searchValue: text)));
  }
}
