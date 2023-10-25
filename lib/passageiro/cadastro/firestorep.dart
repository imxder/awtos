import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final CollectionReference passageiros = 
    FirebaseFirestore.instance.collection('passageiros');


  // CREATE

  Future<void> addPassageiro(String nome,String email, String senha, String address) {
    return passageiros.add({
      'nome': nome,
      'email': email,
      'senha': senha,
      'address': address,
      'timestamp': Timestamp.now(),
    }); 
  }
  
  // READ
  
  Stream<QuerySnapshot> getPassageirosStream(){
    final passageirosStream = 
      passageiros.orderBy('timestamp', descending: true).snapshots();

    return passageirosStream;
  }

  // UPDATE
  
  Future<void> updatePassageiro(String docID, String newAddress) {
    return passageiros.doc(docID).update({
      
      'address': newAddress,
      'timestamp': Timestamp.now(),
    }); 
  }

  Future<void> updatePassageiro2(String docID, String novoNome, String novoEmail, String novaSenha, String novoAddress) {
    return passageiros.doc(docID).update({
      'nome': novoNome,
      'email': novoEmail,
      'senha': novaSenha,
      'address': novoAddress,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE

  Future<void> deletePassageiro(String docID) {
    return passageiros.doc(docID).delete();
  }




}