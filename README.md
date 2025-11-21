# Conflict Resolution Practice Repository

This repository is designed to help you practice resolving merge conflicts in Git.

## Project Structure
- **Language**: C# .NET
- **Main File**: Program.cs (Console Application)

## Branches

### main
- Basic calculator with addition and subtraction
- Production version (1.0)
- Has Console.ReadKey() at the end

### feature/add-multiplication
- Adds multiplication operation
- Adds area calculation method
- Version 1.1
- Changed variable values to a=20, b=5

### feature/add-division
- Adds division operation
- Implements safe division with zero check
- Version 2.0
- Changed variables to double type (a=15, b=3)

### feature/logging
- Adds logging functionality
- Refactors operations into separate methods
- Version 1.0 with Logging
- Uses DateTime for log timestamps

## Expected Conflicts

When merging these branches, you'll encounter conflicts in:

1. **Version string** - Each branch has different version numbers
2. **Variable declarations** - Different types (int vs double) and values
3. **Operations** - Different calculator operations added
4. **Methods** - Different helper methods in each branch
5. **Using statements** - feature/logging adds System.IO

## Practice Scenarios

### Scenario 1: Merge multiplication into main
```bash
git checkout main
git merge feature/add-multiplication
# Resolve conflicts
```

### Scenario 2: Merge division into main (after scenario 1)
```bash
git merge feature/add-division
# Resolve conflicts with both multiplication and division
```

### Scenario 3: Three-way merge
```bash
git checkout feature/logging
git merge feature/add-multiplication
# Resolve conflicts
git merge feature/add-division
# Resolve more complex conflicts
```

### Scenario 4: Rebase practice
```bash
git checkout feature/add-multiplication
git rebase main
# Resolve conflicts during rebase
```

## Tips for Resolving Conflicts

1. Always read both versions carefully
2. Decide which changes to keep or combine both
3. Test the code after resolving conflicts
4. Consider the logical flow of the program
5. Maintain consistent formatting

## Build and Run
```bash
dotnet build
dotnet run
```