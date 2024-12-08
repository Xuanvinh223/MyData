// // ...spread
// var arr1 = [1,2,3,4]
// var arr2 = [10,20,30,40]
// var arr3 = [...arr1,...arr2]
// console.log(arr3);
// // ...rest
// const { 
//     a = 'default', 
//     b, 
//     ...rest 
// } = {
//     b: 'val1',
//     c: 'val2',
//     d: 'val3'
// };

// console.log(a, b, rest);

import logger from  './logger.js'; 
import {TYPE_ERROR, TYPE_LOG, TYPE_WARN} from  './constants.js'; 

logger("hello",TYPE_WARN)