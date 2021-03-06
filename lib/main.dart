import 'package:core/repositories/repository.dart';
import 'package:core/services/services.dart';
import 'package:core/utils/utils.dart';
import 'package:demo_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:demo_bloc/blocs/language/language_bloc.dart';
import 'package:demo_bloc/blocs/theme/theme_bloc.dart';
import 'package:demo_bloc/screens/home/home_screen.dart';
import 'package:demo_bloc/screens/login/login_page.dart';
import 'package:demo_bloc/screens/splash/splash.dart';
import 'package:demo_bloc/screens/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  setUpServiceLocator();
  // final LoginRepository loginRepository = LoginRepositoryImpl();
  // final TodoRepository todoRepository = TodoRepositoryImp();

  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc();
          },
        ),
        BlocProvider<TodoBloc>(
          create: (context) {
            return TodoBloc();
          },
        ),
        BlocProvider<ThemeBloc>(
          create: (context) {
            return ThemeBloc();
          },
        ),
        BlocProvider<LanguageBloc>(
          create: (context) {
            return LanguageBloc();
          },
        ),
      ],
      // child: App(loginRepository: loginRepository)
      child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, language) {
        return App();
      })));
}

class App extends StatelessWidget {
  final LoginRepository loginRepository = serviceLocator<LoginRepository>();
  App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LanguageState languageState = BlocProvider.of<LanguageBloc>(context).state;
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, theme) {
      return MaterialApp(
          theme: theme is ThemeBlue
              ? CustomTheme.appThemeBlue(context)
              : CustomTheme.appThemePure(context),
          debugShowCheckedModeBanner: false,
          locale: languageState.locate,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: [
            Locale('en', 'US'),
            Locale('et', 'EE'),
            Locale('fi', 'FI'),
          ],
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              // ignore: missing_return
              builder: (context, state) {
            if (state is AuthenticationIntialized) {
              return Splash();
            }
            if (state is AuthenticationAuthenticated) {
              return Home();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(
                loginRepository: loginRepository,
              );
            }
            return Text("hihuhuhuhu");
          }));
    });
  }
}
