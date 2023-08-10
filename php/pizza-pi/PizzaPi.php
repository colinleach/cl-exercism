<?php

class PizzaPi
{
    public function calculateDoughRequirement($numPizzas, $persons)
    {
        return (200 + ($persons * 20)) * $numPizzas;
    }

    public function calculateSauceRequirement($numPizzas, $canVolume)
    {
        return 125 * $numPizzas / $canVolume;
    }

    public function calculateCheeseCubeCoverage($cubsSide, $thickness, $diameter)
    {
        return floor($cubsSide ** 3 / ($thickness * pi() * $diameter));
    }

    public function calculateLeftOverSlices($pizzas, $friends)
    {
        return  (8 * $pizzas) % $friends;
    }
}
