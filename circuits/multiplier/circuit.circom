pragma circom 2.0.0;

/*This circuit takes in two values A and B, then passes it into logic gates*/

template Multiplier2 () {  

   // Signal inputs
   signal input A;
   signal input B;

   // Imported component gates
   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   // Circuit logic
   // AND gate
   andGate.a <== A;
   andGate.b <== B;

    // Internal signals from gates
   signal X;
   signal Y;

   X <== andGate.out;

   // NOT gate
   notGate.in <== B;

   Y <== notGate.out;

   // OR gate
   orGate.a <== X;
   orGate.b <== Y;

   // Final signal output
   signal output Q;

   Q <== orGate.out;
}

// Imported from https://github.com/iden3/circomlib

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();