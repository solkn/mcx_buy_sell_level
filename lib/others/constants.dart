import '../models/data/symbol_data.dart';

class ResponseStatus {
  static const FAILED = 'failed';
  static const SUCCESS = 'success';
}

final symbolsList = [
  SymbolData('CRUDEOIL', 'oil'),
  SymbolData('GOLD', 'gold'),
  SymbolData('SILVER', 'silver'),
  SymbolData('COPPER', 'copper'),
  SymbolData('NICKEL', 'nickel'),
  SymbolData('ZINC', 'zinc'),
  SymbolData('LEAD', 'lead'),
  SymbolData('ALUMINIUM', 'aluminium'),
  SymbolData('NATURAL GAS', 'natural_gas'),
  SymbolData('BANK NIFTY', 'bank_nifty'),
  SymbolData('NIFTY', 'nifty'),
];