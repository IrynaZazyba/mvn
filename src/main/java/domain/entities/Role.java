package domain.entities;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by ladyi on 05.11.2018.
 */
public enum Role implements GrantedAuthority {
    USER,ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
