package com.hougo.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import java.util.Properties;

public class HibernateConfig {
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration();
                Properties settings = new Properties();

                settings.put(Environment.DRIVER, "com.microsoft.sqlserver.jdbc.SQLServerDriver");
                // Đổi tên Database, user, password tương ứng máy của bạn:
                settings.put(Environment.URL, "jdbc:sqlserver://localhost:1433;databaseName=HougoHotpotDB;encrypt=true;trustServerCertificate=true");
                settings.put(Environment.USER, "sa");
                settings.put(Environment.PASS, "123456");
                settings.put(Environment.SHOW_SQL, "true");
                settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

                configuration.setProperties(settings);

                // Sau này có Entity nào bạn chỉ cần khai báo thêm vào đây:
                // configuration.addAnnotatedClass(BanAn.class);
                // configuration.addAnnotatedClass(MonAn.class);

                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(configuration.getProperties()).build();
                sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return sessionFactory;
    }
}