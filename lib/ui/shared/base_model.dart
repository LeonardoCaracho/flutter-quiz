import 'package:flutter/material.dart';
import 'package:provider_arc/core/utils/failure.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  bool _hasError = false;
  bool get hasError => _hasError;

  Failure _error;
  Failure get error => _error;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void setFailure(Failure error) {
    _error = error;
    _hasError = true;
    notifyListeners();
  }
}
