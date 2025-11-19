import 'package:flutter/material.dart';
import '../../models/Pet.dart';

class CardPet extends StatefulWidget {
  final Pet pet;
  const CardPet({Key? key, required this.pet}) : super(key: key);

  @override
  State<CardPet> createState() => _CardPetState();
}

class _CardPetState extends State<CardPet> {
  Pet get pet => widget.pet;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias, // Para arredondar a imagem junto com o card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Estica os filhos
        children: [
          // Seção da Imagem
          Container(
            height: 200,
            child: Image.network(
              pet.photoUrl,
              fit: BoxFit.cover,
              // O 'errorBuilder' é a parte chave para o fallback
              errorBuilder: (context, error, stackTrace) {
                // Se houver erro ao carregar a 'photoUrl', usa o 'localAssetAlt'
                return Image.asset(
                  pet.localAssetAlt,
                  fit: BoxFit.cover,
                );
              },
              // O 'loadingBuilder' mostra um progresso enquanto carrega
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child; // Imagem carregada
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),

          // Seção de Informações
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildInfoRow(context, Icons.pets, 'Temperamento', pet.temperament),
                const SizedBox(height: 6),
                _buildInfoRow(context, Icons.straighten, 'Porte', pet.size),
              ],
            ),
          ),

          // Seção do Botão
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "/detailsPage", arguments: widget.pet);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Quero adotar!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para criar as linhas de informação
  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Theme.of(context).textTheme.bodySmall?.color),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
