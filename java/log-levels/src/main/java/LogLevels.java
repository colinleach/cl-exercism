public class LogLevels {

    private static String[] getBits(String logLine) {
        return logLine.split("]: ");
    }

    public static String message(String logLine) {
        String[] bits = getBits(logLine);
        return bits[1].trim();
    }

    public static String logLevel(String logLine) {
        String[] bits = getBits(logLine);
        return bits[0].replace("[", "").toLowerCase();
    }

    public static String reformat(String logLine) {
        return String.format("%s (%s)", message(logLine), logLevel(logLine));
    }
}
