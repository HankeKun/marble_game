// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:marble_game/services/database.dart' as _i5;
import 'package:marble_game/services/routing.dart' as _i3;
import 'package:marble_game/services/show_snackbar.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.Routing>(_i3.Routing());
    gh.singleton<_i4.ShowSnackbar>(_i4.ShowSnackbar());
    gh.singletonAsync<_i5.Database>(
        () => _i5.Database.create(gh<_i4.ShowSnackbar>()));
    return this;
  }
}
