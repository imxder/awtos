import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class Message {
  final String sender;
  final String text;
  final bool isSender;

  Message({required this.sender, required this.text, required this.isSender});
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [
    Message(sender: 'João', text: 'Olá, tudo bem?', isSender: true),
    Message(sender: 'Maria', text: 'Sim, estou bem. E você?', isSender: false),
    Message(sender: 'João', text: 'Estou ótimo, obrigado!', isSender: true),
    // Adicione mais mensagens conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'AWTOS',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(1, 28, 105, 0.9),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(230, 243, 243, 242),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromRGBO(1, 28, 105, 0.9),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.sms,
                  color: Color.fromRGBO(1, 28, 105, 0.9),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Conversas',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(1, 28, 105, 0.9),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person), // Ícone como avatar
                  ),
                  title: Text(message.sender),
                  subtitle: Text(message.text),
                  trailing: message.isSender
                      ? const Icon(Icons.check) // Ícone de mensagem enviada
                      : null, // Null para mensagens recebidas
                  // Adicione a lógica para abrir a conversa ao clicar na lista
                  onTap: () {
                    // Implemente a ação ao clicar em uma mensagem, se necessário
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

