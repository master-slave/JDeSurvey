package com.jd.survey.dao.defaults;

import com.jd.survey.dao.interfaces.survey.SurveyDAO;
import com.jd.survey.domain.security.User;
import com.jd.survey.domain.settings.Department;
import com.jd.survey.domain.survey.Survey;
import com.jd.survey.service.security.UserService;
import com.jd.survey.service.settings.SurveySettingsService;
import com.jd.survey.service.survey.SurveyService;
import org.hibernate.annotations.DynamicUpdate;
import org.junit.After;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.AfterTransaction;
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
public class SurveyServiceTest {

    private static final long SURVEY_DEFINITION_ID = 10L;
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private SurveySettingsService surveySettingsService;

    @Autowired
    private SurveyDAO surveyDAO;

    @Autowired
    private UserService userService;

    @Test
    public void createSurvey() {
        try {
            surveySettingsService.surveyDefinition_publish(SURVEY_DEFINITION_ID);
            Survey survey = surveyService.survey_create(SURVEY_DEFINITION_ID, "admin", "127.0.0.1");
            assertNotNull(survey);
        } catch (Exception e) {
            e.printStackTrace();
            fail();
        }
    }

    @AfterTransaction
    public void cleanup() {
        try {
            surveyDAO.deleteSurveyDataTable(SURVEY_DEFINITION_ID);
        } catch (Exception e) {
            e.printStackTrace();
            fail();
        }
    }
}
