package com.jd.survey.dao.defaults;

import com.jd.survey.domain.security.User;
import com.jd.survey.domain.settings.SurveyDefinition;
import com.jd.survey.domain.survey.Survey;
import com.jd.survey.service.security.UserService;
import com.jd.survey.service.settings.SurveySettingsService;
import com.jd.survey.service.survey.SurveyService;
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

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.fail;

@DynamicUpdate(value = true)
@RunWith(SpringJUnit4ClassRunner.class)
@TestExecutionListeners({
        DependencyInjectionTestExecutionListener.class,
        DirtiesContextTestExecutionListener.class,
        TransactionalTestExecutionListener.class})
@Transactional
@TransactionConfiguration(defaultRollback = true)
@ContextConfiguration(locations = {"classpath:xml/internal/service-context.xml"})
public class SurveySettingsTest {

    @Autowired
    private SurveySettingsService surveySettingsService;

    @Autowired
    private UserService userService;

    @Transactional
    @Test
    public void findAllInternal() {
        try {
            User user = userService.user_findByLogin("admin");
            Set<SurveyDefinition> sSurveyDefinition = surveySettingsService.surveyDefinition_findAllInternal(user);
            assertNotNull(sSurveyDefinition);
            assertEquals(3, sSurveyDefinition.size());
        } catch (Exception e) {
            fail();
        }
    }

    @Test
    public void remove() {
        try {
            User user = userService.user_findByLogin("admin");
            Set<SurveyDefinition> sSurveyDefinition = surveySettingsService.surveyDefinition_findAllInternal(user);
            surveySettingsService.surveyDefinition_remove(sSurveyDefinition.iterator().next());
            sSurveyDefinition = surveySettingsService.surveyDefinition_findAllInternal(user);
            assertNotNull(sSurveyDefinition);
            assertEquals(2, sSurveyDefinition.size());
        } catch (Exception e) {
            fail();
        }
    }

}
