# Script para organizar documentación antes de publicar en GitHub

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "ORGANIZANDO DOCUMENTACIÓN PARA GITHUB" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Ubicación actual
$rtklib_root = "C:\Users\mival\Desktop\PPKAPP\RTKLIB-2.5.0"

# Verificar que estamos en la ubicación correcta
if (!(Test-Path $rtklib_root)) {
    Write-Host "❌ Error: No se encuentra el directorio RTKLIB-2.5.0" -ForegroundColor Red
    Write-Host "   Ubicación esperada: $rtklib_root" -ForegroundColor Yellow
    exit 1
}

Set-Location $rtklib_root
Write-Host "📁 Directorio actual: $rtklib_root" -ForegroundColor Green
Write-Host ""

# Crear carpeta docs si no existe
Write-Host "📂 Creando carpeta docs..." -ForegroundColor Yellow
if (!(Test-Path "docs")) {
    New-Item -ItemType Directory -Path "docs" | Out-Null
    Write-Host "   ✅ Carpeta docs creada" -ForegroundColor Green
} else {
    Write-Host "   ℹ️  Carpeta docs ya existe" -ForegroundColor Cyan
}
Write-Host ""

# Mover documentación en español a docs/
Write-Host "📝 Moviendo documentación en español a docs/..." -ForegroundColor Yellow

$spanish_docs = @(
    "IMPLEMENTACION_MULTIHILO.md",
    "MODIFICACION_MULTIHILO_RTKLIB.md",
    "EXPLICACION_INDEPENDENCIA_FORWARD_BACKWARD.md"
)

foreach ($doc in $spanish_docs) {
    if (Test-Path $doc) {
        Move-Item -Path $doc -Destination "docs\" -Force
        Write-Host "   ✅ Movido: $doc → docs\" -ForegroundColor Green
    } else {
        Write-Host "   ⚠️  No encontrado: $doc" -ForegroundColor Yellow
    }
}
Write-Host ""

# Verificar archivos principales en raíz
Write-Host "📋 Verificando archivos principales..." -ForegroundColor Yellow

$main_docs = @(
    "README.md",
    "README_MODIFICATIONS.md",
    "CHANGELOG.md",
    "BUILDING.md",
    "CONTRIBUTING.md",
    "CHECKLIST_GITHUB.md",
    "VISUAL_SUMMARY.md",
    "RESUMEN_EJECUTIVO.md",
    "00_LEEME_PRIMERO.md"
)

$missing = @()
foreach ($doc in $main_docs) {
    if (Test-Path $doc) {
        Write-Host "   ✅ $doc" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $doc (FALTA)" -ForegroundColor Red
        $missing += $doc
    }
}
Write-Host ""

# Verificar .gitignore
Write-Host "🔍 Verificando .gitignore..." -ForegroundColor Yellow
if (Test-Path ".gitignore") {
    Write-Host "   ✅ .gitignore existe" -ForegroundColor Green
} else {
    Write-Host "   ❌ .gitignore no existe (crear manualmente)" -ForegroundColor Red
    $missing += ".gitignore"
}
Write-Host ""

# Mostrar estructura recomendada
Write-Host "📂 Estructura del repositorio:" -ForegroundColor Cyan
Write-Host ""
Write-Host "RTKLIB-2.5.0/" -ForegroundColor White
Write-Host "├── README.md                     ⭐ Principal" -ForegroundColor White
Write-Host "├── README_MODIFICATIONS.md       📘 Detalles técnicos" -ForegroundColor White
Write-Host "├── CHANGELOG.md                  📜 Historia" -ForegroundColor White
Write-Host "├── BUILDING.md                   🔧 Compilación" -ForegroundColor White
Write-Host "├── CONTRIBUTING.md               🤝 Contribución" -ForegroundColor White
Write-Host "├── CHECKLIST_GITHUB.md          ✅ Checklist" -ForegroundColor White
Write-Host "├── VISUAL_SUMMARY.md            📊 Diagramas" -ForegroundColor White
Write-Host "├── RESUMEN_EJECUTIVO.md         📋 Resumen" -ForegroundColor White
Write-Host "├── 00_LEEME_PRIMERO.md          🎯 Inicio rápido" -ForegroundColor White
Write-Host "├── .gitignore                    🚫 Git ignore" -ForegroundColor White
Write-Host "├── license.txt                   📄 Licencia" -ForegroundColor White
Write-Host "├── readme.txt                    📄 Original README" -ForegroundColor White
Write-Host "│" -ForegroundColor White
Write-Host "├── docs/                         📚 Docs en español" -ForegroundColor Yellow
Write-Host "│   ├── IMPLEMENTACION_MULTIHILO.md" -ForegroundColor White
Write-Host "│   ├── MODIFICACION_MULTIHILO_RTKLIB.md" -ForegroundColor White
Write-Host "│   └── EXPLICACION_INDEPENDENCIA_FORWARD_BACKWARD.md" -ForegroundColor White
Write-Host "│" -ForegroundColor White
Write-Host "├── src/                          💻 Código fuente" -ForegroundColor Yellow
Write-Host "│   ├── postpos.c                ⭐ MODIFICADO" -ForegroundColor Green
Write-Host "│   └── ...                      " -ForegroundColor White
Write-Host "│" -ForegroundColor White
Write-Host "├── app/                          📱 Aplicaciones" -ForegroundColor White
Write-Host "├── test/                         🧪 Tests" -ForegroundColor White
Write-Host "└── build/                        🔨 (no subir a git)" -ForegroundColor DarkGray
Write-Host ""

# Resumen
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "RESUMEN" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

if ($missing.Count -eq 0) {
    Write-Host "✅ Todos los archivos están en su lugar" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 ¡Listo para publicar en GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Próximos pasos:" -ForegroundColor Yellow
    Write-Host "1. git init" -ForegroundColor White
    Write-Host "2. git add ." -ForegroundColor White
    Write-Host "3. git commit -m 'Initial commit: RTKLIB 2.5.0 with parallel processing'" -ForegroundColor White
    Write-Host "4. git remote add origin https://github.com/PedroSoto-Code/RTKLIB-TerraPPK-parallel.git" -ForegroundColor White
    Write-Host "5. git push -u origin main" -ForegroundColor White
} else {
    Write-Host "⚠️  Faltan algunos archivos:" -ForegroundColor Yellow
    foreach ($m in $missing) {
        Write-Host "   - $m" -ForegroundColor Red
    }
    Write-Host ""
    Write-Host "Por favor, crea los archivos faltantes antes de publicar." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "Script completado" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Preguntar si desea ver el README principal
$response = Read-Host "¿Deseas ver el README.md principal? (s/n)"
if ($response -eq "s" -or $response -eq "S") {
    Write-Host ""
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "README.md" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host ""
    if (Test-Path "README.md") {
        Get-Content "README.md" | Out-Host
    } else {
        Write-Host "❌ README.md no encontrado" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Presiona cualquier tecla para salir..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
