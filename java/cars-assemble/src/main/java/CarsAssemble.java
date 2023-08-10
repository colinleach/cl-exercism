public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        int carsPerHour = 221 * speed;
        if (speed <= 4) {
            return carsPerHour;
        }
        if (speed <= 8) {
            return carsPerHour * 0.9;
        }
        return (speed == 9) ? carsPerHour * 0.8 : carsPerHour * 0.77;
    }

    public int workingItemsPerMinute(int speed) {
        final double perMin = productionRatePerHour(speed) / 60;
        return (int) Math.floor(perMin);
    }
}
