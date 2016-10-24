var slice = function (arr, start, stop) {
var result = [];
for (var i = 0; i <= stop - start; i++) {
result[i] = arr[start + i];
}
return result;
}
