# VS Code Merge Conflict Resolution Guide

## 🎯 Prerequisites
1. Install VS Code
2. Install Git
3. Clone the repository: `git clone https://github.com/ah-oneadvanced/git_test.git`
4. Open the folder in VS Code

## 🛠️ VS Code Setup for Better Merge Experience

### Recommended Extensions
1. **GitLens** - Supercharges Git capabilities
2. **Git Graph** - Visualize branch history

### Enable 3-way Merge Editor
1. Open VS Code Settings (Ctrl+,)
2. Search for "merge editor"
3. Enable: `Git: Merge Editor`
4. Enable: `Merge Editor: Show Base View`

---

## 📚 Exercise 1: Simple Two-Branch Merge

### Step 1: Prepare for Merge
```bash
# Open terminal in VS Code (Ctrl+`)
git checkout main
git pull origin main
```

### Step 2: Start the Merge
```bash
git merge feature/add-multiplication
```

### Step 3: VS Code Conflict Detection
- VS Code will automatically detect conflicts
- Look for:
  - Red indicators in the file explorer
  - "!" icon next to conflicted files
  - Source Control panel (Ctrl+Shift+G) shows merge changes

### Step 4: Open Merge Editor
1. Click on `Program.cs` in Source Control panel
2. Click "Open in Merge Editor" button
3. You'll see 3-way merge view:
   - **Left**: Changes from current branch (main)
   - **Right**: Incoming changes (feature/add-multiplication)
   - **Bottom**: Result editor
   - **Top** (if enabled): Common ancestor

### Step 5: Resolve Conflicts Using UI

#### Conflict 1: Version String
- You'll see conflict markers in the version line
- Options in merge editor:
  - Click "Accept Current" to keep main version
  - Click "Accept Incoming" to take feature version
  - Click "Accept Both" to keep both
  - OR manually edit in the result panel

**Best Practice**: For version conflicts, create a new version like "1.5"

#### Conflict 2: Variable Values
- Different values for `a` and `b`
- Choose based on your needs or create new values

#### Conflict 3: New Methods
- The multiplication branch adds new methods
- Usually, you want to "Accept Incoming" for new features

### Step 6: Using Merge Editor Controls
- **Accept Current**: Keeps your branch's version
- **Accept Incoming**: Takes the merging branch's version
- **Accept Combination**: Keeps both (concatenates)
- **Manual Edit**: Type directly in result editor

### Step 7: Complete the Merge
1. After resolving all conflicts, save the file (Ctrl+S)
2. In terminal:
```bash
git add .
git commit -m "Merge feature/add-multiplication into main"
```

---

## 📚 Exercise 2: Complex Three-Way Merge

### Step 1: Create a Conflict Scenario
```bash
# Don't commit previous merge, start fresh
git reset --hard origin/main
git checkout -b feature/combined
```

### Step 2: Merge Multiple Branches
```bash
git merge feature/add-multiplication
# Resolve conflicts
git add .
git commit -m "Add multiplication"

git merge feature/add-division
# More conflicts!
```

### Step 3: Advanced Merge Editor Features

#### Using Comparison View
1. Click "..." in merge editor
2. Select "Compare Changes"
3. See side-by-side diff

#### Using Base View
1. Enable base view in settings
2. See the common ancestor
3. Understand what each branch changed

### Step 4: Resolve Complex Conflicts

#### When you see overlapping changes:
1. **Version**: Combine to "2.1 - Multi-operation"
2. **Variables**: Use double type (from division branch)
3. **Methods**: Keep all methods from both branches
4. **Structure**: Organize methods logically

---

## 📚 Exercise 3: Pull Request Conflicts (GitHub + VS Code)

### Step 1: Create a Pull Request
1. Push your branch: `git push origin feature/combined`
2. Go to GitHub and create a PR to main
3. GitHub will show conflicts

### Step 2: Resolve Locally in VS Code
```bash
git checkout main
git pull origin main
git checkout feature/combined
git merge main
```

### Step 3: Use VS Code for Resolution
- Same merge editor process
- After resolving:
```bash
git add .
git commit -m "Resolve PR conflicts"
git push origin feature/combined
```

---

## 📚 Exercise 4: Rebase Conflicts in VS Code

### Step 1: Start Rebase
```bash
git checkout feature/add-division
git rebase main
```

### Step 2: Resolve Rebase Conflicts
- VS Code shows "Rebasing" in status bar
- Conflicts appear similarly
- Use merge editor the same way

### Step 3: Continue Rebase
```bash
# After resolving each conflict:
git add .
git rebase --continue
```

---

## 🎨 VS Code Merge Editor Tips & Tricks

### 1. **Keyboard Shortcuts**
- `Alt+Shift+F`: Format document after merge
- `Ctrl+Z`: Undo in result editor
- `F7`: Go to next difference
- `Shift+F7`: Go to previous difference

### 2. **Merge Editor Toolbar**
- 🔄 **Swap**: Switch left/right sides
- 👁️ **Show/Hide**: Toggle unchanged regions
- ⚙️ **Settings**: Merge editor preferences

### 3. **Smart Conflict Resolution**
- **Code Blocks**: Accept entire methods/classes
- **Imports**: Usually accept both
- **Comments**: Preserve from both sides
- **Formatting**: Use prettier/formatter after merge

### 4. **Using GitLens During Merge**
- Hover over lines to see who made changes
- Check commit history
- Understand context of changes

---

## 🚀 Advanced Scenarios

### Scenario 1: Conflicting Logic
When both branches modify the same logic differently:
1. Understand both implementations
2. Manually combine the logic
3. Test thoroughly

### Scenario 2: Renamed Variables
When one branch renames variables:
1. Use VS Code's "Rename Symbol" (F2)
2. Ensure consistency across merged code

### Scenario 3: Structural Changes
When branches reorganize code differently:
1. Accept one structure
2. Manually integrate features from other branch
3. Refactor if needed

---

## ✅ Best Practices

### 1. **Before Merging**
- Pull latest changes: `git pull origin main`
- Review changes: Use Git Graph extension
- Understand both branches' changes

### 2. **During Merge**
- Take your time
- Read both versions completely
- Consider the final functionality
- Don't just accept changes blindly

### 3. **After Merge**
- Format code: `Shift+Alt+F`
- Run build: `dotnet build`
- Test functionality: `dotnet run`
- Review final diff: `git diff HEAD~1`

### 4. **When Stuck**
- Abort merge: `git merge --abort`
- Start over with better understanding
- Ask for help/pair program

---

## 🎯 Practice Challenges

### Challenge 1: Feature Integration
1. Reset to clean state
2. Merge all three feature branches
3. Ensure all features work together

### Challenge 2: Conflict Resolution Speed Run
1. Time yourself resolving conflicts
2. Try to get faster while maintaining quality
3. Goal: Under 5 minutes per conflict

### Challenge 3: Complex Refactor
1. Create a new branch
2. Refactor the calculator into classes
3. Merge with existing features
4. Resolve structural conflicts

---

## 📝 Quick Reference Card

| Action | Git Command | VS Code Action |
|--------|------------|----------------|
| Start merge | `git merge branch-name` | Source Control → Merge Branch |
| Open merge editor | - | Click conflict → "Open in Merge Editor" |
| Accept current | - | Click "Accept Current" button |
| Accept incoming | - | Click "Accept Incoming" button |
| Accept both | - | Click "Accept Combination" button |
| Abort merge | `git merge --abort` | Source Control → ... → Abort Merge |
| Complete merge | `git add . && git commit` | Source Control → Commit |

---

## 🔧 Troubleshooting

### "Merge Editor Not Showing"
- Ensure Git: Merge Editor is enabled in settings
- Try closing and reopening the file
- Use Command Palette: "Git: Open Merge Editor"

### "Can't See All Changes"
- Toggle unchanged regions visibility
- Scroll through entire file
- Check minimap for conflict markers

### "Accidentally Accepted Wrong Change"
- Undo with Ctrl+Z in result editor
- Or abort merge and start over

---

## 🎓 Mastery Checklist

- [ ] Can identify conflicts in VS Code UI
- [ ] Understand 3-way merge editor layout
- [ ] Can use all merge editor buttons
- [ ] Can manually edit in result panel
- [ ] Can handle multi-file conflicts
- [ ] Can resolve rebase conflicts
- [ ] Can use keyboard shortcuts efficiently
- [ ] Understand when to accept current/incoming/both
- [ ] Can merge complex structural changes
- [ ] Always test after merging

---

## 🎉 Congratulations!
You're now ready to handle merge conflicts like a pro using VS Code's visual merge editor!