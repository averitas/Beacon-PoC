package com.web.beacon.model;

import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.junit.Test;
import org.mockito.Mockito;
import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import org.mockito.Matchers;


public class TestPatientDAO {

	public Patient mockGetPat(){
		Query testQ = Mockito.mock(Query.class);
		List<Patient> mlist = new ArrayList<Patient>();
		mlist.add(new Patient("testun","testpw","testfn","testln","testem","testad"));
		when(testQ.list()).thenReturn(mlist);
		
		List<Patient> listUser = (List<Patient>)testQ.list();
		
		if(listUser!=null&&!listUser.isEmpty()){
			return listUser.get(0);
		}
		return null;
	}
	
	@Test
	public void testDao(){
		PatientDAO pdao = Mockito.mock(PatientDAO.class);
		Patient tr = new Patient("testun","testpw","testfn","testln","testem","testad");
		when(pdao.getPat("name")).thenReturn(tr);
		
		assertEquals(tr,pdao.getPat("name"));
	}
	
	@Test
	public void testGetPat(){
		Patient p = mockGetPat();
		assertEquals(new Patient("testun","testpw","testfn","testln","testem","testad"), p);
	}

	
	@Test
	public void testUserEquals(){
		User u = new User("testun","testpw");
		assertEquals(new User("testun","testpw"),u);
	}
	
	@Test
	public void testPatientEquals(){
		Patient p = new Patient("testun","testpw","testfn","testln","testem","testad");
		Patient p2 = new Patient("testun","testpw","testfn","testln","testem","testad");
		
		assertEquals(p2, p);
	}
}
