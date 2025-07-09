#!/bin/bash

# Script para regenerar el código Pigeon
echo "Regenerando código Pigeon..."

# Ejecutar Pigeon
dart run pigeon --input pigeons/calculator_api.dart

echo "¡Código Pigeon regenerado exitosamente!"
