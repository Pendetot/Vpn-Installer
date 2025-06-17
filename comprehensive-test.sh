#!/bin/bash

# Comprehensive Menu System Test Script
echo "🧪 COMPREHENSIVE MENU SYSTEM TESTING"
echo "===================================="
echo ""

# Test 1: File Existence and Permissions
echo "📁 TEST 1: File Existence and Permissions"
echo "----------------------------------------"

menu_files=(
    "ssh/menu.sh"
    "ssh/ssh-menu.sh" 
    "ssh/vpn-menu.sh"
    "ssh/advanced-menu.sh"
    "ssh/xray-menu.sh"
    "ssh/system-menu.sh"
    "ssh/service-status.sh"
    "ssh/auto-menu.sh"
    "ssh/info.sh"
    "ssh/about.sh"
    "update/menu.sh"
)

all_files_exist=true
all_files_executable=true

for file in "${menu_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        echo "✅ $file exists"
        if [ -x "/home/user/workspace/$file" ]; then
            echo "   ✅ $file is executable"
        else
            echo "   ❌ $file is NOT executable"
            all_files_executable=false
        fi
    else
        echo "❌ $file MISSING"
        all_files_exist=false
    fi
done

echo ""

# Test 2: Syntax Validation
echo "🔍 TEST 2: Syntax Validation"
echo "----------------------------"

syntax_errors=false
for file in "${menu_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        if bash -n "/home/user/workspace/$file" 2>/dev/null; then
            echo "✅ $file syntax OK"
        else
            echo "❌ $file has SYNTAX ERRORS"
            bash -n "/home/user/workspace/$file"
            syntax_errors=true
        fi
    fi
done

echo ""

# Test 3: Color Definitions Test
echo "🎨 TEST 3: Color Definitions"
echo "---------------------------"

color_test_passed=true
for file in "${menu_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ] && [[ "$file" == *menu.sh ]]; then
        if grep -q "RESET=" "/home/user/workspace/$file" && grep -q "GREEN=" "/home/user/workspace/$file"; then
            echo "✅ $file has color definitions"
        else
            echo "❌ $file missing color definitions"
            color_test_passed=false
        fi
    fi
done

echo ""

# Test 4: Branding Test
echo "🏷️  TEST 4: Branding Verification"
echo "--------------------------------"

branding_test_passed=true
key_files=("ssh/info.sh" "ssh/about.sh" "ssh/menu.sh")

for file in "${key_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        if grep -q "Athena Project" "/home/user/workspace/$file" || grep -q "Mas Ventod" "/home/user/workspace/$file"; then
            echo "✅ $file has updated branding"
        else
            echo "❌ $file missing updated branding"
            branding_test_passed=false
        fi
        
        if grep -q "@masventot" "/home/user/workspace/$file"; then
            echo "✅ $file has telegram contact"
        else
            echo "⚠️  $file missing telegram contact (may be optional)"
        fi
    fi
done

echo ""

# Test 5: Menu Structure Test
echo "📋 TEST 5: Menu Structure"
echo "------------------------"

structure_test_passed=true

# Check main menu has submenu calls
if grep -q "ssh-menu" "/home/user/workspace/ssh/menu.sh" && 
   grep -q "vpn-menu" "/home/user/workspace/ssh/menu.sh" &&
   grep -q "advanced-menu" "/home/user/workspace/ssh/menu.sh"; then
    echo "✅ Main menu has submenu navigation"
else
    echo "❌ Main menu missing submenu navigation"
    structure_test_passed=false
fi

# Check submenus have back navigation
submenu_files=("ssh/ssh-menu.sh" "ssh/vpn-menu.sh" "ssh/advanced-menu.sh" "ssh/xray-menu.sh" "ssh/system-menu.sh")
for file in "${submenu_files[@]}"; do
    if [ -f "/home/user/workspace/$file" ]; then
        if grep -q "menu" "/home/user/workspace/$file" && grep -q "0)" "/home/user/workspace/$file"; then
            echo "✅ $file has back navigation"
        else
            echo "❌ $file missing back navigation"
            structure_test_passed=false
        fi
    fi
done

echo ""

# Test 6: Installation Script Integration
echo "⚙️  TEST 6: Installation Script Integration"
echo "-----------------------------------------"

install_test_passed=true
if grep -q "ssh-menu" "/home/user/workspace/ssh/ssh-vpn.sh" &&
   grep -q "vpn-menu" "/home/user/workspace/ssh/ssh-vpn.sh" &&
   grep -q "chmod +x ssh-menu" "/home/user/workspace/ssh/ssh-vpn.sh"; then
    echo "✅ Installation script includes new menu files"
    echo "✅ Installation script sets proper permissions"
else
    echo "❌ Installation script missing menu integration"
    install_test_passed=false
fi

echo ""

# Test 7: Service Status Function Test
echo "📊 TEST 7: Service Status Functions"
echo "----------------------------------"

service_test_passed=true
if [ -f "/home/user/workspace/ssh/service-status.sh" ]; then
    if grep -q "check_service_status" "/home/user/workspace/ssh/service-status.sh" &&
       grep -q "show_running_services" "/home/user/workspace/ssh/service-status.sh"; then
        echo "✅ Service status functions defined"
    else
        echo "❌ Service status functions missing"
        service_test_passed=false
    fi
    
    # Test if main menu sources service status
    if grep -q "service-status.sh" "/home/user/workspace/ssh/menu.sh"; then
        echo "✅ Main menu sources service status"
    else
        echo "⚠️  Main menu may not source service status (check manually)"
    fi
else
    echo "❌ Service status script missing"
    service_test_passed=false
fi

echo ""

# Final Results
echo "📊 FINAL TEST RESULTS"
echo "====================="

total_tests=7
passed_tests=0

if [ "$all_files_exist" = true ] && [ "$all_files_executable" = true ]; then
    echo "✅ File System Test: PASSED"
    ((passed_tests++))
else
    echo "❌ File System Test: FAILED"
fi

if [ "$syntax_errors" = false ]; then
    echo "✅ Syntax Validation: PASSED"
    ((passed_tests++))
else
    echo "❌ Syntax Validation: FAILED"
fi

if [ "$color_test_passed" = true ]; then
    echo "✅ Color Definitions: PASSED"
    ((passed_tests++))
else
    echo "❌ Color Definitions: FAILED"
fi

if [ "$branding_test_passed" = true ]; then
    echo "✅ Branding Update: PASSED"
    ((passed_tests++))
else
    echo "❌ Branding Update: FAILED"
fi

if [ "$structure_test_passed" = true ]; then
    echo "✅ Menu Structure: PASSED"
    ((passed_tests++))
else
    echo "❌ Menu Structure: FAILED"
fi

if [ "$install_test_passed" = true ]; then
    echo "✅ Installation Integration: PASSED"
    ((passed_tests++))
else
    echo "❌ Installation Integration: FAILED"
fi

if [ "$service_test_passed" = true ]; then
    echo "✅ Service Status: PASSED"
    ((passed_tests++))
else
    echo "❌ Service Status: FAILED"
fi

echo ""
echo "📈 OVERALL SCORE: $passed_tests/$total_tests tests passed"

if [ $passed_tests -eq $total_tests ]; then
    echo "🎉 ALL TESTS PASSED! Menu system is ready for production."
    exit 0
else
    echo "⚠️  Some tests failed. Review the issues above."
    exit 1
fi
