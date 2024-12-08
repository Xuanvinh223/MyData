package com.poly.Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	private static EntityManagerFactory factory;

	static public EntityManager getEntityManager() {
		System.out.println("Hello");
		if (factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("Assignment_FpolyOE");
			System.out.println("Kết nối CSDL thành công");
		}
		return factory.createEntityManager();
	}

	static public void shutDown() {

		if (factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
