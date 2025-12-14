import com.psychic.AuthApplication;
import com.psychic.ucenter.mapper.XcCompanyUserMapper;
import com.psychic.ucenter.model.po.XcCompanyUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = AuthApplication.class)
public class TestAuthApp {

    @Autowired
    XcCompanyUserMapper xcCompanyUserMapper;

    @Test
    public void bing(){
        XcCompanyUser xcCompanyUser = new XcCompanyUser();
        xcCompanyUser.setCompanyId("2");
        xcCompanyUser.setUserId("2000079718406803457");
        xcCompanyUserMapper.insert(xcCompanyUser);
    }
}
