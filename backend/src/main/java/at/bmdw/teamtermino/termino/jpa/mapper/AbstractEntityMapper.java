package at.bmdw.teamtermino.termino.jpa.mapper;

import at.bmdw.teamtermino.termino.assembler.Assembler;
import at.bmdw.teamtermino.termino.dto.AbstractDto;
import at.bmdw.teamtermino.termino.entity.AbstractEntity;
import com.google.common.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.UUID;

public abstract class AbstractEntityMapper<S extends AbstractDto, T extends AbstractEntity> implements Assembler<S, T> {

    @PersistenceContext
    private EntityManager entityManager;
    private final TypeToken<T> typeToken = new TypeToken<T>(getClass()) {
    };
    private Class<T> clazz = (Class<T>) typeToken.getRawType();

    protected abstract T updateEntity(T entity, S dto);

    @Override
    @Transactional
    public T assemble(S source) {
        T entity;
        boolean isInserting= StringUtils.isNoneBlank(source.getId());
        if (isInserting) {
            entity = entityManager.find(clazz, UUID.fromString(source.getId()));
        } else {
            entity = newInstance();
        }
        entity = updateEntity(entity, source);
        entityManager.persist(entity);
        source.setId(entity.getId().toString());
        afterInserting(entity, source);
        return entity;
    }

    private T newInstance() {
        try {
            return this.clazz.getDeclaredConstructor().newInstance();
        } catch (Exception e) {
            return null;
        }
    }
    protected void afterInserting(T entity, S dto) {

    }

}
