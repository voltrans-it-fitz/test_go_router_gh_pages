import 'package:github_pages_go_router_test/tab.dart';
import 'package:go_router/go_router.dart';

import 'data.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/family/${Families.data[0].id}',
    ),
    GoRoute(
      path: '/family/:fid',
      builder: (context, state) {
        final fid = state.params['fid']!;
        final family = Families.data.firstWhere((f) => f.id == fid,
            orElse: () => throw Exception('family not found: $fid'));

        return FamilyTabsScreen(key: state.pageKey, currentFamily: family);
      },
    ),
  ],
);
