package manager;

import java.util.List;

public interface ResourceBorrowManager {

  public boolean add(ResourceBorrow resourceBorrow);

  public boolean remove(String resourceID, String patronID);

  public boolean update(ResourceBorrow resourceBorrow);

  public ResourceBorrow get(String resourceID, String patronID);

  public List<ResourceBorrow> gets();

  public List<ResourceBorrow> getAllByPatron(String patronID);

  public List<ResourceBorrow> getAllByResource(String resourceID);
}