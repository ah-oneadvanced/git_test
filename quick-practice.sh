#!/bin/bash
# Bash script for quick merge practice setup (Linux/Mac)
# Run this to quickly reset and practice different merge scenarios

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

echo -e "${GREEN}Git Merge Conflict Practice Script${NC}"
echo -e "${GREEN}==================================${NC}\n"

show_menu() {
    echo -e "${YELLOW}Choose a practice scenario:${NC}"
    echo "1. Simple merge (main + multiplication)"
    echo "2. Type conflict merge (main + division)"
    echo "3. Complex merge (main + logging)"
    echo "4. Sequential merge (all features)"
    echo "5. Rebase practice"
    echo "6. Reset to clean state"
    echo -e "0. Exit\n"
}

reset_to_clean() {
    echo -e "\n${CYAN}Resetting to clean main branch...${NC}"
    git checkout main 2>/dev/null
    git reset --hard origin/main
    git clean -fd
    echo -e "${GREEN}✓ Reset complete!${NC}"
}

practice_simple_merge() {
    echo -e "\n${CYAN}Starting Simple Merge Practice...${NC}"
    reset_to_clean
    echo -e "\n${YELLOW}Merging feature/add-multiplication...${NC}"
    git merge feature/add-multiplication
    echo -e "\n${RED}⚠️  Conflicts detected! Open VS Code to resolve them.${NC}"
    echo -e "${GRAY}Tip: Look for the version string and variable conflicts${NC}"
}

practice_type_conflict() {
    echo -e "\n${CYAN}Starting Type Conflict Practice...${NC}"
    reset_to_clean
    echo -e "\n${YELLOW}Merging feature/add-division...${NC}"
    git merge feature/add-division
    echo -e "\n${RED}⚠️  Conflicts detected! Open VS Code to resolve them.${NC}"
    echo -e "${GRAY}Tip: Notice int vs double type conflicts${NC}"
}

practice_complex_merge() {
    echo -e "\n${CYAN}Starting Complex Merge Practice...${NC}"
    reset_to_clean
    echo -e "\n${YELLOW}Merging feature/logging...${NC}"
    git merge feature/logging
    echo -e "\n${RED}⚠️  Conflicts detected! Open VS Code to resolve them.${NC}"
    echo -e "${GRAY}Tip: This branch restructures the entire program${NC}"
}

practice_sequential_merge() {
    echo -e "\n${CYAN}Starting Sequential Merge Practice...${NC}"
    reset_to_clean
    git checkout -b practice/all-features
    
    echo -e "\n${YELLOW}Step 1: Merging multiplication...${NC}"
    git merge feature/add-multiplication
    echo -e "${GRAY}Resolve conflicts, then run: git add . && git commit${NC}"
    read -p "Press Enter when ready for step 2..."
    
    echo -e "\n${YELLOW}Step 2: Merging division...${NC}"
    git merge feature/add-division
    echo -e "${GRAY}More conflicts! Resolve these too${NC}"
    read -p "Press Enter when ready for step 3..."
    
    echo -e "\n${YELLOW}Step 3: Merging logging...${NC}"
    git merge feature/logging
    echo -e "${GRAY}Final conflicts! Good luck!${NC}"
}

practice_rebase() {
    echo -e "\n${CYAN}Starting Rebase Practice...${NC}"
    git checkout feature/add-multiplication
    echo -e "\n${YELLOW}Rebasing onto main...${NC}"
    git rebase main
    echo -e "\n${RED}⚠️  Conflicts during rebase!${NC}"
    echo -e "${GRAY}Resolve conflicts, then: git add . && git rebase --continue${NC}"
}

# Main loop
while true; do
    show_menu
    read -p "Enter your choice: " choice
    
    case $choice in
        1) practice_simple_merge ;;
        2) practice_type_conflict ;;
        3) practice_complex_merge ;;
        4) practice_sequential_merge ;;
        5) practice_rebase ;;
        6) reset_to_clean ;;
        0) 
            echo -e "\n${GREEN}Happy practicing! 🚀${NC}"
            exit 0
            ;;
        *) echo -e "${RED}Invalid choice. Try again.${NC}" ;;
    esac
    
    echo -e "\n"
    read -p "Press Enter to continue..."
    clear
done