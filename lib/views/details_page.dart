import 'package:flutter/material.dart';
import '../models/Pet.dart';

class DetailsPage extends StatefulWidget {
  final Pet pet;
  const DetailsPage({Key? key, required this.pet}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // 1. Variáveis de Estado ficam AQUI (fora do build)
  bool showNetwork = true;

  // A Key deve ser criada apenas uma vez
  final _formKey = GlobalKey<FormState>();

  // Controllers devem ser instanciados aqui
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // 2. Boas práticas: Limpar os controllers quando sair da tela para liberar memória
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Ajustado para padrão visual melhor
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Detalhes do Pet',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // 3. SingleChildScrollView impede erro quando o teclado abre
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'PET em detalhes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            GestureDetector(
              // Agora o setState funciona porque a variável está fora do build
              onTap: () => setState(() => showNetwork = !showNetwork),
              child: Container(
                height: 200,
                width: double.infinity, // Ocupa largura total
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect( // Arredonda as bordas da imagem
                  borderRadius: BorderRadius.circular(12),
                  child: showNetwork
                      ? Image.network(widget.pet.photoUrl, fit: BoxFit.cover)
                      : Image.asset(widget.pet.localAssetAlt, fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Text('Nome: ${widget.pet.name}', style: const TextStyle(fontSize: 16)),
            Text('Porte: ${widget.pet.size}', style: const TextStyle(fontSize: 16)),
            Text('Temperamento: ${widget.pet.temperament}', style: const TextStyle(fontSize: 16)),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // Botão estica
                  children: [
                    const Text(
                      'Ficha de Adoção do Interessado:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    // Campo Nome
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome Completo',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      // Validação básica
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo Email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress, // Teclado de email
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Campo obrigatório';
                        if (!value.contains('@')) return 'Email inválido';
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),

                    // Campo Telefone
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone, // Teclado numérico
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Campo obrigatório';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blueAccent,
                      ),
                      onPressed: () {
                        // Verifica se o formulário está válido antes de enviar
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context,
                              '/tutorPage',
                              arguments: {
                                'name': _nameController.text,
                                'email': _emailController.text,
                                'phone': _phoneController.text,
                                // Opcional: passar o Pet junto se precisar
                                'petName': widget.pet.name,
                              }
                          );
                        }
                      },
                      child: const Text(
                        'Enviar Solicitação',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}