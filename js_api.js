let log_bool = function (val) {
  if (val === 0) {
    console.log("false");
  }
  else {
    console.log("true");
  }
};
let imports = { env: { log_bool: log_bool } };

let importObject = {
  "imports": {
    "console.log": (arg) => console.log(arg),
    "mem": new WebAssembly.Memory({ initial: 1 }),
    "decode": (start, end) => {
      let typedArray = new Uint8Array(importObject.imports.mem.buffer, start, end)
      console.log(new TextDecoder("utf-8").decode(typedArray));
    }
  },
  "js": {
    "print": (arg) => document.writeln(arg),
    "g1": new WebAssembly.Global({ value: "i32", mutable: true }, 5)
  },
  "console.log": (arg) => console.log(arg),
  "mem": new WebAssembly.Memory({ initial: 1 })
}

fetch("js_api.wasm").then(response =>
  response.arrayBuffer()
).then(bytes => WebAssembly.instantiate(bytes, importObject))
  .then(response => {
    // response.instance.exports.getG1()
    // response.instance.exports.setG1(33)
    // response.instance.exports.populateMemory()
    // response.instance.exports.getAt(0)
    // response.instance.exports.getAt(10)
    // console.log(result)

    // console.log(importObject.imports.mem.buffer.byteLength);
    // console.log(importObject.imports.mem.grow(1));
    // console.log(importObject.imports.mem.buffer.byteLength);

    response.instance.exports.main()
  })