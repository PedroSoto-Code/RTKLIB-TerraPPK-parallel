# Contributing to RTKLIB 2.5.0 Parallel Processing Fork

Thank you for considering contributing to this project! 🎉

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)

## 📜 Code of Conduct

This project follows a standard code of conduct:

- Be respectful and inclusive
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other contributors

## 🤝 How Can I Contribute?

### 1. Reporting Bugs 🐛

If you find a bug, please create an issue with:

- **Clear title** - Describe the problem concisely
- **Steps to reproduce** - Detailed steps to recreate the issue
- **Expected behavior** - What should happen
- **Actual behavior** - What actually happens
- **Environment** - OS, compiler, RTKLIB version
- **Sample data** - If possible, include test files

**Template:**
```markdown
**Bug Description:**
Brief description of the bug

**To Reproduce:**
1. Step 1
2. Step 2
3. ...

**Expected Behavior:**
What should happen

**Actual Behavior:**
What actually happens

**Environment:**
- OS: Windows 10 / Ubuntu 22.04 / macOS 13
- Compiler: GCC 11.2 / MSVC 2022
- RTKLIB Version: 2.5.0-parallel

**Additional Context:**
Any other relevant information
```

### 2. Suggesting Enhancements 💡

Enhancement suggestions are welcome! Please include:

- **Clear use case** - Why this enhancement is needed
- **Proposed solution** - How you envision it working
- **Alternatives considered** - Other approaches you thought about
- **Implementation notes** - Technical details if applicable

### 3. Code Contributions 💻

We welcome code contributions! Areas where help is especially appreciated:

- **Performance improvements** - Optimize existing code
- **Bug fixes** - Fix reported issues
- **Documentation** - Improve or translate docs
- **Testing** - Add test cases
- **New features** - Implement planned enhancements

## 🛠️ Development Setup

### Prerequisites

```bash
# Install dependencies
# Linux (Ubuntu/Debian)
sudo apt-get install build-essential cmake git

# macOS
brew install cmake

# Windows
# Install MinGW-w64 or Visual Studio
```

### Clone and Build

```bash
# Fork the repository first, then clone your fork
git clone https://github.com/PedroSoto-Code/RTKLIB-TerraPPK-parallel.git
cd RTKLIB-TerraPPK-parallel

# Create development build
mkdir build-dev
cd build-dev
cmake -DCMAKE_BUILD_TYPE=Debug ..
make -j$(nproc)

# Run tests
make test
```

### Development Branch

```bash
# Create a feature branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/bug-description
```

## 📝 Coding Standards

### C Code Style

Follow the existing RTKLIB code style:

```c
/* Function comment block */
extern int myfunction(int arg1, double arg2)
{
    int local_var;
    
    /* Comment before code block */
    if (arg1 > 0) {
        local_var = arg1 * 2;
    }
    else {
        local_var = 0;
    }
    
    return local_var;
}
```

**Key points:**
- Indent with 4 spaces (no tabs)
- Opening braces on same line for functions and control structures
- Use meaningful variable names
- Add comments for complex logic
- Keep functions focused and reasonable in size

### Variable Naming

- **Local variables:** `snake_case`
- **Global variables:** `snake_case` with descriptive prefix
- **Constants:** `UPPER_CASE`
- **Structures:** `snake_case_t` (with _t suffix)
- **Functions:** `snake_case`

### Example:

```c
#define MAX_SATELLITES 32

typedef struct {
    int num_obs;
    double pos[3];
} observation_t;

static int process_observation(observation_t *obs)
{
    int result = 0;
    /* Implementation */
    return result;
}
```

## 🧪 Testing Guidelines

### Before Submitting

1. **Compile without warnings**
   ```bash
   cmake -DCMAKE_BUILD_TYPE=Release ..
   make VERBOSE=1
   ```

2. **Test with sample data**
   ```bash
   ./rnx2rtkp -k test.conf -o test.pos rover.obs base.obs nav.nav
   ```

3. **Verify results unchanged**
   ```bash
   # Compare with known good output
   diff test.pos reference.pos
   ```

4. **Test on multiple platforms** (if possible)
   - Windows
   - Linux
   - macOS

### Adding Tests

If adding new functionality:

```c
/* test_myfeature.c */
#include "rtklib.h"
#include <assert.h>

void test_myfeature(void)
{
    /* Setup */
    int input = 10;
    
    /* Execute */
    int result = myfunction(input);
    
    /* Verify */
    assert(result == 20);
}

int main(void)
{
    test_myfeature();
    printf("All tests passed!\n");
    return 0;
}
```

## 🔄 Pull Request Process

### 1. Before Creating PR

- [ ] Code compiles without errors or warnings
- [ ] All tests pass
- [ ] Code follows style guidelines
- [ ] Documentation updated (if needed)
- [ ] Commits are clean and well-described

### 2. Creating the PR

**Title format:**
```
[Type] Brief description

Types: Feature, Fix, Docs, Test, Refactor, Performance
```

**Examples:**
- `[Feature] Add GPU acceleration for matrix operations`
- `[Fix] Resolve thread safety issue in observation indexing`
- `[Docs] Update building instructions for macOS`

**Description template:**
```markdown
## Description
Brief description of changes

## Motivation
Why these changes are needed

## Changes Made
- Change 1
- Change 2
- ...

## Testing
How these changes were tested

## Screenshots (if applicable)
Before/after comparisons

## Checklist
- [ ] Code compiles without warnings
- [ ] Tests pass
- [ ] Documentation updated
- [ ] No breaking changes (or documented if yes)
```

### 3. Review Process

- Maintainer will review within 1-2 weeks
- Address feedback and update PR
- Once approved, changes will be merged

### 4. After Merge

- Delete your branch
- Update your fork
- Celebrate! 🎉

## 🐛 Reporting Bugs

### Security Vulnerabilities

**Do not** open a public issue for security vulnerabilities. Instead:

1. Email maintainer directly
2. Include detailed description
3. Provide steps to reproduce
4. Allow reasonable time for fix before disclosure

### Regular Bugs

Use the issue tracker with the bug template.

**Priority levels:**

- **Critical:** System crashes, data corruption
- **High:** Major functionality broken
- **Medium:** Minor functionality issues
- **Low:** Cosmetic issues, minor inconveniences

## 💡 Suggesting Enhancements

### Feature Requests

Use the issue tracker with "enhancement" label.

**Good feature requests include:**

1. **Problem statement** - What problem does this solve?
2. **Proposed solution** - How should it work?
3. **Alternatives** - What other solutions exist?
4. **Use cases** - Real-world examples
5. **Priority** - Nice-to-have vs critical

### Documentation Improvements

Documentation improvements are always welcome:

- Fix typos or unclear wording
- Add examples or tutorials
- Translate to other languages
- Improve API documentation
- Add diagrams or illustrations

## 📚 Additional Resources

- [RTKLIB Manual](http://www.rtklib.com/prog/manual_2.4.2.pdf)
- [Git Guidelines](https://git-scm.com/book/en/v2)
- [Markdown Guide](https://www.markdownguide.org/)
- [C Coding Standards](https://www.kernel.org/doc/html/latest/process/coding-style.html)

## 🏆 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in commit history

## 📞 Questions?

If you have questions about contributing:

1. Check existing documentation
2. Search closed issues
3. Open a discussion thread
4. Contact maintainer

---

**Thank you for contributing!** 🙏

Every contribution, no matter how small, helps make this project better.

Happy coding! 💻✨
