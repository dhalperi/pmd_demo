package com.github.dhalperi.pmd_demo;

/** An example class with a PMD-detected issue. */
public class Example {
    public static void  main(String[] args) {
        int y = 3; // PMD unused local variable warning.
        System.err.println("Hi");
    }
}
