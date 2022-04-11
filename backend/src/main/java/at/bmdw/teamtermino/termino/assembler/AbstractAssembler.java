package at.bmdw.teamtermino.termino.assembler;



import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public abstract class AbstractAssembler<S,T> implements  Assembler<S,T> {

    public final List<T> assemble(Collection<S> source) {

        List<T> targetList = new ArrayList<>();
        source.forEach(s-> targetList.add(assemble(s)));
        return applySort(targetList);
    }

    protected List<T> applySort(List<T> list) {return list; }
}
