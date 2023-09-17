import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:the_dog_myapp/injection.dart' as di;
import 'package:the_dog_myapp/presentation/pages/bloc/the_dog_detail/the_dog_detail_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dogs/the_dogs_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/home/fav_dog_page.dart';
import 'package:the_dog_myapp/presentation/pages/home/home_page.dart';

import 'presentation/pages/bloc/the_dog_fav/the_dog_fav_bloc.dart';
import 'presentation/pages/home/the_dog_detail_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider(create: (_) => di.locator<TheDogsBloc>()),
          BlocProvider(create: (_) => di.locator<TheDogDetailBloc>()),
          BlocProvider(create: (_) => di.locator<TheDogFavBloc>()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          navigatorObservers: [RouteObserver<ModalRoute>()],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(builder: (_) => const HomePage());
              case TheDogDetailPage.ROUTE_NAME:
                final id = settings.arguments as String;
                return MaterialPageRoute(
                    builder: (_) => TheDogDetailPage(id: id));
              case FavDogPage.ROUTE_NAME:
                return MaterialPageRoute(builder: (_) => const FavDogPage());
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ));
  }
}
