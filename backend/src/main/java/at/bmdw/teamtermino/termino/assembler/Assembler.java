package at.bmdw.teamtermino.termino.assembler;

public interface Assembler <S, T> {

    T assemble(S source);

}
