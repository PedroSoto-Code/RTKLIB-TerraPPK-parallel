# Script para configurar el nombre del repositorio en GitHub
# RTKLIB-TerraPPK-parallel

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Configuración de Repositorio GitHub" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Nombre del repositorio: " -NoNewline
Write-Host "RTKLIB-TerraPPK-parallel" -ForegroundColor Green
Write-Host "Proyecto: " -NoNewline
Write-Host "TerraPPK" -ForegroundColor Yellow
Write-Host "Desarrollador: " -NoNewline
Write-Host "Pedro Daniel Soto Sanabria" -ForegroundColor Yellow
Write-Host ""

# Cambiar al directorio del script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

Write-Host "📋 Configuración actual:" -ForegroundColor Yellow
Write-Host ""

# Verificar si es un repositorio git
if (Test-Path ".git") {
    Write-Host "✅ Repositorio Git inicializado" -ForegroundColor Green
    
    # Mostrar remote actual
    $remotes = git remote -v 2>&1
    if ($remotes -match "origin") {
        Write-Host ""
        Write-Host "🔗 Remote actual:" -ForegroundColor Cyan
        git remote -v
        Write-Host ""
        $response = Read-Host "¿Deseas actualizar el remote a RTKLIB-TerraPPK-parallel? (s/n)"
        if ($response -eq "s" -or $response -eq "S") {
            git remote set-url origin https://github.com/PedroSoto-Code/RTKLIB-TerraPPK-parallel.git
            Write-Host "✅ Remote actualizado" -ForegroundColor Green
        }
    } else {
        Write-Host "⚠️  No hay remote configurado" -ForegroundColor Yellow
        Write-Host ""
        $username = Read-Host "Ingresa tu usuario de GitHub (Enter para usar PedroSoto-Code)"
        if ([string]::IsNullOrWhiteSpace($username)) { $username = "PedroSoto-Code" }
        git remote add origin "https://github.com/$username/RTKLIB-TerraPPK-parallel.git"
        Write-Host "✅ Remote añadido: https://github.com/$username/RTKLIB-TerraPPK-parallel.git" -ForegroundColor Green
    }
} else {
    Write-Host "❌ No es un repositorio Git" -ForegroundColor Red
    Write-Host ""
    $response = Read-Host "¿Deseas inicializar el repositorio? (s/n)"
    if ($response -eq "s" -or $response -eq "S") {
        git init
        Write-Host "✅ Repositorio inicializado" -ForegroundColor Green
        Write-Host ""
        $username = Read-Host "Ingresa tu usuario de GitHub (Enter para usar PedroSoto-Code)"
        if ([string]::IsNullOrWhiteSpace($username)) { $username = "PedroSoto-Code" }
        git remote add origin "https://github.com/$username/RTKLIB-TerraPPK-parallel.git"
        Write-Host "✅ Remote añadido: https://github.com/$username/RTKLIB-TerraPPK-parallel.git" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Configuración completada" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Próximos pasos:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Crear el repositorio en GitHub:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host "   Nombre: " -NoNewline -ForegroundColor White
Write-Host "RTKLIB-TerraPPK-parallel" -ForegroundColor Green
Write-Host ""
Write-Host "2. Hacer el primer commit:" -ForegroundColor White
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m 'Initial commit: TerraPPK - RTKLIB 2.5.0 with parallel processing'" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Push al repositorio:" -ForegroundColor White
Write-Host "   git branch -M main" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Crear release:" -ForegroundColor White
Write-Host "   git tag -a v2.5.0-parallel-1.0 -m 'Release v1.0'" -ForegroundColor Gray
Write-Host "   git push origin v2.5.0-parallel-1.0" -ForegroundColor Gray
Write-Host ""

Write-Host "Presiona cualquier tecla para continuar..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
