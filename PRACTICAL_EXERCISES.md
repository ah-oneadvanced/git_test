# Practical VS Code Merge Exercises

## 🚀 Quick Start
1. Open VS Code
2. Open Terminal: `View → Terminal` or `Ctrl+``
3. Ensure you're in the git_test directory

---

## Exercise 1: Your First Visual Merge Conflict

### 1️⃣ Setup
```bash
# Make sure you're on main branch
git checkout main
git pull origin main

# Check your current state
git status
git log --oneline -5
```

### 2️⃣ Create the Conflict
```bash
# Start merging the multiplication feature
git merge feature/add-multiplication
```

### 3️⃣ What You Should See in VS Code

**Source Control Panel (Ctrl+Shift+G):**
- Red exclamation mark (!)
- "Merge Changes" section
- Program.cs with conflict marker

**In the Editor:**
- Conflict markers: `<<<<<<<`, `=======`, `>>>>>>>`
- Different colors for current/incoming changes

### 4️⃣ Open the Merge Editor
1. In Source Control panel, click on `Program.cs`
2. Click the "Open in Merge Editor" button (appears at top of file)
3. You now see the 3-way merge view!

### 5️⃣ Understanding the View
```
┌─────────────────┬─────────────────┐
│  Current (main) │ Incoming (mult) │
├─────────────────┴─────────────────┤
│          Result Editor             │
└────────────────────────────────────┘
```

### 6️⃣ Resolve Each Conflict

**Conflict 1 - Version String:**
- Left side: "Version: 1.0 - PRODUCTION"
- Right side: "Version: 1.1"
- **Action**: Click in result editor and type: "Version: 1.1 - PRODUCTION with Multiplication"

**Conflict 2 - Variables:**
- Left side: `int a = 10; int b = 5;`
- Right side: `int a = 20; int b = 5;`
- **Action**: Accept Incoming (click button above right panel)

**Conflict 3 - New Methods:**
- Right side has Multiply() and CalculateArea()
- **Action**: Accept Incoming for these additions

### 7️⃣ Complete the Merge
1. Save the file: `Ctrl+S`
2. In terminal:
```bash
git add Program.cs
git commit -m "Merged multiplication feature with main"
```

---

## Exercise 2: Multiple Conflicts with Division Feature

### 1️⃣ Setup Fresh
```bash
# First, let's save our work
git branch backup-ex1

# Reset to try division merge
git reset --hard origin/main
```

### 2️⃣ Merge Division Feature
```bash
git merge feature/add-division
```

### 3️⃣ Expected Conflicts
- Variable types: `int` vs `double`
- Different operation implementations
- Different version numbers

### 4️⃣ Merge Editor Strategy
1. **For type conflicts**: Accept double (more flexible)
2. **For operations**: Keep division, manually add back basic operations
3. **For version**: Create combined version "2.0 - PRODUCTION with Division"

---

## Exercise 3: Complex Three-Way Merge

### 1️⃣ Setup
```bash
# Reset again
git reset --hard origin/main

# Create a practice branch
git checkout -b practice/all-features
```

### 2️⃣ Sequential Merges
```bash
# First merge
git merge feature/add-multiplication
# Resolve conflicts using VS Code
git add .
git commit -m "Add multiplication"

# Second merge - this gets interesting!
git merge feature/add-division
```

### 3️⃣ Complex Conflict Resolution

**You'll now see:**
- Type conflicts (int from multiplication vs double from division)
- Multiple versions
- Overlapping methods

**Strategy:**
1. Change all to double for consistency
2. Keep all mathematical operations
3. Organize methods logically
4. Create unified version string

### 4️⃣ Using Advanced Merge Editor Features

**Try these buttons:**
- **"Accept Combination"**: See what happens when you keep both
- **"Reset to Base"**: Start over for a section
- **Toggle unchanged regions**: Focus on conflicts only

---

## Exercise 4: Rebase with VS Code

### 1️⃣ Setup
```bash
git checkout feature/logging
```

### 2️⃣ Start Interactive Rebase
```bash
git rebase -i main
```

### 3️⃣ When Conflicts Occur
- VS Code status bar shows "REBASING"
- Resolve conflicts same way as merge
- But after each resolution:
```bash
git add .
git rebase --continue
```

---

## Exercise 5: Real-World Scenario

### 1️⃣ Create a Messy Situation
```bash
git checkout main
git reset --hard origin/main

# Make local changes
echo "// TODO: Add more features" >> Program.cs
git add .
git commit -m "Add TODO"

# Now try to merge
git merge feature/add-multiplication
```

### 2️⃣ Handle Uncommitted Changes + Merge
You might need to:
1. Stash changes: `git stash`
2. Do the merge
3. Pop stash: `git stash pop`
4. Resolve stash conflicts

---

## 🎮 VS Code Shortcuts Cheat Sheet

### During Merge Conflicts
| Action | Shortcut | Description |
|--------|----------|-------------|
| Open Merge Editor | Click conflict | In editor or source control |
| Next Conflict | F7 | Jump to next conflict |
| Previous Conflict | Shift+F7 | Jump to previous conflict |
| Accept Current | Click button | Keep your version |
| Accept Incoming | Click button | Take their version |
| Accept Both | Click button | Keep both versions |
| Save | Ctrl+S | Save resolved file |

### Productivity Tips
| Action | How To |
|--------|--------|
| See all conflicts | Source Control panel |
| Compare changes | Right-click → Compare |
| Undo resolution | Ctrl+Z in result editor |
| Abort merge | Terminal: `git merge --abort` |

---

## 🏆 Challenge Mode

### Speed Challenge
Time yourself resolving these merges:
1. main + multiplication: Goal < 3 minutes
2. main + division: Goal < 3 minutes  
3. All three features: Goal < 10 minutes

### Accuracy Challenge
Merge all branches without:
- Breaking the build
- Losing any functionality
- Creating duplicate code

### Style Challenge
Merge and also:
- Keep consistent formatting
- Organize methods logically
- Add helpful comments

---

## 🐛 Common Issues & Solutions

### "I can't see the merge editor button"
1. Make sure you have conflicts
2. Check VS Code settings for merge editor
3. Try Command Palette: "Git: Open Merge Editor"

### "I accepted the wrong changes"
1. Undo: Ctrl+Z
2. Or abort: `git merge --abort`
3. Start over

### "The merge editor is confusing"
1. Focus on one conflict at a time
2. Read both versions completely
3. Think about the desired outcome
4. Use the result editor to type manually

### "Build fails after merge"
1. Check for missing semicolons
2. Ensure matching braces
3. Verify variable types match
4. Run `dotnet build` to see errors

---

## 📊 Track Your Progress

After each exercise, check:
- [ ] Did it compile? `dotnet build`
- [ ] Did it run? `dotnet run`  
- [ ] Are all features working?
- [ ] Is the code clean and organized?

Record your times and improve with practice!