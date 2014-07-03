; RUN: %p/../Inputs/clang-proxy.sh %p/../Inputs/lsp-lots-of-objs.cpp -S -emit-llvm -o %t -O0
; RUN: llvm-link %t %p/../Inputs/lsp-library.ll -S -o %t
; RUN: opt %t -S -o %t -spp-no-call -spp-no-entry -place-safepoints -spp-all-functions 
; RUN: llc -spp-all-functions -filetype=asm < %t
; RUN: llc -spp-all-functions < %t | FileCheck %s

; CHECK: StackMaps