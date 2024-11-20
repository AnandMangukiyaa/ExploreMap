import 'package:flutter/material.dart';
import 'package:flutter_assignment1/application/location/location_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment1/application/permission/permission_cubit.dart';

import '../../application/application_life_cycle/application_life_cycle_cubit.dart';
import '../../injection.dart';
import '../map/map_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PermissionCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<ApplicationLifeCycleCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<LocationCubit>(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Explore Map',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MapPage(),
      ),
    );
  }
}
