#!/bin/bash
# This script builds and generates the necessary jni wrappers/native libraries.
# Note: Must have SWIG and Android NDK packages installed.
# WARNING: This only works with android ndk r14b.
cd src/main/java

# Check to see if there is a native directory
if test -d "ca/murillo/swigexample/jni";
then echo "ca/murillo/swigexample/jni";
else mkdir "ca/murillo/swigexample/jni";
fi

if test -f "swig_tool_config.txt";
then echo "SWIG path file exists."
else {
    echo "SWIG path file does not exists."
    cat > "swig_tool_config.txt"
}
fi

SWIG=$(cat "swig_tool_config.txt")

# Run the swig command to generate java/C wrapper based on interface file
$SWIG -java -package ca.murillo.swigexample.jni -outdir ca/murillo/swigexample/jni -I../cpp/includes -o ../cpp/source/c_source_example_wrap.c ../swig/c_source_example.i
