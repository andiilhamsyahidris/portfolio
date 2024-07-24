import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/presentation/base/state_renderer.dart';
import 'package:portfolio/presentation/resources/string_res.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? StringResMain.loadingTitle.tr();

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  String? textButton;
  Function? onCloseDialogFunction;

  ErrorState(this.stateRendererType, this.message,
      {this.textButton, this.onCloseDialogFunction});

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  bool dismissDialog;
  ContentState({this.dismissDialog = false});

  @override
  String getMessage() => Constant.empty;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.contentScreenState;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.emptyScreenState;
}

class SuccessState extends FlowState {
  String message;

  Function onSuccessFunction;

  StateRendererType? stateRendererType;

  SuccessState(this.message, this.onSuccessFunction, {this.stateRendererType});

  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() =>
      stateRendererType ?? StateRendererType.popupSuccess;
}
