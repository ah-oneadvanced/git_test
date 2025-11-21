# VS Code Merge Conflict Visual Reference

## 🎯 Quick Visual Guide

### What Merge Conflicts Look Like in Code:
```csharp
<<<<<<< HEAD (Current Change - Your Branch)
Console.WriteLine("Version: 1.0 - PRODUCTION");
int a = 10;
int b = 5;
=======
Console.WriteLine("Version: 1.1");
int a = 20;
int b = 5;
>>>>>>> feature/add-multiplication (Incoming Change)
```

### VS Code Merge Editor Layout:
```
┌─────────────────────────────────────────────────┐
│                  File Name Tab                  │
├─────────────────────┬───────────────────────────┤
│                     │                           │
│   CURRENT CHANGE    │    INCOMING CHANGE        │
│   (Your Branch)     │    (Merging Branch)       │
│                     │                           │
│ [Accept Current] ▼  │  [Accept Incoming] ▼     │
│                     │                           │
│  Your code here     │  Their code here         │
│                     │                           │
├─────────────────────┴───────────────────────────┤
│              RESULT (Combined Output)            │
│                                                  │
│         You can edit directly here!              │
│                                                  │
└──────────────────────────────────────────────────┘
```

## 🎨 Color Coding in VS Code

| Color | Meaning |
|-------|---------|
| 🟩 Green | Added lines (incoming) |
| 🟥 Red | Removed lines (current) |
| 🟦 Blue | Modified lines |
| 🟨 Yellow | Conflict markers |
| ⬜ Gray | Unchanged code |

## 🔘 Merge Editor Buttons

### Top Bar Buttons:
```
[Accept Current] [Accept Incoming] [Accept Combination] [Reset]
```

### What Each Button Does:

#### Accept Current ✓
- Keeps YOUR version
- Discards incoming changes
- Use when: Your code is correct

#### Accept Incoming ✓
- Takes THEIR version  
- Discards your changes
- Use when: Their code is better

#### Accept Combination ✓
- Keeps BOTH versions
- Concatenates the code
- Use when: Both changes are needed

#### Manual Edit ✏️
- Type directly in result panel
- Combine parts of both
- Use when: Need custom solution

## 📍 VS Code UI Elements During Merge

### 1. Source Control Panel (Ctrl+Shift+G)
```
SOURCE CONTROL
├── MERGE CHANGES (!)
│   ├── Program.cs (!)
│   └── [Click to see conflicts]
└── CHANGES
    └── [Other modified files]
```

### 2. Status Bar Indicators
```
[main|MERGING] ⚠️ Conflicts: 3 files
```

### 3. Editor Indicators
- Wavy red underline on conflict markers
- "!" icon in file tab
- Line numbers highlighted

## 🎮 Interactive Elements

### Click Zones in Merge Editor:
```
┌────────────────────────────┐
│ Click here to accept       │ ← Clickable button
├────────────────────────────┤
│                            │
│  Code section              │ ← Clickable to select
│                            │
├────────────────────────────┤
│ Result: Click to edit      │ ← Direct editing area
└────────────────────────────┘
```

## 🔄 Merge Workflow Visualization

```
1. Start Merge
   ↓
2. Conflicts Detected → VS Code highlights files
   ↓
3. Open Merge Editor → 3-way view appears
   ↓
4. Resolve Each Conflict → Use buttons or edit
   ↓
5. Save File → Ctrl+S
   ↓
6. Stage Changes → git add
   ↓
7. Commit → Complete merge
```

## 📐 Side-by-Side Comparison

### Before Merge Editor:
```
Program.cs [!]
<<<<<<< HEAD
Your code
=======
Their code
>>>>>>> branch
```

### With Merge Editor:
```
┌─────────┬─────────┐
│Your code│Their code│
├─────────┴─────────┤
│   Combined result  │
└────────────────────┘
```

## 🎯 Quick Decision Matrix

| Scenario | Action | Button to Click |
|----------|--------|-----------------|
| Their feature is new | Keep theirs | Accept Incoming |
| Your bug fix is critical | Keep yours | Accept Current |
| Both made good changes | Combine | Accept Combination |
| Mix of both needed | Edit manually | Type in result |
| Versions conflict | Create new | Manual edit |
| Duplicate functions | Pick best one | Current or Incoming |

## ⌨️ Keyboard Navigation

```
Tab         → Move between panels
Arrow Keys  → Navigate within panel  
F7          → Next conflict
Shift+F7    → Previous conflict
Ctrl+S      → Save resolved file
Ctrl+Z      → Undo last change
```

## 💡 Visual Cues

### In File Explorer:
- Red "!" = Has conflicts
- "M" = Modified
- "U" = Untracked

### In Editor:
- Highlighted lines = Changed code
- Grayed lines = Unchanged
- Colored bars = Change indicators

### In Minimap:
- Red sections = Conflicts
- Your position = Blue rectangle

---

## 🚦 Status Indicators

### Git Status in VS Code:
| Icon | Meaning |
|------|---------|
| ⚠️ | Merge conflicts |
| ✓ | Changes staged |
| +5 | 5 files added |
| ~3 | 3 files modified |
| -2 | 2 files deleted |
| ↑3 | 3 commits ahead |
| ↓2 | 2 commits behind |

Keep this reference open in a split view while resolving conflicts!