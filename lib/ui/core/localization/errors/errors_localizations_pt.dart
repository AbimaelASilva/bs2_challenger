// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'errors_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class ErrorsLocalizationsPt extends ErrorsLocalizations {
  ErrorsLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get defaultError => 'Não conseguimos processar sua solicitação. Verifique a internet, e tente novamente!';

  @override
  String get nameIsTooShort => 'O texto informado é muito curto';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get passwordsAreDifferent => 'As senhas são diferentes';

  @override
  String get invalidDate => 'Data inválida';

  @override
  String get errorRegisterUser => 'Não foi possível cadastrar o usuário. Verifique os dados e a internet e tente novamente';

  @override
  String get errorLogin => 'Não foi possível fazer login. Verifique os dados e a internet e tente novamente';

  @override
  String get erroLoadingMatches => 'Não foi possível carregar as partidas. Verifique a internet';

  @override
  String get loadingGroup => 'Não foi possível carregar os grupos. Verifique a internet';

  @override
  String get registerGroup => 'Não foi possível criar o grupo. Verifique os dados, internet e tente novamente';

  @override
  String get updateGroup => 'Não foi possível atualizar o grupo. Verifique os dados e a internet e tente novamente';

  @override
  String get registerAthlete => 'Não foi possível cadastrar o atleta. Verifique os dados, internet e tente novamente';

  @override
  String get updateAthlete => 'Não foi possível atualizar o atleta. Verifique os dados, internet e tente novamente';

  @override
  String get addRemoveAdmin => 'Não foi possível atualizar o admin. Verifique os dados, internet e tente novamente';

  @override
  String get code204 => 'Nenhum valor retornado do servidor';

  @override
  String get code304 => 'Nenhum valor modificado no servidor';

  @override
  String get code400 => 'O servidor não pode processar a solicitação, reveja os campos e tente novamente.';

  @override
  String get code401 => 'Você precisa renovar as credenciais, deslogue e logue novamente!';

  @override
  String get code403 => 'O servidor recusou a solicitação';

  @override
  String get code404 => 'O servidor não conseguiu encontrar resultados a partir dos dados solicitados.';

  @override
  String get code405 => 'Método desabilitado';

  @override
  String get code406 => 'O servidor é incapaz de retornar os conteúdos solicitados';

  @override
  String get code500 => 'O servidor encontrou uma condição inesperada, se o problema persistir contate o suporte';

  @override
  String get loadPositions => 'Não foi possível caregar a lista de posições. Verifique ainternet e tente novamente';

  @override
  String get errorSendingSms => 'Erro ao solicitar SMS para reset de senha';

  @override
  String get errorConfirmSms => 'Erro ao confirmar SMS para reset de senha';

  @override
  String get errorPasswordReset => 'Erro ao solicitar reset de senha';

  @override
  String get errorUpdateData => 'Erro ao atualizar os dados';
}
