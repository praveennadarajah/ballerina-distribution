import ballerina/test;

(any|error)[] outputs = [];
int counter = 0;

// This is the mock function which will replace the real function
@test:Mock {
    moduleName: "ballerina/io",
    functionName: "println"
}
public function mockPrint(any|error... s) {
    string outstr = "";
    foreach var str in s {
        outstr = outstr + str.toString();
    }
    outputs[counter] = outstr;
    counter += 1;
}

@test:Config {}
function testFunc() {
    // Invoking the main function
    main();
    string out1 = "Concat Result: Hello World!";
    string out2 = "Add Result: 15";
    test:assertEquals(outputs[0], out1);
    test:assertEquals(outputs[1], out2);
}
