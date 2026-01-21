import 'package:bloc/bloc.dart';

part 'saved_viewmodel_state.dart';

class SavedViewModel extends Cubit<SavedViewModelState> {
  SavedViewModel() : super(const SavedViewModelState());
}
