//
//  main.swift
//  Data Structures
//
//  Created by Gjvon Graves on 8/20/16.
//  Copyright (c) 2016 Mitnov. All rights reserved.
//

import Foundation

var arrayA: Array<Int> = [5,2,1,3,4]

/*The returned array is the array we are looking for.
The program starts by checking if the base case has been met. The recursive case: array.count >= 2.
The program splits the arrays accordingly and then sorts them both, then cutting our array in half recursively.
After hitting the base case, we can mindfully note the sort function returning different sets of arrays until it hits
our desired left and right arrays.
The sets are as followed:
LEFT[5] - RIGHT[2]
LEFT[3] - RIGHT[4]
LEFT[1] - RIGHT[3,4]
LEFT[5,2] - RIGHT[1,3,4]  WILL BE CONVERTED INTO [1,2,3,4,5] <----- RETURNED MERGE*/
func sort(var array:Array<Int>) -> Array<Int>
{
    if(array.count < 2)
    {
        return array;
    }

    let middleIndex:Int = (array.count / 2);
    let leftArray: Array<Int> = Array(array[0..<middleIndex]);
    let rightArray: Array<Int> = Array(array[middleIndex..<array.count]);
    return doMerge(sort(leftArray), arrayB:sort(rightArray));
}

func doMerge(arrayA:Array<Int>, arrayB:Array<Int>) -> Array<Int>
{
    var leftIndex = 0;
    var rightIndex = 0;
    var newArray:Array<Int> = [];
    while (leftIndex<arrayA.count && rightIndex<arrayB.count)
    {
        if(arrayA[leftIndex] > arrayB[rightIndex])
        {
            newArray.append(arrayB[rightIndex++]);
        }
        else if(arrayA[leftIndex] < arrayA[rightIndex])
        {
            newArray.append(arrayA[leftIndex++]);
        }
        else{
            newArray.append(arrayA[leftIndex++]);
            newArray.append(arrayB[rightIndex++]);
        }
    }
    /*The new array will be equal to the addition of old array's values and the new array we have created.
    This may seem a bit ambiguous at first but should become understanding with a bit of thorough analysis.
    If we have arrayA[1,2] on the left and arrayB[3] on the right, leftIndex == 1 and rightIndex == 0 after the
    first iteration. The code will return true so the while-loop continues to a second iteration. During this
    iteration leftIndex ==2. The while loop terminates and rightIndex still holds the value 0.
    With this known information, we now know what the next two lines of code will do.
    With the following example I have given above, the first line of code below will add nothing to the new array since
    the left side was already sorted and we placed the values into the new array. */
    newArray = newArray + Array(arrayA[leftIndex..<arrayA.count]);
    ///We simply add the right sided values to our new array. If an index is not touched at all, that is a clear
    ///indicator that the program will only need to add the arrays.
    newArray = newArray +  Array(arrayB[rightIndex..<arrayB.count]);
    return newArray;
}

//var mergedArray = sort(arrayA);
//print(mergedArray);


var myArray = arrayA + Array(arrayA[0..<1])
print(myArray);