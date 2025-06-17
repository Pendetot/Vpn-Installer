#!/bin/bash

# Auto-Update System Test Script
echo "🔄 AUTO-UPDATE SYSTEM TESTING"
echo "============================="
echo ""

# Test 1: File Existence
echo "📁 TEST 1: Auto-Update Files"
echo "----------------------------"

auto_update_files=(
    "ssh/auto-update.sh"
    "ssh/auto-menu.sh" 
    "ssh/setup-auto-launch.sh"
)

files_exist=true
for file in "${auto_update_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        echo "✅ $file exists"
        if [ -x "/home/user/workspace/$file" ]; then
            echo "   ✅ $file is executable"
        else
            echo "   ❌ $file is NOT executable"
            files_exist=false
        fi
    else
        echo "❌ $file MISSING"
        files_exist=false
    fi
done

echo ""

# Test 2: Syntax Validation
echo "🔍 TEST 2: Syntax Validation"
echo "----------------------------"

syntax_ok=true
for file in "${auto_update_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        if bash -n "/home/user/workspace/$file" 2>/dev/null; then
            echo "✅ $file syntax OK"
        else
            echo "❌ $file has SYNTAX ERRORS"
            bash -n "/home/user/workspace/$file"
            syntax_ok=false
        fi
    fi
done

echo ""

# Test 3: Auto-Update Functions
echo "⚙️  TEST 3: Auto-Update Functions"
echo "--------------------------------"

functions_ok=true
if [ -f "/home/user/workspace/ssh/auto-update.sh" ]; then
    required_functions=(
        "log_message"
        "should_check_update"
        "get_local_version"
        "get_remote_version"
        "backup_current"
        "apply_update"
        "check_and_update"
    )
    
    for func in "${required_functions[@]}"; do
        if grep -q "^$func()" "/home/user/workspace/ssh/auto-update.sh"; then
            echo "✅ Function $func found"
        else
            echo "❌ Function $func missing"
            functions_ok=false
        fi
    done
else
    echo "❌ auto-update.sh not found"
    functions_ok=false
fi

echo ""

# Test 4: Configuration Variables
echo "⚙️  TEST 4: Configuration Variables"
echo "----------------------------------"

config_ok=true
if [ -f "/home/user/workspace/ssh/auto-update.sh" ]; then
    required_vars=(
        "GITHUB_REPO"
        "BRANCH"
        "UPDATE_LOG"
        "VERSION_FILE"
        "LAST_CHECK_FILE"
    )
    
    for var in "${required_vars[@]}"; do
        if grep -q "^$var=" "/home/user/workspace/ssh/auto-update.sh"; then
            echo "✅ Variable $var configured"
        else
            echo "❌ Variable $var missing"
            config_ok=false
        fi
    done
else
    echo "❌ auto-update.sh not found"
    config_ok=false
fi

echo ""

# Test 5: Installation Script Integration
echo "📦 TEST 5: Installation Integration"
echo "----------------------------------"

install_ok=true
if grep -q "auto-update" "/home/user/workspace/ssh/ssh-vpn.sh"; then
    echo "✅ auto-update included in installation script"
    if grep -q "chmod +x auto-update" "/home/user/workspace/ssh/ssh-vpn.sh"; then
        echo "✅ auto-update permissions set in installation"
    else
        echo "❌ auto-update permissions missing in installation"
        install_ok=false
    fi
else
    echo "❌ auto-update missing from installation script"
    install_ok=false
fi

echo ""

# Test 6: System Menu Integration
echo "📋 TEST 6: System Menu Integration"
echo "---------------------------------"

menu_ok=true
if grep -q "Auto-Update System" "/home/user/workspace/ssh/system-menu.sh"; then
    echo "✅ Auto-update section added to system menu"
    
    # Check for update options
    update_options=("Update Status" "Check for Updates" "Force Update" "Setup Auto-Update")
    for option in "${update_options[@]}"; do
        if grep -q "$option" "/home/user/workspace/ssh/system-menu.sh"; then
            echo "✅ Option: $option found"
        else
            echo "❌ Option: $option missing"
            menu_ok=false
        fi
    done
else
    echo "❌ Auto-update section missing from system menu"
    menu_ok=false
fi

echo ""

# Test 7: Auto-Menu Integration
echo "🚀 TEST 7: Auto-Menu Integration"
echo "-------------------------------"

auto_menu_ok=true
if grep -q "auto-update" "/home/user/workspace/ssh/auto-menu.sh"; then
    echo "✅ Auto-update integrated into auto-menu"
else
    echo "❌ Auto-update missing from auto-menu"
    auto_menu_ok=false
fi

echo ""

# Test 8: Setup Script Functionality
echo "⚙️  TEST 8: Setup Script Features"
echo "--------------------------------"

setup_ok=true
if [ -f "/home/user/workspace/ssh/setup-auto-launch.sh" ]; then
    setup_features=(
        "auto-update"
        "alias menu="
        "alias update-check="
        "alias update-status="
        "alias update-force="
        "athena-version"
        "athena-update.log"
    )
    
    for feature in "${setup_features[@]}"; do
        if grep -q "$feature" "/home/user/workspace/ssh/setup-auto-launch.sh"; then
            echo "✅ Feature: $feature configured"
        else
            echo "❌ Feature: $feature missing"
            setup_ok=false
        fi
    done
else
    echo "❌ setup-auto-launch.sh not found"
    setup_ok=false
fi

echo ""

# Final Results
echo "📊 FINAL TEST RESULTS"
echo "====================="

total_tests=8
passed_tests=0

test_results=(
    "$files_exist" "File System Test"
    "$syntax_ok" "Syntax Validation"
    "$functions_ok" "Function Definitions"
    "$config_ok" "Configuration Variables"
    "$install_ok" "Installation Integration"
    "$menu_ok" "Menu Integration"
    "$auto_menu_ok" "Auto-Menu Integration"
    "$setup_ok" "Setup Script Features"
)

for ((i=0; i<${#test_results[@]}; i+=2)); do
    result=${test_results[i]}
    name=${test_results[i+1]}
    
    if [ "$result" = "true" ]; then
        echo "✅ $name: PASSED"
        ((passed_tests++))
    else
        echo "❌ $name: FAILED"
    fi
done

echo ""
echo "📈 OVERALL SCORE: $passed_tests/$total_tests tests passed"

if [ $passed_tests -eq $total_tests ]; then
    echo "🎉 ALL AUTO-UPDATE TESTS PASSED! System is ready for deployment."
    exit 0
else
    echo "⚠️  Some tests failed. Review the issues above."
    exit 1
fi
