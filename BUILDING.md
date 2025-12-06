# Guía de Compilación - RTKLIB 2.5.0 Parallel

Esta guía proporciona instrucciones detalladas para compilar RTKLIB con las modificaciones de procesamiento paralelo.

## 📋 Requisitos Previos

### Windows
- **Compilador:** MinGW-w64, MSVC, o Embarcadero C++
- **CMake:** Versión 3.10 o superior (opcional, recomendado)
- **Git:** Para clonar el repositorio

### Linux
- **Compilador:** GCC 4.8+ o Clang 3.4+
- **CMake:** Versión 3.10 o superior (opcional)
- **pthread:** Incluido en glibc (normalmente ya instalado)
- **Git:** Para clonar el repositorio

```bash
# Ubuntu/Debian
sudo apt-get install build-essential cmake git

# Fedora/RHEL
sudo dnf install gcc gcc-c++ cmake git

# Arch Linux
sudo pacman -S base-devel cmake git
```

### macOS
- **Xcode Command Line Tools**
- **CMake:** Instalar vía Homebrew

```bash
xcode-select --install
brew install cmake
```

## 🔨 Compilación con CMake (Recomendado)

### 1. Clonar el Repositorio

```bash
git clone [URL_DE_TU_REPOSITORIO]
cd RTKLIB-2.5.0
```

### 2. Crear Directorio de Compilación

```bash
mkdir build
cd build
```

### 3. Configurar con CMake

**Windows (MinGW):**
```bash
cmake -G "MinGW Makefiles" ..
```

**Windows (Visual Studio):**
```bash
cmake -G "Visual Studio 16 2019" ..
```

**Linux/Mac:**
```bash
cmake ..
```

### 4. Compilar

**Windows (MinGW):**
```bash
mingw32-make
```

**Windows (Visual Studio):**
```bash
cmake --build . --config Release
```

**Linux/Mac:**
```bash
make -j$(nproc)  # Linux
make -j$(sysctl -n hw.ncpu)  # Mac
```

### 5. Instalar (Opcional)

```bash
# Linux/Mac
sudo make install

# Windows
cmake --install . --prefix C:\RTKLIB
```

## 🔧 Compilación Manual

### Windows con MinGW

```bash
cd app/consapp/rnx2rtkp/gcc
mingw32-make
```

### Linux

```bash
cd app/consapp/rnx2rtkp/gcc
make
```

## 📦 Compilación de Aplicaciones Específicas

### RNX2RTKP (Post-processing)

**Windows:**
```bash
cd app/consapp/rnx2rtkp/gcc
mingw32-make
```

**Linux:**
```bash
cd app/consapp/rnx2rtkp/gcc
make
```

### RTKRCV (Real-time)

**Windows:**
```bash
cd app/consapp/rtkrcv/gcc
mingw32-make
```

**Linux:**
```bash
cd app/consapp/rtkrcv/gcc
make
```

### STR2STR (Stream converter)

**Windows:**
```bash
cd app/consapp/str2str/gcc
mingw32-make
```

**Linux:**
```bash
cd app/consapp/str2str/gcc
make
```

## 🎯 Verificar Compilación

### Verificar Threading

El ejecutable debe estar compilado con soporte de hilos:

**Windows:**
```bash
# Debe mostrar referencias a threading
dumpbin /imports rnx2rtkp.exe | findstr -i thread
```

**Linux:**
```bash
# Debe mostrar pthread
ldd rnx2rtkp | grep pthread
```

### Test Rápido

```bash
./rnx2rtkp --help
```

Debería mostrar la ayuda sin errores.

## 🔍 Solución de Problemas

### Error: "pthread.h not found" (Linux)

```bash
# Ubuntu/Debian
sudo apt-get install libc6-dev

# Fedora
sudo dnf install glibc-devel
```

### Error: "windows.h not found" (Windows)

Asegúrate de tener MinGW-w64 instalado correctamente:

```bash
# Verificar instalación
gcc --version
```

### Error de Linking con pthread (Linux)

Añadir flag de compilación:

```bash
make LDLIBS="-lpthread"
```

### Warnings sobre "implicit declaration" (Linux)

Añadir flag de compilación:

```bash
make CFLAGS="-D_GNU_SOURCE"
```

## 📊 Optimización de Compilación

### Optimización de Velocidad

**GCC/Clang:**
```bash
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="-O3 -march=native" ..
make
```

**MSVC:**
```bash
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release
```

### Optimización de Tamaño

```bash
cmake -DCMAKE_BUILD_TYPE=MinSizeRel ..
make
strip rnx2rtkp  # Remover símbolos de debug
```

### Compilación con Debug

```bash
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
```

## 🧪 Testing Post-Compilación

### Test Básico

```bash
# Procesar archivo de ejemplo
./rnx2rtkp -k test.conf -o test.pos rover.obs base.obs nav.nav
```

### Verificar Modo Paralelo

```bash
# Usar modo Combined (debería usar paralelo)
./rnx2rtkp -p 1 -m combined -o test.pos rover.obs base.obs nav.nav
```

### Benchmark de Velocidad

```bash
# Medir tiempo de procesamiento
time ./rnx2rtkp -p 1 -m combined -o test.pos rover.obs base.obs nav.nav
```

## 📁 Estructura de Binarios

Después de compilar:

```
bin/
├── rnx2rtkp      # Post-processing
├── rtkrcv        # Real-time processing
├── str2str       # Stream converter
├── convbin       # Binary converter
├── pos2kml       # Position to KML
└── ...
```

## 🚀 Compilación para Distribución

### Windows (Standalone)

```bash
# Compilar estático
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF ..
mingw32-make
```

### Linux (Portable)

```bash
# Compilar con librerías estáticas
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-static-libgcc -static-libstdc++" ..
make
```

## 📝 Notas Adicionales

### Flags de Compilación Importantes

- `-DWIN32`: Automático en Windows, usa Windows threading
- `-pthread`: Automático en Linux/Mac, usa POSIX threads
- `-O3`: Optimización máxima de velocidad
- `-march=native`: Optimización para CPU específica

### Variables de Entorno Útiles

```bash
# Número de hilos para compilación paralela
export MAKEFLAGS="-j$(nproc)"

# Compilador específico
export CC=gcc-11
export CXX=g++-11
```

## 📞 Soporte

Si encuentras problemas de compilación:
1. Verifica los requisitos previos
2. Revisa los logs de error
3. Consulta la sección de troubleshooting
4. Abre un issue en el repositorio con:
   - Sistema operativo y versión
   - Compilador y versión
   - Comando completo usado
   - Error completo

---

**Última actualización:** Diciembre 2025
