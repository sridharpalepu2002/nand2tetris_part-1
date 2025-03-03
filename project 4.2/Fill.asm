// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
(LOOP)
  @KBD
  D=M          // Read keyboard input
  @DRAW
  D;JNE        // If key is pressed, jump to DRAW

  @CLEAR
  0;JMP        // Otherwise, jump to CLEAR

(DRAW)
  @SCREEN
  D=A          // Start at SCREEN memory address
  @addr
  M=D          // Store in addr
  @8192        // Number of words to fill (SCREEN memory size / 16-bit words)
  D=A
  @count
  M=D          // Store in count

(DRAW_LOOP)
  @addr
  A=M
  M=-1         // Set pixel to black
  @addr
  M=M+1        // Move to next pixel
  @count
  MD=M-1       // Decrement count
  @DRAW_LOOP
  D;JGT        // Repeat until count is 0

  @LOOP
  0;JMP        // Go back to listening loop

(CLEAR)
  @SCREEN
  D=A
  @addr
  M=D
  @8192
  D=A
  @count
  M=D

(CLEAR_LOOP)
  @addr
  A=M
  M=0          // Set pixel to white
  @addr
  M=M+1
  @count
  MD=M-1
  @CLEAR_LOOP
  D;JGT
@LOOP
0;JMP


