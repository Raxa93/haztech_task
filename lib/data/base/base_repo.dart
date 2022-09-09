
import 'package:untitled/data/services/auth_service.dart';

import '../services/api_service.dart';

abstract class BaseRepo{


  AuthService authService = AuthService();
  ApiService apiService = ApiService();

}