package at.bmdw.teamtermino.termino.assembler;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
@Slf4j
public class DateAssembler extends AbstractAssembler<String, Date> {

    static DateFormat df = new SimpleDateFormat("dd.MM.yyyy");

    @Override
    public Date assemble(String source) {
        if (StringUtils.isBlank(source)) {
            return null;
        }
        try {
            return df.parse(source);
        } catch (ParseException e) {
            log.error("error while parsing date", e);
            return null;
        }
    }
}
