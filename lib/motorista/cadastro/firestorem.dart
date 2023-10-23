import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServiceMotorista{

  final CollectionReference motoristas = 
    FirebaseFirestore.instance.collection('motoristas');


  // CREATE

  Future<void> addMotoristas(String nome,String email, String senha, String address) {
    return motoristas.add({
      'nome': nome,
      'email': email,
      'senha': senha,
      'address': address,
      'timestamp': Timestamp.now(),
    }); 
  }
  
  // READ
  
  Stream<QuerySnapshot> getMotoristasStream(){
    final motoristasStream = 
      motoristas.orderBy('timestamp', descending: true).snapshots();

    return motoristasStream;
  }

  // UPDATE
  
  Future<void> updateMotoristas(String docID, String newAddress) {
    return motoristas.doc(docID).update({
      
      'address': newAddress,
      'timestamp': Timestamp.now(),
    }); 
  }

  Future<void> updateMotoristas2(String docID, String novoNome, String novoEmail, String novaSenha, String novoAddress) {
  return motoristas.doc(docID).update({
    'nome': novoNome,
    'email': novoEmail,
    'senha': novaSenha,
    'address': novoAddress,
    'timestamp': Timestamp.now(),
  });
}

  // DELETE






}