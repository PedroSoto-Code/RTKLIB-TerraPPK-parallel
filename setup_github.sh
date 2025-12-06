#!/bin/bash

# Script para configurar el nombre del repositorio en GitHub
# RTKLIB-TerraPPK-parallel

echo "======================================"
echo "Configuración de Repositorio GitHub"
echo "======================================"
echo ""
echo "Nombre del repositorio: RTKLIB-TerraPPK-parallel"
echo "Proyecto: TerraPPK"
echo "Desarrollador: Pedro Daniel Soto Sanabria"
echo ""

# Cambiar al directorio del proyecto
cd "$(dirname "$0")"

echo "📋 Configuración actual:"
echo ""

# Verificar si es un repositorio git
if [ -d .git ]; then
    echo "✅ Repositorio Git inicializado"
    
    # Mostrar remote actual
    if git remote -v | grep -q origin; then
        echo ""
        echo "🔗 Remote actual:"
        git remote -v
        echo ""
        read -p "¿Deseas actualizar el remote a RTKLIB-TerraPPK-parallel? (s/n): " response
        if [ "$response" = "s" ] || [ "$response" = "S" ]; then
            git remote set-url origin https://github.com/DanielSotoDs/RTKLIB-TerraPPK-parallel.git
            echo "✅ Remote actualizado"
        fi
    else
        echo "⚠️  No hay remote configurado"
        echo ""
        read -p "Ingresa tu usuario de GitHub (Enter para usar DanielSotoDs): " username
        if [ -z "$username" ]; then username="DanielSotoDs"; fi
        git remote add origin https://github.com/$username/RTKLIB-TerraPPK-parallel.git
        echo "✅ Remote añadido: https://github.com/$username/RTKLIB-TerraPPK-parallel.git"
    fi
else
    echo "❌ No es un repositorio Git"
    echo ""
    read -p "¿Deseas inicializar el repositorio? (s/n): " response
    if [ "$response" = "s" ] || [ "$response" = "S" ]; then
        git init
        echo "✅ Repositorio inicializado"
        echo ""
        read -p "Ingresa tu usuario de GitHub (Enter para usar DanielSotoDs): " username
        if [ -z "$username" ]; then username="DanielSotoDs"; fi
        git remote add origin https://github.com/$username/RTKLIB-TerraPPK-parallel.git
        echo "✅ Remote añadido: https://github.com/$username/RTKLIB-TerraPPK-parallel.git"
    fi
fi

echo ""
echo "======================================"
echo "Configuración completada"
echo "======================================"
echo ""
echo "Próximos pasos:"
echo "1. Crear el repositorio en GitHub:"
echo "   https://github.com/new"
echo "   Nombre: RTKLIB-TerraPPK-parallel"
echo ""
echo "2. Hacer el primer commit:"
echo "   git add ."
echo "   git commit -m 'Initial commit: TerraPPK - RTKLIB 2.5.0 with parallel processing'"
echo ""
echo "3. Push al repositorio:"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. Crear release:"
echo "   git tag -a v2.5.0-parallel-1.0 -m 'Release v1.0'"
echo "   git push origin v2.5.0-parallel-1.0"
echo ""
