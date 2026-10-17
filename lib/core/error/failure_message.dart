import 'package:flutter/widgets.dart';
import 'package:rickandmorty/core/error/failure.dart';
import 'package:rickandmorty/l10n/l10n.dart';

String failureMessage(BuildContext context, Failure failure) {
  final l10n = context.l10n;
  return switch (failure) {
    NetworkFailure() => l10n.errorNetwork,
    ServerFailure() => l10n.errorServer,
    NotFoundFailure() => l10n.errorNotFound,
    UnknownFailure() => l10n.errorUnknown,
  };
}
