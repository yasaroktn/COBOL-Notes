       IDENTIFICATION DIVISION.
       PROGRAM-ID.  hello.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 AGE PIC 9(2).
       01 NAME PIC X(20).
       PROCEDURE DIVISION.
       DISPLAY "Enter your name :"
       ACCEPT NAME.
       DISPLAY "Enter your age :"
       ACCEPT AGE.
       DISPLAY "Hello " NAME "Your age " AGE.
       STOP RUN.
