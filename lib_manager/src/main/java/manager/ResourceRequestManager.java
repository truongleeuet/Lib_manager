package manager;

import java.util.List;

public interface ResourceRequestManager {

  public boolean add(ResourceRequest resourceRequest);

  public boolean remove(String resourceID, String patronID);

  public boolean update(ResourceRequest resourceRequest);

  public ResourceRequest get(String resourceID, String patronID);

  public List<ResourceRequest> gets();

  public List<ResourceRequest> getAllByPatron(String patronID);

  public List<ResourceRequest> getAllByResource(String resourceID);
}