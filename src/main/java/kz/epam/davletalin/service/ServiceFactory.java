package kz.epam.davletalin.service;

import java.util.HashMap;
import java.util.Map;

public class ServiceFactory {
    private static final Map<String, Service> SERVICE_MAP = new HashMap<>();
    private static final ServiceFactory SERVICE_FACTORY = new ServiceFactory();

    public ServiceFactory() {
        init();
    }

    private void init() {
        SERVICE_MAP.put("/login", new LogInService());
        SERVICE_MAP.put("/logout", new LogoutService());
        SERVICE_MAP.put("/vechicle", new VechicleService());
        SERVICE_MAP.put("/registration", new RegistrationService());
        SERVICE_MAP.put("/delete", new UserDeleteService());
    }

    public static ServiceFactory getInstance() {
        return SERVICE_FACTORY;
    }

    public Service getService(String request) {
        return SERVICE_MAP.get(request);
    }
}
