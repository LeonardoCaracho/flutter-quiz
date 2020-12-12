import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/api.dart';
import 'core/services/quiz_service.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, QuizService>(
    update: (_, api, __) => QuizService(api: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
