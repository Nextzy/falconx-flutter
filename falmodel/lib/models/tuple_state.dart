// Created by Nonthawit on 18/6/2023 AD Lead Flutter at NEXTZY and EXISTING
import 'package:falmodel/lib.dart';

abstract class TupleState<DATA> with EquatableMixin {
  const TupleState(this.status, this.data);

  final FullWidgetState status;
  final DATA data;

  bool get isInitial => status == FullWidgetState.initial;

  bool get isNotInitial => !isInitial;

  bool get isNormal => status == FullWidgetState.normal;

  bool get isNotNormal => !isNormal;

  bool get isLoading => status == FullWidgetState.loading;

  bool get isNotLoading => !isLoading;

  bool get isEmpty => status == FullWidgetState.empty;

  bool get isNotEmpty => !isEmpty;

  bool get isFail => status == FullWidgetState.fail;

  bool get isNotFail => !isFail;

  bool get isSuccess => status == FullWidgetState.success;

  bool get isNotSuccess => !isSuccess;

  R apply<R>(Function2<FullWidgetState, DATA, R> f) => f(status, data);

  mapData<NT2>(Function1<DATA, NT2> f);

  changeStatus(Function1<FullWidgetState, FullWidgetState> f);

  changeToInitialStatus();

  changeToNormalStatus();

  changeToLoadingStatus();

  changeToEmptyStatus();

  changeToSuccessStatus();

  changeToFailStatus();

  copyWith({
    FullWidgetState? status,
    DATA? data,
  });

  @override
  List<Object?> get props => [status, data];

  @override
  bool? get stringify => true;
}
