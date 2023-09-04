import 'package:bookly_app/Features/home/data/data_sources/home_local_data_sources.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly_app/network/api_base_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../../../Features/search/data/repos/search_repo_Imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiBaseHelper>(
    ApiBaseHelper(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
      getIt.get<ApiBaseHelper>()
      ),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(
          getIt.get<ApiBaseHelper>()
      )
  );



}
