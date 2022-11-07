#!/bin/bash
function to_array {   
    len_str=${#s}
    for (( i=0;i<$len_str;i++ )); do  
        #Appends each letter to the array 
        arr[$i]=${s:i:1} 
      
    done 
}
function to_string {   
    len_of_arr=${#arr[@]}
    new_str=""
    for ((i=0;i<len_of_arr;i++)); do
        #Append each element to the empty string
        new_str+=${arr[i]}  
    done 
    echo $new_str
}
function rand {
    a=$1
    b=$2
    n=$(( $b - 1 ))
    #Generates a random number between 0 and the length of the array
    random_int=$(( $a + $RANDOM % $n )) 
    echo $random_int
}

function shuffle {   
    length=${#arr[@]}   
    for (( i=$length-1; i>=0; i-- )); do 
        #Call the random function with the a and b values, where a is 0 and b is the last element
        random_func=$(rand 0 $length)  

        #Swap the elements using the random integers generated 
        temp=${arr[i]}
        arr[i]=${arr[$random_func]}
        arr[$random_func]=$temp

    done
}
s=$1  
if [[ $# -eq 0 ]]; then  
      exit 0
fi
arr[0]=""
to_array
shuffle
to_string


