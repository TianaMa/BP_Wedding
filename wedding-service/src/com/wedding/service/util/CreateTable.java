package com.wedding.service.util;

import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.wedding.service.dao.CrudManager;
import com.wedding.service.entity.Admin;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Hotel;
import com.wedding.service.entity.Server;

public class CreateTable {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		Configuration configuration = new Configuration().configure();
		SchemaExport sm = new SchemaExport(configuration);
		sm.create(true, true);
		BeanFactory beanFactory = new ClassPathXmlApplicationContext(
				"applicationContext-*.xml");
		CrudManager crudManager = (CrudManager) beanFactory
				.getBean("crudManager");
		Admin admin = new Admin();
		admin.setName("admin");
		admin.setPassword("admin");
		crudManager.save(admin);
//		for (int i = 0; i < 10; i++) {
//			Company company = new Company();
//			company.setAddress("how to get there");
//			company.setDescription("perfect!");
//			company.setGrade(i / 2 + 1);
//			company.setName("Ï²À´ÀÖ  No." + i);
//			company.setPicture("pictures/cp" + i + ".jpg");
//			company.setPrice(i * 1000);
//			company.setPhone("158888888" + i);
//			company.setOrdered(false);
//			crudManager.save(company);
//			Hotel hotel = new Hotel();
//			hotel.setAddress("how to get there");
//			hotel.setDescription("perfect!");
//			hotel.setGrade(i / 2 + 1);
//			hotel.setName("ÓæÈËÂëÍ· No." + i);
//			hotel.setPicture("pictures/hp" + i + ".jpg");
//			hotel.setPrice(i * 1000);
//			hotel.setPhone("158888888" + i);
//			hotel.setCompany(company);
//			hotel.setOrdered(false);
//			crudManager.save(hotel);
//
//			Server server1 = new Server();
//			server1.setAddress("how to go to your home");
//			server1.setCompany(company);
//			server1.setDescription("perfect");
//			server1.setGrade(i / 2 + 1);
//			server1.setName("BMW74" + i);
//			server1.setPhone("1500629519" + i);
//			server1.setPicture("servers/" + "0_" + i + ".gif");
//			server1.setPosition("WC");
//			server1.setPrice(i * 1000);
//			server1.setOrdered(false);
//
//			Server server2 = new Server();
//			server2.setAddress("how to go to your home");
//			server2.setCompany(company);
//			server2.setDescription("perfect");
//			server2.setGrade(i / 2 + 1);
//			server2.setName("John"+i);
//			server2.setPicture("servers/"+ "1_" + i + ".gif");
//			server2.setPhone("1500629519" + i);
//			server2.setPosition("MC");
//			server2.setPrice(i * 1000);
//			server2.setOrdered(false);
//
//			Server server3 = new Server();
//			server3.setAddress("how to go to your home");
//			server3.setCompany(company);
//			server3.setDescription("perfect");
//			server3.setGrade(i / 2 + 1);
//			server3.setName("Tommy"+i);
//			server3.setPicture("servers/"+ "2_" + i + ".gif");
//			server3.setPhone("1500629519" + i);
//			server3.setPosition("FLORIST");
//			server3.setPrice(i * 1000);
//			server3.setOrdered(false);
//
//			Server server4 = new Server();
//			server4.setAddress("how to go to your home");
//			server4.setCompany(company);
//			server4.setDescription("perfect");
//			server4.setGrade(i / 2 + 1);
//			server4.setName("Rain" + i);
//			server4.setPhone("1500629519" + i);
//			server4.setPosition("MP");
//			server4.setPicture("servers/" + "3_"+ i + ".gif");
//			server4.setPrice(i * 1000);
//			server4.setOrdered(false);
//
//			Server server5 = new Server();
//			server5.setAddress("how to go to your home");
//			server5.setCompany(company);
//			server5.setDescription("perfect");
//			server5.setGrade(i / 2 + 1);
//			server5.setName("Michael" + i);
//			server5.setPhone("1500629519" + i);
//			server5.setPosition("PlANNER");
//			server5.setPicture("servers/" + "4_"+ i + ".gif");
//			server5.setPrice(i * 1000);
//			server5.setOrdered(false);
//
//			crudManager.save(server1);
//			crudManager.save(server2);
//			crudManager.save(server3);
//			crudManager.save(server4);
//			crudManager.save(server5);
//		}
	}
}
