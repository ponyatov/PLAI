var slice = function (arr, start, stop) {
if (typeof stop == "undefined")
stop = arr.length - 1;
var result = [];
for (var i = 0; i <= stop - start; i++) {
result[i] = arr[start + i];
}
return result;
}