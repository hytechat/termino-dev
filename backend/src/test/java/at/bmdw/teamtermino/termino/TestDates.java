package at.bmdw.teamtermino.termino;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;

public enum TestDates {
    MONDAY_8, MONDAY_10, MONDAY_15, MONDAY_16, WEDNESDAY_13, WEDNESDAY_14, FRIDAY_9, FRIDAY_11, FRIDAY_16, FRIDAY_17;

    static DateFormat df = new SimpleDateFormat("dd.MM.yyyy");

    public Date asDate() {
        String s = name();
        String day = s.substring(0, s.indexOf("_"));
        String hour = s.substring(s.indexOf("_") + 1);
        LocalDateTime ldt = LocalDate.now().with(TemporalAdjusters.next(DayOfWeek.valueOf(day))).atTime(Integer.parseInt(hour), 0);
        return Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
    }

    public String asString() {
        return df.format(asDate());
    }
}
