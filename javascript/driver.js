// var HashMap = require('./starter-code/hash-map.js');
var HashMap = require('./solution/hash-map.js');


/* Initialize a hashMap of array length 13. 13 is prime. 13 is magic. */
var hMap = new HashMap(13);

var paragraph = "In computer science an associative array, map, symbol table, or dictionary is an abstract data type composed of a collection of key value pairs, such that each possible key appears at most once in the collection."

console.log('creating hashmap from paragraph')
// /* Rip the above paragraph into an array and feed each word into the hashMap. */
paragraph.split(' ').forEach(function add(word) { hMap.put(word, word.split('').reverse().join('')); });


console.log('running hMap.put(\'fruit\', \'apple\')')
hMap.put('fruit', 'apple');

/* Demonstrate the get() method */
console.log('running hMap.get(\'fruit\')');
var found = hMap.get('fruit');
console.log('Found:', found);

console.log('runnig hMap.set(\'fruit\', \'banana\')');
/* TODO: Implement the `set` method! */
hMap.set('fruit', 'banana');

console.log('running hMap.remove(\'is\')');
/* Demonstrate the remove() method */
var deleted = hMap.remove('is');
console.log('Deleted;',  deleted);

/* Print the hashMap in it's connected entirity */
console.log('printing hashmap');
hMap.print();

/* Print a list of keys*/
keys = hMap.keySet();
console.log(keys);

// The list should contain "fruit" and should not contain "is"!
