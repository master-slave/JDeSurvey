package com.jd.survey.dao.defaults;

import com.jd.survey.domain.security.User;
import com.jd.survey.domain.settings.Department;
import com.jd.survey.domain.settings.SurveyDefinition;
import com.jd.survey.service.security.UserService;
import com.jd.survey.service.settings.SurveySettingsService;
import org.hibernate.annotations.DynamicUpdate;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

import static junit.framework.Assert.*;

@DynamicUpdate(value = true)
@RunWith(SpringJUnit4ClassRunner.class)
@TestExecutionListeners({
        DependencyInjectionTestExecutionListener.class,
        DirtiesContextTestExecutionListener.class,
        TransactionalTestExecutionListener.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
@ContextConfiguration(locations = {"classpath:xml/internal/service-context.xml"})
public class DepartmentServiceTest {

    @Autowired
    private SurveySettingsService surveySettingsService;

    @Autowired
    private UserService userService;

    @Test
    public void findBy() {
        try {
            Department department = surveySettingsService.department_findById(1l);
            assertNotNull(department);
            String departmentName = "Demonstration Department";
            assertEquals(departmentName, department.getName());

            department = surveySettingsService.department_findByName(departmentName);
            assertNotNull(department);
            assertEquals(departmentName, department.getName());
        } catch (Exception e) {
            fail();
        }
    }


    @Test
    public void findById() {
        try {
            Department department = surveySettingsService.department_findById(1l);
            assertNotNull(department);
            assertEquals("Demonstration Department", department.getName());
        } catch (Exception e) {
            fail();
        }
    }

    @Test
    public void findAllUser() {
        try {
            User user = userService.user_findByLogin("admin");
            Set<Department> departments = surveySettingsService.department_findAll(user);
            assertEquals(1, departments.size());
        } catch (Exception e) {
            fail();
        }
    }


    @Test
    public void findAll() {
        try {
            Set<Department> departments = surveySettingsService.department_findAll();
            assertNotNull(departments);
            assertEquals(1, departments.size());
        } catch (Exception e) {
            fail();
        }
    }

    @Ignore
    @Test
    public void findAllRange() {
        try {
            Set<Department> departments = surveySettingsService.department_findAll(0, 0);
            assertNotNull(departments);
            assertEquals(0, departments.size());

            departments = surveySettingsService.department_findAll(0, 1);
            assertEquals(1, departments.size());
        } catch (Exception e) {
            fail();
        }
    }

    @Test
    public void remove() {
        try {
            Department department = surveySettingsService.department_findById(1l);
            surveySettingsService.department_remove(department);
            Set<Department> departments = surveySettingsService.department_findAll();
            assertNotNull(department);
            assertEquals(0, departments.size());
        } catch (Exception e) {
            fail();
        }
    }

}
