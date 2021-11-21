module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven minutesSoFar = expectedMinutesInOven - minutesSoFar

let preparationTimeInMinutes layerCount = layerCount * 2

let elapsedTimeInMinutes layerCount minutesSoFar = 
    preparationTimeInMinutes layerCount + minutesSoFar