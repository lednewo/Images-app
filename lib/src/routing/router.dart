import 'package:go_router/go_router.dart';
import 'package:images_app/src/routing/routes.dart';
import 'package:images_app/src/ui/base/app_bottom_base.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: Routes.base,
    routes: [
      GoRoute(
        path: Routes.base,
        builder: (context, state) => AppBottomBase(),
      ),
    ],
  );
}
