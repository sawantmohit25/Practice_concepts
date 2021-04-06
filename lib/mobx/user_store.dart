import 'package:mobx/mobx.dart';
import 'package:sembast_app/model_class/usermodel.dart';
import 'package:sembast_app/mobx/network_service.dart';

/// Here we create observable that respond to changes in UI and give desired actions to those observables to render them in observer widget in UI.

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<UserModel>> userListFuture;

  @action
  Future fetchUsers() => userListFuture = ObservableFuture(httpClient
      .getData('https://jsonplaceholder.typicode.com/posts')
      .then((users) => users));

  void getTheUsers() {
    fetchUsers();
  }
}
