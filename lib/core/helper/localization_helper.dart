import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get appTitle => _getLocalizedValue('appTitle');
  String get randomUsers => _getLocalizedValue('randomUsers');
  String get savedUsers => _getLocalizedValue('savedUsers');
  String get userDetails => _getLocalizedValue('userDetails');
  String get search => _getLocalizedValue('search');
  String get saved => _getLocalizedValue('saved');
  String get searchPlaceholder => _getLocalizedValue('searchPlaceholder');
  String usersFound(int count) => _getLocalizedValue('usersFound', {'count': count});
  String savedUsersFound(int count) => _getLocalizedValue('savedUsersFound', {'count': count});
  String get fetchingMoreUsers => _getLocalizedValue('fetchingMoreUsers');
  String get error => _getLocalizedValue('error');
  String get tryAgain => _getLocalizedValue('tryAgain');
  String get noUsersSaved => _getLocalizedValue('noUsersSaved');
  String get userNotFound => _getLocalizedValue('userNotFound');
  String get back => _getLocalizedValue('back');
  String get remove => _getLocalizedValue('remove');
  String get save => _getLocalizedValue('save');
  String get removeFromSaved => _getLocalizedValue('removeFromSaved');
  String get saveUser => _getLocalizedValue('saveUser');
  String get userRemovedSuccess => _getLocalizedValue('userRemovedSuccess');
  String get userSavedSuccess => _getLocalizedValue('userSavedSuccess');
  String get userAlreadySaved => _getLocalizedValue('userAlreadySaved');
  String get confirmDelete => _getLocalizedValue('confirmDelete');
  String get confirmDeleteAllMessage => _getLocalizedValue('confirmDeleteAllMessage');
  String get cancel => _getLocalizedValue('cancel');
  String get delete => _getLocalizedValue('delete');
  String get removeUser => _getLocalizedValue('removeUser');
  String get confirmRemoveUserMessage => _getLocalizedValue('confirmRemoveUserMessage');
  String get personalInfo => _getLocalizedValue('personalInfo');
  String get location => _getLocalizedValue('location');
  String get login => _getLocalizedValue('login');
  String get dateOfBirth => _getLocalizedValue('dateOfBirth');
  String get registered => _getLocalizedValue('registered');
  String get identification => _getLocalizedValue('identification');
  String get pictures => _getLocalizedValue('pictures');
  String get gender => _getLocalizedValue('gender');
  String get phone => _getLocalizedValue('phone');
  String get cell => _getLocalizedValue('cell');
  String get nationality => _getLocalizedValue('nationality');
  String get address => _getLocalizedValue('address');
  String get city => _getLocalizedValue('city');
  String get state => _getLocalizedValue('state');
  String get country => _getLocalizedValue('country');
  String get postcode => _getLocalizedValue('postcode');
  String get coordinates => _getLocalizedValue('coordinates');
  String get timezone => _getLocalizedValue('timezone');
  String get uuid => _getLocalizedValue('uuid');
  String get username => _getLocalizedValue('username');
  String get password => _getLocalizedValue('password');
  String get salt => _getLocalizedValue('salt');
  String get md5 => _getLocalizedValue('md5');
  String get sha1 => _getLocalizedValue('sha1');
  String get sha256 => _getLocalizedValue('sha256');
  String get date => _getLocalizedValue('date');
  String get age => _getLocalizedValue('age');
  String years(int count) => _getLocalizedValue('years', {'count': count});
  String get registrationDate => _getLocalizedValue('registrationDate');
  String get registrationTime => _getLocalizedValue('registrationTime');
  String get type => _getLocalizedValue('type');
  String get value => _getLocalizedValue('value');
  String get large => _getLocalizedValue('large');
  String get medium => _getLocalizedValue('medium');
  String get thumbnail => _getLocalizedValue('thumbnail');
  String get selectLanguage => _getLocalizedValue('selectLanguage');
  String get portuguese => _getLocalizedValue('portuguese');
  String get english => _getLocalizedValue('english');
  String get spanish => _getLocalizedValue('spanish');

  String _getLocalizedValue(String key, [Map<String, dynamic>? params]) {
    final translations = _getTranslations();
    String value = translations[key] ?? key;

    if (params != null) {
      params.forEach((paramKey, paramValue) {
        if (paramKey == 'count') {
          value = _handlePlural(value, paramValue as int);
        } else {
          value = value.replaceAll('{$paramKey}', paramValue.toString());
        }
      });
    }

    return value;
  }

  String _handlePlural(String template, int count) {
    if (template.contains('{count, plural')) {
      if (count == 0 && template.contains('=0{')) {
        final match = RegExp(r'=0\{([^}]+)\}').firstMatch(template);
        if (match != null) return match.group(1)!.trim();
      } else if (count == 1 && template.contains('=1{')) {
        final match = RegExp(r'=1\{([^}]+)\}').firstMatch(template);
        if (match != null) return match.group(1)!.replaceAll('{count}', count.toString()).trim();
      } else if (template.contains('other{')) {
        final match = RegExp(r'other\{([^}]+)\}').firstMatch(template);
        if (match != null) return match.group(1)!.replaceAll('{count}', count.toString()).trim();
      }
    } else {
      return template.replaceAll('{count}', count.toString());
    }
    return template;
  }

  Map<String, String> _getTranslations() {
    switch (locale.languageCode) {
      case 'pt':
        return _ptTranslations;
      case 'en':
        return _enTranslations;
      case 'es':
        return _esTranslations;
      default:
        return _ptTranslations;
    }
  }

  static const Map<String, String> _ptTranslations = {
    'appTitle': 'Desafio Bus2',
    'randomUsers': 'Usuários Aleatórios',
    'savedUsers': 'Usuários Salvos',
    'userDetails': 'Detalhes do Usuário',
    'search': 'Buscar',
    'saved': 'Salvos',
    'searchPlaceholder': 'Buscar por nome...',
    'usersFound': '{count, plural, =0{Nenhum usuário cadastrado localmente} =1{1 usuário cadastrado localmente} other{{count} usuários cadastrados localmente}}',
    'savedUsersFound': '{count, plural, =0{Nenhum usuário salvo localmente} =1{1 usuário salvo localmente} other{{count} usuários salvos localmente}}',
    'fetchingMoreUsers': 'Buscando mais usuários...',
    'error': 'Erro',
    'tryAgain': 'Tentar novamente',
    'noUsersSaved': 'Nenhum usuário salvo',
    'userNotFound': 'Usuário não encontrado',
    'back': 'Voltar',
    'remove': 'Remover',
    'save': 'Salvar',
    'removeFromSaved': 'Remover dos Salvos',
    'saveUser': 'Salvar Usuário',
    'userRemovedSuccess': 'Usuário removido com sucesso!',
    'userSavedSuccess': 'Usuário salvo com sucesso!',
    'userAlreadySaved': 'Este usuário já está salvo localmente',
    'confirmDelete': 'Confirmar exclusão',
    'confirmDeleteAllMessage': 'Tem certeza que deseja excluir todos os usuários? Esta ação não pode ser desfeita.',
    'cancel': 'Cancelar',
    'delete': 'Excluir',
    'removeUser': 'Remover usuário',
    'confirmRemoveUserMessage': 'Tem certeza que deseja remover este usuário dos salvos?',
    'personalInfo': 'Informações Pessoais',
    'location': 'Localização',
    'login': 'Login',
    'dateOfBirth': 'Data de Nascimento',
    'registered': 'Registro',
    'identification': 'Identificação',
    'pictures': 'Fotos',
    'gender': 'Gênero',
    'phone': 'Telefone',
    'cell': 'Celular',
    'nationality': 'Nacionalidade',
    'address': 'Endereço',
    'city': 'Cidade',
    'state': 'Estado',
    'country': 'País',
    'postcode': 'CEP',
    'coordinates': 'Coordenadas',
    'timezone': 'Fuso Horário',
    'uuid': 'UUID',
    'username': 'Usuário',
    'password': 'Senha',
    'salt': 'Salt',
    'md5': 'MD5',
    'sha1': 'SHA1',
    'sha256': 'SHA256',
    'date': 'Data',
    'age': 'Idade',
    'years': '{count, plural, =1{ano} other{anos}}',
    'registrationDate': 'Data de Registro',
    'registrationTime': 'Tempo de Registro',
    'type': 'Tipo',
    'value': 'Valor',
    'large': 'Grande',
    'medium': 'Média',
    'thumbnail': 'Miniatura',
    'selectLanguage': 'Selecionar Idioma',
    'portuguese': 'Português',
    'english': 'Inglês',
    'spanish': 'Espanhol',
  };

  static const Map<String, String> _enTranslations = {
    'appTitle': 'Bus2 Challenge',
    'randomUsers': 'Random Users',
    'savedUsers': 'Saved Users',
    'userDetails': 'User Details',
    'search': 'Search',
    'saved': 'Saved',
    'searchPlaceholder': 'Search by name...',
    'usersFound': '{count, plural, =0{No users registered locally} =1{1 user registered locally} other{{count} users registered locally}}',
    'savedUsersFound': '{count, plural, =0{No users saved locally} =1{1 user saved locally} other{{count} users saved locally}}',
    'fetchingMoreUsers': 'Fetching more users...',
    'error': 'Error',
    'tryAgain': 'Try again',
    'noUsersSaved': 'No users saved',
    'userNotFound': 'User not found',
    'back': 'Back',
    'remove': 'Remove',
    'save': 'Save',
    'removeFromSaved': 'Remove from Saved',
    'saveUser': 'Save User',
    'userRemovedSuccess': 'User removed successfully!',
    'userSavedSuccess': 'User saved successfully!',
    'userAlreadySaved': 'This user is already saved locally',
    'confirmDelete': 'Confirm deletion',
    'confirmDeleteAllMessage': 'Are you sure you want to delete all users? This action cannot be undone.',
    'cancel': 'Cancel',
    'delete': 'Delete',
    'removeUser': 'Remove user',
    'confirmRemoveUserMessage': 'Are you sure you want to remove this user from saved?',
    'personalInfo': 'Personal Information',
    'location': 'Location',
    'login': 'Login',
    'dateOfBirth': 'Date of Birth',
    'registered': 'Registered',
    'identification': 'Identification',
    'pictures': 'Pictures',
    'gender': 'Gender',
    'phone': 'Phone',
    'cell': 'Cell',
    'nationality': 'Nationality',
    'address': 'Address',
    'city': 'City',
    'state': 'State',
    'country': 'Country',
    'postcode': 'Postcode',
    'coordinates': 'Coordinates',
    'timezone': 'Timezone',
    'uuid': 'UUID',
    'username': 'Username',
    'password': 'Password',
    'salt': 'Salt',
    'md5': 'MD5',
    'sha1': 'SHA1',
    'sha256': 'SHA256',
    'date': 'Date',
    'age': 'Age',
    'years': '{count, plural, =1{year} other{years}}',
    'registrationDate': 'Registration Date',
    'registrationTime': 'Registration Time',
    'type': 'Type',
    'value': 'Value',
    'large': 'Large',
    'medium': 'Medium',
    'thumbnail': 'Thumbnail',
    'selectLanguage': 'Select Language',
    'portuguese': 'Portuguese',
    'english': 'English',
    'spanish': 'Spanish',
  };

  static const Map<String, String> _esTranslations = {
    'appTitle': 'Desafío Bus2',
    'randomUsers': 'Usuarios Aleatorios',
    'savedUsers': 'Usuarios Guardados',
    'userDetails': 'Detalles del Usuario',
    'search': 'Buscar',
    'saved': 'Guardados',
    'searchPlaceholder': 'Buscar por nombre...',
    'usersFound': '{count, plural, =0{Ningún usuario registrado localmente} =1{1 usuario registrado localmente} other{{count} usuarios registrados localmente}}',
    'savedUsersFound': '{count, plural, =0{Ningún usuario guardado localmente} =1{1 usuario guardado localmente} other{{count} usuarios guardados localmente}}',
    'fetchingMoreUsers': 'Buscando más usuarios...',
    'error': 'Error',
    'tryAgain': 'Intentar de nuevo',
    'noUsersSaved': 'Ningún usuario guardado',
    'userNotFound': 'Usuario no encontrado',
    'back': 'Volver',
    'remove': 'Eliminar',
    'save': 'Guardar',
    'removeFromSaved': 'Eliminar de Guardados',
    'saveUser': 'Guardar Usuario',
    'userRemovedSuccess': '¡Usuario eliminado con éxito!',
    'userSavedSuccess': '¡Usuario guardado con éxito!',
    'userAlreadySaved': 'Este usuario ya está guardado localmente',
    'confirmDelete': 'Confirmar eliminación',
    'confirmDeleteAllMessage': '¿Está seguro de que desea eliminar todos los usuarios? Esta acción no se puede deshacer.',
    'cancel': 'Cancelar',
    'delete': 'Eliminar',
    'removeUser': 'Eliminar usuario',
    'confirmRemoveUserMessage': '¿Está seguro de que desea eliminar este usuario de guardados?',
    'personalInfo': 'Información Personal',
    'location': 'Ubicación',
    'login': 'Inicio de Sesión',
    'dateOfBirth': 'Fecha de Nacimiento',
    'registered': 'Registrado',
    'identification': 'Identificación',
    'pictures': 'Fotos',
    'gender': 'Género',
    'phone': 'Teléfono',
    'cell': 'Celular',
    'nationality': 'Nacionalidad',
    'address': 'Dirección',
    'city': 'Ciudad',
    'state': 'Estado',
    'country': 'País',
    'postcode': 'Código Postal',
    'coordinates': 'Coordenadas',
    'timezone': 'Zona Horaria',
    'uuid': 'UUID',
    'username': 'Usuario',
    'password': 'Contraseña',
    'salt': 'Salt',
    'md5': 'MD5',
    'sha1': 'SHA1',
    'sha256': 'SHA256',
    'date': 'Fecha',
    'age': 'Edad',
    'years': '{count, plural, =1{año} other{años}}',
    'registrationDate': 'Fecha de Registro',
    'registrationTime': 'Tiempo de Registro',
    'type': 'Tipo',
    'value': 'Valor',
    'large': 'Grande',
    'medium': 'Mediana',
    'thumbnail': 'Miniatura',
    'selectLanguage': 'Seleccionar Idioma',
    'portuguese': 'Portugués',
    'english': 'Inglés',
    'spanish': 'Español',
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['pt', 'en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
