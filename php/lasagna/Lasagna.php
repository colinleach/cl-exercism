<?php

declare(strict_types=1);

class Lasagna
{
    function expectedCookTime() {
        return 40;
    }

    function remainingCookTime($elapsed_minutes) {
        return $this->expectedCookTime() - $elapsed_minutes;
    }

    function totalPreparationTime($layers_to_prep) {
        $time_per_layer = 2;
        return $layers_to_prep * $time_per_layer;
    }

    function totalElapsedTime($layers_to_prep, $elapsed_minutes) {
        return $this->totalPreparationTime($layers_to_prep) + $elapsed_minutes;
    }

    function alarm() {
        return "Ding!";
    }
}
