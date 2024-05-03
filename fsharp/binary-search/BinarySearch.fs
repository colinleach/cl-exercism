module BinarySearch

let find input value =
    let rec subfind first last =
        let mid = (first + last) / 2
        let mid_value = input [mid]
        if mid_value = value then Some mid
        else
            if mid_value < value then
                subfind first mid - 1
            else
                subfind (mid + 1) last
    
    subfind 0 (Array.length input)    

// def find(search_list, value):
//     length = len(search_list)
//     first = 0
//     last = length - 1
//     while first <= last:
//         mid = (first + last) // 2
//         if search_list[mid] == value:
//             return mid
//         if search_list[mid] < value:
//             first = mid + 1
//         else:
//             last = mid - 1
//     if first < length and search_list[first] == value:
//         return first
//     else:
//         raise ValueError("value not in array")