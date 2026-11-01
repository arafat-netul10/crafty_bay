import 'package:crafty_bay/core/service/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller() {
  return NetworkCaller(
      headers:() => {
        'content-type': 'application/json',
        //'access-token': 'token'
  });
}

//Uses

// NetworkResponse responsee = await getNetworkCaller().getRequest("");
// if(response.isSuccess){
//
// }
// else{
//response.errorMessage
// }
