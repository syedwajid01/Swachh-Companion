import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:swachh_companion/ui/views/home/home_view.dart';

@StackedApp(
  routes: [MaterialRoute(page: HomeView, initial: true)],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
  ],  
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
