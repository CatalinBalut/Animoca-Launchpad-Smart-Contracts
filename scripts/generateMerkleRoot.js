
const { MerkleTree } = require("merkletreejs")
const keccak256 = require("keccak256")

let list = [
    0x555b03fD17Ca089feaCE5E68B31cAdf87424B488,
    0x17D32D28280e6EfBDC93840C5742101851dCF853,
    0x2D30eA8049Aa20541E565Fa69E54D737917537a7
];

let leaves = addresses.map(addr => keccak256(addr))
let merkleTree = new MerkleTree(leaves, keccak256, { sortPairs: true })
let rootHash = merkleTree.getRoot().toString('hex')

console.log(merkleTree);

console.log(rootHash);