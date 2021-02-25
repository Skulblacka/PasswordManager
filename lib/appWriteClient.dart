import 'package:appwrite/appwrite.dart';

class AppWriteClient {
  Client client = Client();

    Future<void> test() async {
    client
            .setEndpoint("https://localhost/v1") // Your Appwrite Endpoint
            .setProject('602d81c0aa024') // Your project ID
            .setSelfSigned() // Remove in production
        ;

    // Register Useripconmfig
    Account account = Account(client);
    
//     Database database = Database(client);
//
//
//
//    Future f = database.listDocuments(collectionId: "602d81cf311c1");
// print(f);
//    f.then((value) => print(value));

    Response user = await account.create(
        email: 'me@appwrite.io', password: 'password', name: 'My Name');
  }


}
