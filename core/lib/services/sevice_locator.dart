part of core.services;

GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  // service
  serviceLocator.registerLazySingleton<LoginService>(() => LoginService());
  serviceLocator.registerLazySingleton<TodoService>(() => TodoService());
  serviceLocator
      .registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  serviceLocator
      .registerLazySingleton<TodoRepository>(() => TodoRepositoryImp());
  serviceLocator.registerFactory<Todo>(() => Todo());
  // serviceLocator
  //     .registerFactory<FavouriteViewModel>(() => FavouriteViewModel());
}
