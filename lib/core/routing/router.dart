import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/portfolio_models.dart';
import '../../views/screens/home_screen.dart';
import '../../views/screens/project_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/project',
      builder: (context, state) {
        final project = state.extra as Project;
        return ProjectScreen(project: project);
      },
    ),
  ],
);
