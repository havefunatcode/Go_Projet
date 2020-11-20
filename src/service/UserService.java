package service;

import vo.UserVO;

public interface UserService {
	public UserVO login(String id,String password);
	public UserVO login(UserVO vo);
}
