package service.impl;

import model.User;
import repository.IUserRepositoty;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    public static IUserRepositoty userRepositoty=new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userRepositoty.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepositoty.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepositoty.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepositoty.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepositoty.updateUser(user);
    }

    @Override
    public List<User> search(String country) {
        return userRepositoty.search(country);
    }

    @Override
    public List<User> sort() {
        return userRepositoty.sort();
    }
}
