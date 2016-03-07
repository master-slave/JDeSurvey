package com.jd.survey.dao.defaults;

import com.jd.survey.domain.security.User;
import com.jd.survey.domain.settings.SurveyDefinition;
import com.jd.survey.service.security.UserService;
import com.jd.survey.service.settings.SurveySettingsService;
import org.hibernate.annotations.DynamicUpdate;
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
public class SprintTest {

/*    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Test
    public void remove() {
        try {
            User user = userService.findById(1);
            Set<Product> products = productService.findAll(user);
            productService.remove(products.iterator().next());
            products = productService.findAll(user);
            assertEquals(2, products.size());
        } catch (Exception e) {
            fail();
        }
    }*/

}
