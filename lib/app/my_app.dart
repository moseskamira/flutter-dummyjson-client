import 'package:dummy_json_api/app/router/app_router.dart';
import 'package:dummy_json_api/app/themes/app_theme.dart';
import 'package:dummy_json_api/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dummy_json_api/features/auth/logic/auth_cubit.dart';
import 'package:dummy_json_api/features/carts/data/repositories/cart_repository_impl.dart';
import 'package:dummy_json_api/features/carts/logic/cart_cubit.dart';
import 'package:dummy_json_api/features/posts/data/repositories/post_repository_impl.dart';
import 'package:dummy_json_api/features/posts/logic/post_cubit.dart';
import 'package:dummy_json_api/features/products/data/repositories/product_repository_impl.dart';
import 'package:dummy_json_api/features/products/logic/product_cubit.dart';
import 'package:dummy_json_api/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:dummy_json_api/features/profile/logic/profile_cubit.dart';
import 'package:dummy_json_api/features/users/data/repositories/user_repository_impl.dart';
import 'package:dummy_json_api/features/users/logic/user_cubit.dart';
import 'package:dummy_json_api/shared/providers/app_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositories
        RepositoryProvider<AuthRepositoryImpl>(
          create: (_) => AuthRepositoryImpl(),
        ),
        RepositoryProvider<ProfileRepositoryImpl>(
          create: (_) => ProfileRepositoryImpl(),
        ),
        RepositoryProvider<UserRepositoryImpl>(
          create: (_) => UserRepositoryImpl(),
        ),
        RepositoryProvider<ProductRepositoryImpl>(
          create: (_) => ProductRepositoryImpl(),
        ),
        RepositoryProvider<CartRepositoryImpl>(
          create: (_) => CartRepositoryImpl(),
        ),
        RepositoryProvider<PostRepositoryImpl>(
          create: (_) => PostRepositoryImpl(),
        ),
        // Change Notifier
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        // Blocs
        BlocProvider<AuthCubit>(
          lazy: true,
          create: (context) => AuthCubit(context.read<AuthRepositoryImpl>()),
        ),
        BlocProvider<ProfileCubit>(
          lazy: true,
          create: (context) =>
              ProfileCubit(context.read<ProfileRepositoryImpl>()),
        ),
        BlocProvider<UserCubit>(
          lazy: true,
          create: (context) => UserCubit(context.read<UserRepositoryImpl>()),
        ),
        BlocProvider<ProductCubit>(
          lazy: true,
          create: (context) =>
              ProductCubit(context.read<ProductRepositoryImpl>()),
        ),
        BlocProvider<CartCubit>(
          lazy: true,
          create: (context) => CartCubit(context.read<CartRepositoryImpl>()),
        ),
        BlocProvider<PostCubit>(
          lazy: true,
          create: (context) => PostCubit(context.read<PostRepositoryImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'DummyJson Demo',
        theme: AppTheme.lightTheme(),
        themeMode: ThemeMode.light,
        routerConfig: appRouter,
      ),
    );
  }
}
