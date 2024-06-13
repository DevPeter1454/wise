import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  bool _isAmountVisible = false;

  bool get isAmountVisible => _isAmountVisible;

  void setIsLoading(bool value) {
    _isLoading = value;
    rebuildUi();
    notifyListeners();
  }

  void setIsAmountVisible() {
    _isAmountVisible = !_isAmountVisible;
    notifyListeners();
  }

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setIsLoading(false);
    });
  }
}
