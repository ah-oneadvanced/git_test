# PowerShell script for quick merge practice setup
# Run this to quickly reset and practice different merge scenarios

Write-Host "Git Merge Conflict Practice Script" -ForegroundColor Green
Write-Host "==================================`n" -ForegroundColor Green

function Show-Menu {
    Write-Host "Choose a practice scenario:" -ForegroundColor Yellow
    Write-Host "1. Simple merge (main + multiplication)"
    Write-Host "2. Type conflict merge (main + division)"  
    Write-Host "3. Complex merge (main + logging)"
    Write-Host "4. Sequential merge (all features)"
    Write-Host "5. Rebase practice"
    Write-Host "6. Reset to clean state"
    Write-Host "0. Exit`n"
}

function Reset-ToClean {
    Write-Host "`nResetting to clean main branch..." -ForegroundColor Cyan
    git checkout main 2>$null
    git reset --hard origin/main
    git clean -fd
    Write-Host "✓ Reset complete!" -ForegroundColor Green
}

function Practice-SimpleMerge {
    Write-Host "`nStarting Simple Merge Practice..." -ForegroundColor Cyan
    Reset-ToClean
    Write-Host "`nMerging feature/add-multiplication..." -ForegroundColor Yellow
    git merge feature/add-multiplication
    Write-Host "`n⚠️  Conflicts detected! Open VS Code to resolve them." -ForegroundColor Red
    Write-Host "Tip: Look for the version string and variable conflicts" -ForegroundColor Gray
}

function Practice-TypeConflict {
    Write-Host "`nStarting Type Conflict Practice..." -ForegroundColor Cyan
    Reset-ToClean
    Write-Host "`nMerging feature/add-division..." -ForegroundColor Yellow
    git merge feature/add-division
    Write-Host "`n⚠️  Conflicts detected! Open VS Code to resolve them." -ForegroundColor Red
    Write-Host "Tip: Notice int vs double type conflicts" -ForegroundColor Gray
}

function Practice-ComplexMerge {
    Write-Host "`nStarting Complex Merge Practice..." -ForegroundColor Cyan
    Reset-ToClean
    Write-Host "`nMerging feature/logging..." -ForegroundColor Yellow
    git merge feature/logging
    Write-Host "`n⚠️  Conflicts detected! Open VS Code to resolve them." -ForegroundColor Red
    Write-Host "Tip: This branch restructures the entire program" -ForegroundColor Gray
}

function Practice-SequentialMerge {
    Write-Host "`nStarting Sequential Merge Practice..." -ForegroundColor Cyan
    Reset-ToClean
    git checkout -b practice/all-features
    
    Write-Host "`nStep 1: Merging multiplication..." -ForegroundColor Yellow
    git merge feature/add-multiplication
    Write-Host "Resolve conflicts, then run: git add . && git commit" -ForegroundColor Gray
    Read-Host "Press Enter when ready for step 2"
    
    Write-Host "`nStep 2: Merging division..." -ForegroundColor Yellow
    git merge feature/add-division
    Write-Host "More conflicts! Resolve these too" -ForegroundColor Gray
    Read-Host "Press Enter when ready for step 3"
    
    Write-Host "`nStep 3: Merging logging..." -ForegroundColor Yellow
    git merge feature/logging
    Write-Host "Final conflicts! Good luck!" -ForegroundColor Gray
}

function Practice-Rebase {
    Write-Host "`nStarting Rebase Practice..." -ForegroundColor Cyan
    git checkout feature/add-multiplication
    Write-Host "`nRebasing onto main..." -ForegroundColor Yellow
    git rebase main
    Write-Host "`n⚠️  Conflicts during rebase!" -ForegroundColor Red
    Write-Host "Resolve conflicts, then: git add . && git rebase --continue" -ForegroundColor Gray
}

# Main loop
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    
    switch ($choice) {
        "1" { Practice-SimpleMerge }
        "2" { Practice-TypeConflict }
        "3" { Practice-ComplexMerge }
        "4" { Practice-SequentialMerge }
        "5" { Practice-Rebase }
        "6" { Reset-ToClean }
        "0" { 
            Write-Host "`nHappy practicing! 🚀" -ForegroundColor Green
            exit 
        }
        default { Write-Host "Invalid choice. Try again." -ForegroundColor Red }
    }
    
    Write-Host "`n" 
    Read-Host "Press Enter to continue"
    Clear-Host
    
} while ($true)