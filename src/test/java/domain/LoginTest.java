package domain;

import domain.controller.MainController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.core.StringContains.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Created by ladyi on 14.12.2018.
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class LoginTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private MainController controller;

    @Test
    public void test() throws Exception {
        this.mockMvc.perform(get("/"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Hello, guest")));
    }

    @Test
    public void accessDeniedTest() throws Exception {
        this.mockMvc.perform(get("/testsRun"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("http://localhost/"));
    }

    @Test
    public void correctLoginTest() throws Exception {
        this.mockMvc.perform(formLogin().user("u").password("1"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("http://localhost/"));
    }

    @Test
    public void badCredentials() throws Exception {
        this.mockMvc.perform(formLogin().user("u").password("123"))
                .andDo(print())
                .andExpect(status().is3xxRedirection())
                .andExpect(xpath("//*[@id='navbarSupportedContent']/button").string("Log in"));
    }



}
