import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label, this.onPressed}) : super(key: key);
  
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent, // Color del botón azul
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Radio de esquinas de 5
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white, // Color del texto blanco
          ),
        ),
      ),
    );
  }
}

class PersonalDetailsScreen extends StatefulWidget {
  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  TextEditingController _nameController = TextEditingController(text: 'John');
  TextEditingController _lastNameController = TextEditingController(text: 'Doe');
  TextEditingController _addressController = TextEditingController(text: 'Calle Principal 123');
  TextEditingController _phoneController = TextEditingController(text: '123456789');
  TextEditingController _emailController = TextEditingController(text: 'example@example.com');
  TextEditingController _dobController = TextEditingController(text: '01/01/2000');
  String _selectedGender = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles Personales'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background.jpg"),
            fit: BoxFit.cover, // Ajusta la imagen para cubrir toda el área disponible
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEditableField(
                labelText: 'Nombre',
                controller: _nameController,
              ),
              const SizedBox(height: 24.0),
              _buildEditableField(
                labelText: 'Apellidos',
                controller: _lastNameController,
              ),
              const SizedBox(height: 24.0),
              _buildEditableField(
                labelText: 'Dirección de entrega',
                controller: _addressController,
              ),
              const SizedBox(height: 24.0),
              _buildEditableField(
                labelText: 'Número de teléfono',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24.0),
              _buildEditableField(
                labelText: 'Correo electrónico',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24.0),
              _buildEditableField(
                labelText: 'Fecha de nacimiento',
                controller: _dobController,
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 24.0),
              _buildEditableDropdownField(
                labelText: 'Género',
                initialValue: _selectedGender,
                items: ['Masculino', 'Femenino', 'Otro'],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
              ),
              const SizedBox(height: 100.0),
              CustomButton(
                label: 'Guardar Cambios',
                onPressed: () {
                  // Aquí puedes manejar la lógica para guardar los cambios
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String labelText,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // Cambia la dirección de la sombra 
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white, fontFamily: 'Signika Negative', fontSize: 15),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                keyboardType: keyboardType,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Aquí puedes manejar la edición del campo
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEditableDropdownField({
    required String labelText,
    required String initialValue,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2), // Cambia la dirección de la sombra si es necesario
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButtonFormField<String>(
                value: initialValue,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Aquí puedes manejar la edición del campo
            },
          ),
        ],
      ),
    );
  }
}
