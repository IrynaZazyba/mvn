package domain.entities;

import java.util.Comparator;

/**
 * Created by ladyi on 27.11.2018.
 */
public class QComparator implements Comparator<Questions> {

    @Override
    public int compare(Questions o1, Questions o2) {
        return o1.getId().compareTo(o2.getId());
    }
}
