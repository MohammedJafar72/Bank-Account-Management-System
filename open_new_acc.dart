import 'utilities/my_extensions.dart';
import 'utilities/my_mixins.dart';

class OpenNewAccount with Logger {
  String? _accHolderName;
  int? _initialBalance, _accNumber;
  List<int> _allAccNumbers = [];
  bool _accCreationStatus = false;

  OpenNewAccount._initial();

  factory OpenNewAccount(String? accHolderName, String? accNumber, int? initialBalance) {
    if (accHolderName == null || accNumber == null || initialBalance == null) {
      return OpenNewAccount._initial();
    } else if (accHolderName.isNotEmpty && accNumber.isNotEmpty &&initialBalance > 0) {
      try {
        (bool, String) isValidName = accHolderName.isValidName();
        (bool, int) isValidAndAccNumber = accNumber.isValidAccountNumber();
        Logger.log("isValidName: $isValidName, isValidAndAccNumber: $isValidAndAccNumber");

        if (isValidName.$1 && isValidAndAccNumber.$1 && initialBalance > 0) {
          return OpenNewAccount._initializeNewAccount(isValidName.$2, isValidAndAccNumber.$2, initialBalance);
        } else {
          throw "One or more invalid input. name: $accHolderName, accNumber: $accNumber, initialBalance: $initialBalance";
        } 
      } catch (e) {
        rethrow;
      } 
    } else {
        throw "One or more invalid input. name: $accHolderName, accNumber: $accNumber, initialBalance: $initialBalance";
      }
  }
  OpenNewAccount._initializeNewAccount(this._accHolderName, this._accNumber, this._initialBalance) {
    _accCreationStatus = _openNewAccount(this._accHolderName!, this._accNumber!, this._initialBalance!);
  }

  bool _openNewAccount(String accHolderName, int accNumber, int initialBalance) {
    final bool accNoFound = _allAccNumbers.indexOf(accNumber) > -1;
    if (accNoFound) {
      return false;
    }
    _allAccNumbers.add(accNumber);
    return true;
  }

  // Getters
  get getAccCreationStatus => _accCreationStatus ?
    Logger.success("Account $_accNumber opened for $_accHolderName with initial balance $_initialBalance") :
    Logger.error("Account Number $_accNumber already exists");
  List<int> get getAllAccountNumbers => _allAccNumbers;     
}