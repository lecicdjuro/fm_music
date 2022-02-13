import 'package:dio/dio.dart';
import 'package:fm_music/data/data_sources/remote/fm_search_api_service.dart';
import 'package:fm_music/data/repositories/tracks_repository_impl.dart';
import 'package:fm_music/domain/repositories/tracks_repository.dart';
import 'package:fm_music/domain/usecases/get_track_info_usecase.dart';
import 'package:fm_music/domain/usecases/search_tracks_usecase.dart';
import 'package:fm_music/network/dio_client.dart';
import 'package:fm_music/presentation/track_info/bloc/track_info_bloc.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {
  //Networking
  injector.registerLazySingleton<Dio>(() => DioClient().dioInstance);

  _registerRemoteDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerBlocs();
}

void _registerRemoteDataSources() {
  injector.registerLazySingleton<FMSearchApiService>(
      () => FMSearchApiService(injector()));
}

void _registerRepositories() {
  injector.registerLazySingleton<TracksRepository>(
      () => TracksRepositoryImpl(injector()));
}

void _registerUseCases() {
  injector.registerFactory<SearchTracksUseCase>(
      () => SearchTracksUseCase(injector()));
  injector.registerFactory<GetTrackInfoUseCase>(
      () => GetTrackInfoUseCase(injector()));
}

void _registerBlocs() {
  injector.registerFactory<TracksBloc>(
    () => TracksBloc(injector()),
  );
  injector.registerFactory<TrackInfoBloc>(
    () => TrackInfoBloc(injector()),
  );
}
