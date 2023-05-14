import 'package:bloc/bloc.dart';
import 'package:myapp/pages/contact_view/state/contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitialState());
}
