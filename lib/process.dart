import 'package:firebase_database/firebase_database.dart';

class Process {
  String _referenceNumber;
  String _amount;
  String _clientAddress;
  String _clientName;
  String _csr;
  String _nameOfOffice;
  String _officeAddress;
  String _transactionDate;
  String _transactionType;
  String _validity;

  Process(this._referenceNumber, this._amount, this._clientAddress,
      this._clientName, this._csr, this._nameOfOffice, this._officeAddress,
      this._transactionDate, this._transactionType, this._validity);

  Process.map(dynamic obj) {
    this._referenceNumber = obj['referenceNumber'];
    this._amount = obj['amount'];
    this._clientAddress = obj['clientAddress'];
    this._clientName = obj['clientName'];
    this._csr = obj['csr'];
    this._nameOfOffice = obj['nameOfOffice'];
    this._officeAddress = obj['officeAddress'];
    this._transactionDate = obj['transactionDate'];
    this._transactionType = obj['transactionType'];
    this._validity = obj['validity'];
  }

  String get referenceNumber => _referenceNumber;
  String get amount => _amount;
  String get clientAddress => _clientAddress;
  String get clientName => _clientName;
  String get csr => _csr;
  String get nameOfOffice => _nameOfOffice;
  String get officeAddress => _officeAddress;
  String get transactionDate => _transactionDate;
  String get transactionType => _transactionType;
  String get validity => _validity;

  Process.fromSnapshot(DataSnapshot snapshot) {
    _referenceNumber = snapshot.key;
    _amount = snapshot.value['amount'];
    _clientAddress = snapshot.value['clientAddress'];
    _clientName = snapshot.value['clientName'];
    _csr = snapshot.value['csr'];
    _nameOfOffice = snapshot.value['nameOfOffice'];
    _officeAddress = snapshot.value['officeAddress'];
    _transactionDate = snapshot.value['transactionDate'];
    _transactionType = snapshot.value['transactionType'];
    _validity = snapshot.value['validity'];
  }
}