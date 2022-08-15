class GetComicsException implements Exception {
  final String message;

  GetComicsException(this.message);

  @override
  String toString() => 'GetComicsException(message : $message)';
}

class GetCharactersException implements Exception {
  final String message;

  GetCharactersException(this.message);

  @override
  String toString() => 'GetCharactersException(message : $message)';
}

class GetCreatorsException implements Exception {
  final String message;

  GetCreatorsException(this.message);

  @override
  String toString() => 'GetCreatorsException(message : $message)';
}
