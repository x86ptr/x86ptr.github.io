---
layout: post
title: Hello World!
introduction: Cheers from the x86 district, where our bits and bytes are always in the mood for a tech-inspired celebration!
date: 2022-01-15 
modified_date:
categories: 
  - Programming
tags:  
  - asm
author: Mehdi Karimi
permalink: /:year/:month/:day/:title
comments: false
---

# Greetings from the x86 architecture

```x86asm
section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; write the string to stdout
    mov eax, 4          ; syscall number (sys_write)
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; pointer to the string
    mov edx, 13         ; length of the string
    int 0x80            ; make the system call

    ; exit the program
    mov eax, 1          ; syscall number (sys_exit)
    xor ebx, ebx        ; exit code (0)
    int 0x80            ; make the system call

```
