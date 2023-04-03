public class Lasagna {
    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int actual_minutes_in_oven) {
        return expectedMinutesInOven() - actual_minutes_in_oven;
    }

    public int preparationTimeInMinutes(int layers) {
        return 2 * layers;
    }

    public int totalTimeInMinutes(int layers, int actual_minutes_in_oven) {
        return preparationTimeInMinutes(layers) + actual_minutes_in_oven;
    }
}
