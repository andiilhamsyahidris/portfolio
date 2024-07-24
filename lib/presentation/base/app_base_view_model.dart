import 'dart:async';

import 'package:portfolio/presentation/base/state_renderer_impl.dart';
import 'package:stacked/stacked.dart';

abstract class AppBaseViewModel extends StreamViewModel {
  @override
  Stream<FlowState> get stream => throw UnimplementedError();
}
